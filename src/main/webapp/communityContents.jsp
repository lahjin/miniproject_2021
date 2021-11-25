<%@ page import="java.util.ArrayList" %>
<%@ page import="community.Community_borderDAO" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="service.ServiceDAO" %>
<%@ page import="genre.GenreDAO" %>
<%@ page import="javabean.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String currentParam = request.getParameter("pageIndex"); //현재 파라미터 저장
    int currentPage; //현재페이지번호
    if(currentParam == null){
        currentPage = 1;
    }else{
        currentPage = Integer.parseInt(currentParam);
    }
    int rowSize = 6; //한 페이지에 보여줄 글 갯수
    int rowCount = new Community_borderDAO().upTimeBorderCount(); //DB에 저장된 총 글 갯수
    int startRow = (currentPage-1) * rowSize; //db 조회시 처음 레코드 번호
//    int endRow = currentPage * rowSize; //db 조회시 끝 레코드 번호(MySQL LIMIT 구문을 사용하기 때문에 필요없는 변수)

    int pageCount = (int) Math.ceil(rowCount /(double) rowSize); // 총 페이지 갯수
    int pageSize = 10; //한 페이지에 보여줄 페이지 갯수
    int startPage = ((currentPage-1)/pageSize) * pageSize + 1; //한 페이지의 처음 페이지 번호
    int endPage = startPage + pageSize - 1; //한 페이지의 마지막 페이지 번호

