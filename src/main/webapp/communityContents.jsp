<%@ page import="java.util.ArrayList" %>
<%@ page import="community.Community_borderDAO" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="service.ServiceDAO" %>
<%@ page import="genre.GenreDAO" %>
<%@ page import="javabean.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
            <div class="search-field">

                <div class="searchBar">
                    <div class="search-icon"><i class="fas fa-search"></i></div>
                    <input type="text" placeholder="Search in community....." />
                    <div class="search-filter"><i class="fas fa-filter"></i></div>
                </div> <!-- searchBar 끝-->

                <div class="search-filter-log">

                </div> <!-- search-filter-log 끝-->

                <div class="search-filter-index">
                    <h3>필터</h3>
                    <div class="index-wrap">
                        <ul>
                            <h4>기본</h4>
                            <hr>
                            <li><input type="checkbox" id="cm_nickname" value="작성자" checked><label for="cm_nickname">작성자</label></li>
                            <li><input type="checkbox" id="cm_title" value="작품명" checked><label for="cm_title">작품명</label></li>
                            <li><input type="checkbox" id="cm_article" value="내용"><label for="cm_article">내용</label></li>
                        </ul>

                        <ul>
                            <h4>기간</h4>
                            <hr>
                            <li><input type="checkbox" id="cm_total" name="period" value="기간: 전체" checked><label for="cm_total">전체</label></li>
                            <li><input type="checkbox" id="cm_today" name="period" value="기간: 오늘"><label for="cm_today">오늘</label></li>
                            <li><input type="checkbox" id="cm_week" name="period" value="기간: 이번주"><label for="cm_week">이번주</label></li>
                            <li><input type="checkbox" id="cm_month" name="period" value="기간: 이번달"><label for="cm_month">이번달</label>
                            </li>
                            <li><input type="checkbox" id="cm_3month" name="period" value="기간: 3개월"><label for="cm_3month">3개월</label>
                            </li>
                            <li><input type="checkbox" id="cm_6month" name="period" value="기간: 6개월"><label for="cm_6month">6개월</label>
                            </li>
                            <li><input type="checkbox" id="cm_year" name="period" value="기간: 1년"><label for="cm_year">1년</label></li>
                        </ul>

                        <ul>
                            <h4>OTT</h4>
                            <hr>
                            <li>
                                <input type="checkbox" id="cm_ott_all" name="ott" value="OTT: 전체" checked>
                                <label for="cm_ott_all">전체</label>
                            </li>
                            <%
                                ArrayList<Service> serviceList = new ServiceDAO().managedService();
                                for(int i=0; i<serviceList.size(); i++){
                            %>
                            <li>
                                <input type="checkbox" id="cm_ott_<%=serviceList.get(i).getService_name().toLowerCase()%>" name="ott" value="OTT: <%=serviceList.get(i).getService_name()%>">
                                <label for="cm_ott_<%=serviceList.get(i).getService_name().toLowerCase()%>">
                                    <%=serviceList.get(i).getService_name()%>
                                </label>
                            </li>
                            <%
                                }
                            %>
                        </ul>

                        <ul>
                            <h4>장르</h4>
                            <hr>
                            <li>
                                <input type="checkbox" id="cm_genre_all" name="genre" value="장르: 전체" checked>
                                <label for="cm_genre_all">전체</label>
                            </li>
                            <%
                                ArrayList<Genre> genreList = new GenreDAO().selectGenre();
                                for(int i=0; i<genreList.size(); i++){
                            %>
                            <li>
                                <input type="checkbox" id="cm_genre_<%=genreList.get(i).getGenre_id()%>" name="genre" value="장르: <%=genreList.get(i).getGenre_name()%>">
                                <label for="cm_genre_<%=genreList.get(i).getGenre_id()%>">
                                    <%=genreList.get(i).getGenre_name()%>
                                </label>
                            </li>
                            <%
                                }
                            %>
                        </ul>

                        <ul>
                            <h4>매너 등급</h4>
                            <hr>
                            <li><input type="checkbox" id="cm_grade_all" name="grade" value="매너 등급: 전체" checked><label for="cm_grade_all">전체</label></li>
                            <!-- 데이터베이스에 접근해서 만들것-->
                            <li><input type="checkbox" id="cm_grade_bronze" name="grade" value="매너 등급: 브론즈"><label for="cm_grade_bronze">브론즈</label></li>
                            <li><input type="checkbox" id="cm_grade_siver" name="grade" value="매너 등급: 실버"><label for="cm_grade_siver">실버</label></li>
                            <li><input type="checkbox" id="cm_grade_gold" name="grade" value="매너 등급: 골드"><label for="cm_grade_gold">골드</label></li>
                            <li><input type="checkbox" id="cm_grade_platinum" name="grade" value="매너 등급: 플레티넘"><label for="cm_grade_platinum">플레티넘</label></li>
                            <li><input type="checkbox" id="cm_grade_diamond" name="grade" value="매너 등급: 다이아몬드"><label for="cm_grade_diamond">다이아몬드</label></li>
                        </ul>

                    </div> <!-- index-wrap 끝-->
                </div> <!-- search-filter-index 끝-->

            </div> <!-- search-field 끝-->

            <div class="article">
                <div class="article-lists">

                    <%
                        int skipIndex = 0;
                        int countIndex = 6;
                        ArrayList<Community_border> list = new Community_borderDAO().selectBorder(skipIndex, countIndex);
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
                                <button class="detail-btn" id="detail-btn<%=i%>" type="button" value="0"><i class="fas fa-plus"></i></button>
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
                <a href="" id="first-index"><div><span><i class="fas fa-angle-double-left"></i></span></div></a>
                <a href="" id="prev"><div><span><i class="fas fa-angle-left"></i></span></div></a>
                <a href=""><div><span>1</span></div></a>
                <a href=""><div><span>2</span></div></a>
                <a href=""><div><span>3</span></div></a>
                <a href=""><div><span>4</span></div></a>
                <a href=""><div><span>5</span></div></a>
                <a href=""><div><span>6</span></div></a>
                <a href=""><div><span>7</span></div></a>
                <a href=""><div><span>8</span></div></a>
                <a href=""><div><span>9</span></div></a>
                <a href=""><div><span>10</span></div></a>
                <a href="" id="next"><div><span><i class="fas fa-angle-right"></i></span></div></a>
                <a href="" id="last-index"><div><span><i class="fas fa-angle-double-right"></i></span></div></a>
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