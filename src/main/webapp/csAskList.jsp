<%@ page import="member.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ask.AskDAO" %>
<%@ page import="javabean.Ask" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String member_id = (String) session.getAttribute("member_id");
    if(member_id == null){
%>
<script>
    location.href = "dataAction.jsp?info=4&msg=1";
</script>
<%
    }
    String member_code = new MemberDAO().idToCode(member_id);
    String[] member = new MemberDAO().memberPartyInfo(member_code);
%>

<div class="firstdiv">
    <div class="sidebar">
        <!-- 유저 정보 -->
        <div>
            <div class="userinfo">
                <h3><%=member[0]%>님 </h3> <!-- 유저 이름-->
                <h3>안녕하세요</h3>
            </div>
            <hr>
            <!-- 메뉴목록 -->
            <ul class="bigul">
                <li class="main-topic">
                    <a href="cs.jsp?category=csNotice">공지사항</a>
                </li>

                <li class="main-topic">
                    <a href="cs.jsp?category=csQnA">자주묻는질문</a>
                </li>

                <li class="main-topic">
                    <a href="cs.jsp?category=ask">1:1문의</a>
                </li>

                <li class="main-topic">
                    <a href="cs.jsp?category=askList">1:1문의 내역</a>
                </li>
            </ul>
            <hr>
        </div>
    </div>
<%
    String currentParam = request.getParameter("pageIndex"); //현재 파라미터 저장
    int currentPage; //현재페이지번호
    if(currentParam == null){
        currentPage = 1;
    }else{
        currentPage = Integer.parseInt(currentParam);
    }
    int rowSize = 10; //한 페이지에 보여줄 글 갯수
    int rowCount = new AskDAO().upTimeAskCount(member_code); //DB에 저장된 총 글 갯수
    int startRow = (currentPage-1) * rowSize; //db 조회시 처음 레코드 번호
//    int endRow = currentPage * rowSize; //db 조회시 끝 레코드 번호(MySQL LIMIT 구문을 사용하기 때문에 필요없는 변수)

    int pageCount = (int) Math.ceil(rowCount /(double) rowSize); // 총 페이지 갯수
    int pageSize = 10; //한 페이지에 보여줄 페이지 갯수
    int startPage = ((currentPage-1)/pageSize) * pageSize + 1; //한 페이지의 처음 페이지 번호
    int endPage = startPage + pageSize - 1; //한 페이지의 마지막 페이지 번호
%>
    <div class="real-big">

        <div class="bigbox">

            <div class="textbox">
                <h2>문의 내역</h2>
                <hr>
            </div>

            <!-- ul li시작 -->
            <ul class="contents">

                <li>
                    <span class="number-list">작성번호</span>
                    <span class="title">제목</span>
                    <span class="state">상태</span>
                    <span class="date">작성날짜</span>
                </li>
                <%
                    ArrayList<Ask> asks = new AskDAO().pageSelectAsk(member_code,startRow,rowCount);
                    for(int i=0;i<asks.size();i++){

                %>
                        <a href="cs.jsp?category=askIndex&index=<%=asks.get(i).getAsk_code()%>">
                            <li class="post">
                                <span class="number-list"><%=asks.get(i).getAsk_code()%></span>
                                <span class="title"><%=asks.get(i).getAsk_title()%></span>
                                <span class="state">
                                    <% if (asks.get(i).getAsk_state() == 1) out.print("답변완료");
                                       else out.print("답변대기");%>
                                </span>
                                <span class="date"><%=asks.get(i).getAsk_date()%></span>
                            </li>
                        </a>
                <%
                    }
                %>

            </ul>

            <!-- 내용 끝 -->
            <div class="bottom-box">

                <div>
                    <a href="cs.jsp?category=ask">
                        <input type="button" value="문의하기">
                    </a>
                </div>

                <div class="pagenumber">
                    <%
                        for(int i=startPage; i<=endPage; i++){
                            if(i <= pageCount){
                    %>
                    <a href="cs.jsp?category=csNotice&pageIndex=<%=i%>" class="pagemove"><%=i%></a>
                    <%
                            }
                        }
                    %>
                </div>

                <div class="prev-next-btnbox">
                    <%
                        if(currentPage != 1){
                    %>
                    <a href="cs.jsp?category=askList&pageIndex=<%=currentPage-1%>"><input type="button" value="이전"></a>
                    <%
                        }if(currentPage != pageCount){
                    %>
                    <a href="cs.jsp?category=askList&pageIndex=<%=currentPage+1%>"><input type="button" value="다음"></a>
                    <%
                        }
                    %>
                </div>

            </div>
        </div>
    </div>
</div>