%>
<div class="community-wrap">

    <div class="community-menu">

        <div class="menu-info">
            <span><i class="fas fa-ellipsis-v"></i> 커뮤니티</span>
        </div><!-- menu-info 끝-->

        <div class="menu-index">
            <ul class="index-lists">
                <li class="index-list">
                    <a href="#">
                        <div class="index-div checkedMenu"><i class="fas fa-home"></i></div>
                    </a>
                </li>
                <li class="index-list">
                    <a href="#">
                        <div class="index-div defaultMenu"><i class="far fa-chart-bar"></i></div>
                    </a>
                </li>
                <li class="index-list">
                    <a href="#">
                        <div class="index-div defaultMenu"><i class="far fa-envelope"></i></div>
                    </a>
                </li>
                <li class="index-list">
                    <a href="#">
                        <div class="index-div defaultMenu"><i class="far fa-heart"></i></div>
                    </a>
                </li>
            </ul>
        </div><!-- menu-index 끝-->
    </div><!-- community-menu 끝-->

    <div class="community-main">
        <div class="main-wrap">
            <form action="" method="post">
            <div class="search-field">
                <div class="radio-bar">
                    <input type="radio" id="search_title" name="search-radio" value="제목" checked><label
                        for="search_title">제목</label>
                    <input type="radio" id="search_subTitle" name="search-radio" value="작품명" ><label
                        for="search_subTitle">작품명</label>
                    <input type="radio" id="search_nickname" name="search-radio" value="닉네임" ><label
                        for="search_nickname">닉네임</label>
                </div>
                <div class="searchBar">
                    <div class="search-icon"><i class="fas fa-search"></i></div>
                    <input type="text" placeholder="Search in community....." />
                    <div class="search-filter"><i class="fas fa-filter"></i></div>
                </div> <!-- searchBar 끝-->

            </div> <!-- search-field 끝-->
            </form>
            <div class="article">
                <div class="article-lists">

                    <%
                        ArrayList<Community_border> list = new Community_borderDAO().selectBorder(startRow, rowSize);
                        for (int i=0; i<list.size(); i++){
                            String[] member = new MemberDAO().memberPartyInfo(list.get(i).getCm_b_member());
                            String[] service = new ServiceDAO().selectService(list.get(i).getCm_b_service());
                    %>
                    <div class="article-index">
                        <div class="article-index-header">
                            <div class="article-index-info">
                                <h2><%=list.get(i).getCm_b_title()%></h2>
                                <h4><%=list.get(i).getCm_b_subTitle()%></h4>
                            </div>
                            <div class="article-index-detail">
                                <button class="detail-btn" id="detail-btn<%=i%>" type="button"><i class="fas fa-plus"></i></button>
                            </div>
                        </div>

                        <div class="article-index-content">
                            <img src="<%=service[1]%>" alt="<%=service[0]%>">
                            <p><%=list.get(i).getCm_b_content()%></p>
                        </div>

                        <div class="article-index-footer">
                            <h4><%=member[0]%></h4>
                            <label>
                                <span>
                                    <%
                                        for(int j=0; j<5;j++){
                                            if(j<list.get(i).getCm_b_star()){
                                    %>
                                                <i class="fas fa-star"></i>
                                    <%
                                            }else{
                                    %>
                                                <i class="far fa-star"></i>
                                    <%
                                            }
                                        }
                                    %>
                                </span>
                                <span>
                                    <span class="cm-a-good"><i class="fas fa-heart"></i> <%=list.get(i).getCm_b_likes()%></span>
                                    <span class="cm-a-view"><i class="fas fa-eye"></i> <%=list.get(i).getCm_b_hits()%></span>
                                </span>
                            </label>
                        </div>

                    </div> <!-- article-index 끝-->
                    <%
                        }
                    %>

                </div> <!-- article-lists 끝-->
            </div> <!-- article 끝-->
            <%
                if(session.getAttribute("member_id") != null){

            %>
                <div class="article-write">
                    <button type="button" id="cm_write">글쓰기</button>
                </div>
            <%
                }
            %>


            <div class="article-page">
                <%
                    if(currentPage > 1){
                %>
                        <a href="community.jsp?pageIndex=1" id="first-index"><div><span><i class="fas fa-angle-double-left"></i></span></div></a>
                <%
                    }if(currentPage > 10){
                %>
                        <a href="community.jsp?pageIndex=<%=currentPage-10%>" id="prev"><div><span><i class="fas fa-angle-left"></i></span></div></a>
                <%
                    }
                %>
                <%
                    for(int i=startPage; i<=endPage; i++){
                        if(i <= pageCount){
                %>
                            <a id="pageIndex<%=i%>" href="community.jsp?pageIndex=<%=i%>"><div><span><%=i%></span></div></a>
                <%
                        }
                    }
                %>
                <%
                    if(currentPage < pageCount-10){
                %>
                        <a href="community.jsp?pageIndex=<%=currentPage+1%>" id="next"><div><span><i class="fas fa-angle-right"></i></span></div></a>
                <%
                    }
                %>
                <%
                    if(currentPage < pageCount){
                %>
                        <a href="community.jsp?pageIndex=<%=pageCount%>" id="last-index"><div><span><i class="fas fa-angle-double-right"></i></span></div></a>
                <%
                    }
                %>

            </div> <!-- article--page 끝-->

        </div> <!-- main-wrap  끝-->
    </div> <!-- community-main 끝-->
    <div class="community-subIndex">
        <div class="subIndex-today">
            <ul>
                <h2>일일 인기 글</h2>
                <%
                    ArrayList<Community_border> dailyList = new Community_borderDAO().dailyTopLikes(3);
                    for(int i=0; i<3; i++){
                        if(i < dailyList.size()){
                            String[] member = new MemberDAO().memberPartyInfo(dailyList.get(i).getCm_b_member());
                %>
                            <a href=""><li>
                                <h3><%=dailyList.get(i).getCm_b_title()%></h3>
                                <h4><%=dailyList.get(i).getCm_b_subTitle()%></h4>
                                <h5><%=member[0]%></h5>
                            </li></a>
                <%
                        }else{
                %>
                            <li class="b_likes_null">
                                <h4>작성된 글이 없어요</h4>
                            </li>
                <%
                        }
                    }
                %>
            </ul>
        </div>

        <div class="subIndex-week">
            <ul>
                <h2>주간 인기 글</h2>
                <%
                    ArrayList<Community_border> weeklyList = new Community_borderDAO().weeklyTopLikes(3);
                    for(int i=0; i<3; i++) {
                        if (i < weeklyList.size()) {
                            String[] member = new MemberDAO().memberPartyInfo(weeklyList.get(i).getCm_b_member());
                %>
                            <a href=""><li>
                                <h3><%=weeklyList.get(i).getCm_b_title()%></h3>
                                <h4><%=weeklyList.get(i).getCm_b_subTitle()%></h4>
                                <h5><%=member[0]%></h5>
                            </li></a>
                <%
                        } else {
                %>
                            <li class="b_likes_null">
                                <h4>작성된 글이 없어요</h4>
                            </li>
                <%
                        }
                    }
                %>
            </ul>
        </div>

        <div class="subIndex-month">
            <ul>
                <h2>월간 인기 글</h2>
                <%
                    ArrayList<Community_border> monthlyList = new Community_borderDAO().monthlyTopLikes(3);
                    for(int i=0; i<3; i++) {
                        if (i < monthlyList.size()) {
                            String[] member = new MemberDAO().memberPartyInfo(monthlyList.get(i).getCm_b_member());
                %>
                <a href=""><li>
                    <h3><%=monthlyList.get(i).getCm_b_title()%></h3>
                    <h4><%=monthlyList.get(i).getCm_b_subTitle()%></h4>
                    <h5><%=member[0]%></h5>
                </li></a>
                <%
                } else {
                %>
                        <li class="b_likes_null">
                            <h4>작성된 글이 없어요</h4>
                        </li>
                <%
                        }
                    }
                %>
            </ul>
        </div>
    </div><!--  community-subIndex 끝-->
</div><!--  community-wrap 끝-->
<div id="hidden-modal"></div>