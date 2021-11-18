<%@ page import="java.util.ArrayList" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="service.ServiceDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    ArrayList<Object> list = new MemberDAO().myInfo((String) session.getAttribute("member_id"));
    String[] favoriteOTT = new MemberDAO().favoriteOTT((String) list.get(0));
    String favoriteOTTText = null;
    if(favoriteOTT[0] == null){
        favoriteOTTText = "없음";
    }else {
        String service_name = new ServiceDAO().codeToName(favoriteOTT[0]);
        favoriteOTTText = service_name + " (" + favoriteOTT[1] + "회)";
    }
%>
<div class="mypage-parents"><!-- 마이페이지 wrap 시작 -->

    <div class="mypage"><!-- 마이페이지 시작-->

        <div class="memberInfo"><!-- memberInfo 시작-->
            <div class="box1"><!--box1 시작-->

                <div class="User-info"> <!-- User-info 시작-->
                    <!-- 유저 이미지 -->
                    <div class="User-face">
                        <i class="fas fa-user"></i>
                    </div>
                    <Span class="Username"><%=list.get(3)%></Span>
                    <input type="button" value="정보변경" class="edit">
                </div><!-- User-Info 끝-->

                <div class="User-info2"> <!-- User-info2 시작-->
                    <h2>상세정보</h2>
                    <hr>
                    <div class="Detail">
                        <div class="Detail-info">
                            <h4>닉네임</h4>
                            <span><%=list.get(8)%></span>
                        </div>

                        <div class="Detail-info">
                            <h4>이메일</h4>
                            <span><%=list.get(4)%></span>
                        </div>

                        <div class="Detail-info">
                            <h4>휴대전화</h4>
                            <span><%=list.get(5)%></span>
                        </div>

                        <div class="Detail-info">
                            <h4>생일</h4>
                            <span><%=list.get(6)%></span>
                        </div>

                        <div class="Detail-info">
                            <h4>성별</h4>
                            <span><%=list.get(7)%></span>
                        </div>

                        <div class="Detail-info">
                            <h4>가입일</h4>
                            <span><%=list.get(10).toString().substring(0,10)%></span>
                        </div>
                    </div>
                </div> <!-- User-info2 끝-->

            </div><!-- box1 끝-->

            <div class="box2"><!-- 박스2 시작 -->
                <!-- 선호OTT -->
                <div class="User-OTT">
                    <!-- 윗 영역 -->
                    <div class="top-menu" >
                        <img class="top-img" src="./asset/mypageImg/star.png" alt="Not found image">
                    </div>

                    <div class="middle-menu">
                        <h3>선호OTT</h3>
                    </div>

                    <div class="bottom-menu">
                        <h2><%=favoriteOTTText%></h2>
                    </div>
                </div>
                <!-- 현재 이용중인 파티 -->
                <div class="User-OTT">
                    <div class="top-menu">
                        <img class="top-img" src="./asset/icon/money.png" alt="Not found image">
                    </div>

                    <div class="middle-menu">
                        <h3>보유 포인트</h3>
                    </div>

                    <div class="bottom-menu">
                        <h2><%=list.get(13)%> Point</h2>
                    </div>
                </div>
                <!-- 매너등급 -->
                <div class="User-OTT">
                    <div class="top-menu">
                        <img class="top-img" src="./asset/mypageImg/usersmile.png" alt="Not found image">
                    </div>

                    <div class="middle-menu">
                        <h3>매너 등급</h3>
                    </div>

                    <div class="bottom-menu">
                        <h2><%=list.get(9)%></h2>
                    </div>

                </div>
                <!-- 파티이용기간  -->
                <div class="User-OTT">
                    <div class="top-menu">
                        <img class="top-img" src="./asset/mypageImg/share.png" alt="Not found image">
                    </div>

                    <div class="middle-menu">
                        <h3>파티 이용기간</h3>
                    </div>

                    <div class="bottom-menu">
                        <h2><%=list.get(18)%> 개월</h2>
                    </div>

                </div>
            </div><!-- 박스2 끝 -->

        </div> <!-- memberInfo 끝-->

        <div class="memberSetting"><!-- memberSetting 시작-->
            <!-- 파티 이력 텍스트 부분 -->
            <div class="party-history">
                <h2>관리</h2>
                <hr>
            </div>

            <div class="party-contents">

                <div class="contents">
                    <div class="top-area">
                        <!-- 아이콘 이미지 -->
                        <div class="icon-image">
                            <img src="./asset/mypageImg/card.png" alt="">
                        </div>
                        <h3>결제 관리</h3>
                        <input type="button" value="자세히보기" class="location-btn">
                    </div>
                </div>

                <div class="contents">
                    <div class="top-area">
                        <!-- 아이콘 이미지 -->
                        <div class="icon-image">
                            <img src="./asset/mypageImg/play.png" alt="">
                        </div>
                        <h3>OTT 관리</h3>
                        <input type="button" value="자세히보기" class="location-btn">
                    </div>
                </div>

                <div class="contents">
                    <div class="top-area">
                        <!-- 아이콘 이미지 -->
                        <div class="icon-image">
                            <img src="./asset/mypageImg/group.png" alt="">
                        </div>
                        <h3>파티 관리</h3>
                        <input type="button" value="자세히보기" class="location-btn">
                    </div>
                </div>

                <div class="contents">
                    <div class="top-area">
                        <!-- 아이콘 이미지 -->
                        <div class="icon-image">
                            <img src="./asset/mypageImg/post.png" alt="">
                        </div>
                        <h3>글 관리</h3>
                        <input type="button" value="자세히보기" class="location-btn">
                    </div>
                </div>

            </div>
        </div> <!-- memberSetting 끝-->
    </div><!-- 마이페이지  끝-->

</div><!-- 마이페이지 wrap 끝 -->
