<%@ page import="community.Community_borderDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="service.ServiceDAO" %>
<%@ page import="community.Community_hitsDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    int pageNo = Integer.parseInt(request.getParameter("pageNo"));
    String member_id = null;
    String isSessionClassName;
    if(session.getAttribute("member_id") == null){
        member_id = "Non-member";
        isSessionClassName = "session_null";
    }else{
        member_id = (String) session.getAttribute("member_id");
        isSessionClassName = "session_notNull";
    }

    Cookie[] cookies = request.getCookies();
    Cookie currentCookie = null;
    String cookieName = "pageNo" + pageNo;

    if(cookies != null && cookies.length > 0){
        for(Cookie cookie: cookies){
            if(cookie.getName().equals(cookieName) && cookie.getValue().equals(member_id)){
                currentCookie = cookie;
            }
        }
    }

    if(currentCookie == null){

        currentCookie = new Cookie(cookieName, member_id);
        currentCookie.setMaxAge(60 * 60);

        new Community_hitsDAO().hitBorder(pageNo, member_id);
        int hits = new Community_hitsDAO().countHits(pageNo);
        int result = new Community_borderDAO().updateHits(pageNo,hits);
        if(result == 1){
            response.addCookie(currentCookie);
        }
    }

    ArrayList<Object> list = new Community_borderDAO().codeToBorder(pageNo);
    String[] memberInfo = new MemberDAO().memberPartyInfo((String) list.get(1));
    String[] serviceInfo = new ServiceDAO().selectService((String) list.get(2));
%>
<div class="community-border-modal">
    <form action="" name="" method="post">
        <div class="modal-World">
            <div class="modal-Box">
                <div class="modal-One-Line">
                    <div class="modal-Title">
                        <span class="border-Auto" id="title-Font"><!--제목 --><%=list.get(3)%></span>
                    </div>
                </div>
                <div class="modal-Two-Line">
                    <span id="movie-Font"><!--영화제목 --><%=list.get(4)%></span>
                </div>
                <div class ="modal-Three-Line">
                    <div class="modal-Genre">
                        <span id="modal-border-genre">
                            <!--장르 -->
                            <%=list.get(5)%>
                            <%
                                if (!list.get(6).equals("null")){
                            %>
                                /<%=list.get(6)%>
                            <%    } %>
                        </span>
                    </div>
                    <div class="modal-UserName">
                        <span id="modal-border-grade">
                            <!--작성자 등급 -->
                            <%=memberInfo[1]%>
                        </span>
                        <span class="border-Auto" id="modal-border-nickname">
                            <!--작성자닉네임 -->
                            <%=memberInfo[0]%>
                        </span>
                    </div>
                </div>
                <div class="modal-Four-Line">
                    <div class="modal-ottImage">
                        <img id="modal-border-service" src="<%=serviceInfo[1]%>" alt="OTT 이름">
                    </div>
                </div>
                <div class="modal-Five-Line">
                    <div class="modal-Review">
                        <span id="review-Font">
                            <!--리뷰내용 -->
                            <%=list.get(7)%>
                        </span>
                    </div>
                </div>
                <div class="modal-Six-Line">
                    <div class="modal-Rating">
                    <span id="modal-border-star">
                        <%for (int i=0; i<5; i++){
                            if(i < (int) list.get(8)){
                        %>
                            <i class="fas fa-star"></i>
                        <%
                            }else{
                        %>
                            <i class="far fa-star"></i>
                        <%
                                }
                        }%>
                    </span>
                    </div>
                </div>
                <div class="modal-Seven-Line">
                    <div class="modal-Seven-Detail">
                        <div class="modal-Icon">
                            <span class="cm-a-view">
                                <i class="fas fa-eye fa-3x"><p class="point-Font" id="modal-border-view">
                                        <!--조회수--><%=list.get(9)%>
                                </p></i>
                            </span>
                            <span class="cm-a-like <%=isSessionClassName%>">
                                    <i class="fas fa-heart fa-3x"><p class="point-Font" id="modal-border-like">
                                            <!--좋아요수--><%=list.get(10)%>
                                    </p></i>
                            </span>
                            <span class="cm-a-dislike <%=isSessionClassName%>">
                                <i class="fas fa-heart-broken fa-3x"><p class="point-Font" id="modal-border-dislike">
                                    <!--싫어요수--><%=list.get(11)%>
                                </p></i>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="modal-Eight-Line">
                    <div class="modal-border-indexNum">
                        <span id="modal-border-indexNum"><!--글번호-->No.<%=list.get(0)%></span>
                    </div>
                    <div class="modal-Date">
                        <span id="modal-border-date">
                            <!--작성일 -->
                            <%=list.get(12).toString().substring(0,10)%>
                            <%=list.get(12).toString().substring(11,19)%>
                        </span>
                    </div>
                </div>
                <div class="modal-nine-Line">
                    <%
                        String member_code = new MemberDAO().idToCode(member_id);
                        if(list.get(1).equals(member_code)){
                    %>
                    <a href="mypageDetail.jsp?category=borderEdit&pageNo=<%=pageNo%>"><button type="button" id="edit-modal-border">수정하기</button></a>
                    <%
                        }
                    %>

                    <button type="button" id="close-modal-border">뒤로가기</button>
                </div>
            </div>
        </div>
    </form>
    <script>
        let member_id = '<%=session.getAttribute("member_id")%>';
    </script>
</div>