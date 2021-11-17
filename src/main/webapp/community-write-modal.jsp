<%@ page import="java.util.ArrayList" %>
<%@ page import="javabean.Genre" %>
<%@ page import="genre.GenreDAO" %>
<%@ page import="javabean.Service" %>
<%@ page import="service.ServiceDAO" %>
<%@ page import="member.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="community-write-modal">
    <form action="" method="post">
        <div class="review_wrap">
            <div class="modal--title-info">
                <h1>게시물 작성</h1>
            </div>
            <div class="main_title">
                <input type="text" placeholder="제목을 입력하세요." id="cm_b_title" name="cm_b_title">
            </div>

            <div class="sub_title">
                <input type="text" placeholder="작품명을 입력하세요." id="cm_b_subTitle" name="cm_b_subTitle">
            </div>

            <div class="sub-menu-index">
                <div class="menu1">
                    <span>장르</span>
                    <select id="cm_b_genre1" name="cm_b_genre1">
                        <option value="null">필수선택</option>
                        <%
                            ArrayList<Genre> list = new GenreDAO().selectGenre();
                            for(int i =0; i< list.size(); i++){
                        %>
                                <option value="<%=list.get(i).getGenre_name()%>"><%=list.get(i).getGenre_name()%></option>
                        <%
                            }
                        %>

                    </select>

                    <select id="cm_b_genre2" name="cm_b_genre2">
                        <option value="null">선택안함</option>
                        <%
                            for(int i =0; i< list.size(); i++){
                        %>
                        <option value="<%=list.get(i).getGenre_name()%>"><%=list.get(i).getGenre_name()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="menu2">
                   <%
                       String member_code = new MemberDAO().idToCode((String) session.getAttribute("member_id"));
                       String[] member = new MemberDAO().memberPartyInfo(member_code);
                   %>
                    <span class="grade">
                        <%=member[1]%>
                        <input type="hidden" id="member_grade" value="<%=member[1]%>">
                    </span>
                    <span class="nickname">
                        <%=member[0]%>
                        <input type="hidden" id="cm_b_member" name="cm_b_member" value="<%=member[0]%>">
                    </span>
                </div>
            </div>

            <div class="sub_wrap">
                <div class="ott_box">

                    <select id="cm_b_service" name="cm_b_service">
                        <option value="null">OTT 플랫홈 선택</option>
                        <%
                            ArrayList<Service> serviceList = new ServiceDAO().managedService();
                            for(int i=0; i<serviceList.size(); i++){
                        %>
                                <option value="<%=serviceList.get(i).getService_code()%>"><%=serviceList.get(i).getService_name()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="main_write">
                    <textarea id="cm_b_content" name="cm_b_content" rows="10"></textarea>
                </div>

                <div class="star_rating">
                    <input type="radio" id="1-star" name="cm_b_star" value="1" />
                    <label for="1-star" class="star"><i class="fas fa-star"></i></label>
                    <input type="radio" id="2-star" name="cm_b_star" value="2" />
                    <label for="2-star" class="star"><i class="far fa-star"></i></label>
                    <input type="radio" id="3-star" name="cm_b_star" value="3" />
                    <label for="3-star" class="star"><i class="far fa-star"></i></label>
                    <input type="radio" id="4-star" name="cm_b_star" value="4" />
                    <label for="4-star" class="star"><i class="far fa-star"></i></label>
                    <input type="radio" id="5-star" name="cm_b_star" value="5" />
                    <label for="5-star" class="star"><i class="far fa-star"></i></label>
                </div>

                <div class="button_box">
                    <input type="button" id="modal-write-post" value="작성">
                    <input type="button" id="modal-write-cancel" value="취소">
                </div>
            </div>
        </div>
    </form>
</div>