<%@ page import="service.ServiceDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 모덜창 영역 -->
<%
    String service_code = request.getParameter("service");
    ServiceDAO serviceDAO = new ServiceDAO();
    String[] service = serviceDAO.selectService(service_code);
%>
<div class="mypage-party-wrap">
    <div class="mypage-party-modal">
        <div class="party-modal-top">
            <h2>파티 정보</h2>
            <img id="service_img" src="<%=service[1]%>" alt="">
        </div>

        <div class="party-modal-middle">
            <!-- 파티정보 div -->
            <div class="partyinfo">
                <!-- 파티코드 -->
                <div class="party-code">
                    <h2>파티코드</h2>
                    <h2 id="party_code">-</h2>
                </div>

                <div class="party-ready">
                    <div class="user-count">
                        <h3>모집인원</h3>
                        <h2 id="entry_now">-</h2>
                    </div>

                    <div class="ready">
                        <h2 id="party_state">-</h2>
                    </div>
                </div>


                <div class="count-date">
                    <h2 id="entry_period">-</h2>
                </div>

                <div class="money">
                    <h2 id="entry_price">-</h2>
                </div>

            </div>

            <!-- 파티정보 끝 -->
            <!-- 유저정보 div -->
            <div class="userinfo">

                <div class="user">
                    <div class="userimage">
                        <h1>1</h1>
                    </div>

                    <div class="username">
                        <h3 id="member_nickName1">-</h3>
                        <h4 id="entry_date1" class="userdate">-</h4>
                    </div>

                    <div class="userrank">
                        <h2 id="member_grade1">-</h2>
                    </div>

                </div>

                <div class="user">
                    <div class="userimage">
                        <h1>2</h1>
                    </div>

                    <div class="username">
                        <h3 id="member_nickName2">-</h3>
                        <h4 id="entry_date2" class="userdate">-</h4>
                    </div>

                    <div class="userrank">
                        <h2 id="member_grade2">-</h2>
                    </div>

                </div>

                <div class="user">
                    <div class="userimage">
                        <h1>3</h1>
                    </div>

                    <div class="username">
                        <h3 id="member_nickName3">-</h3>
                        <h4 id="entry_date3" class="userdate">-</h4>
                    </div>

                    <div class="userrank">
                        <h2 id="member_grade3">-</h2>
                    </div>

                </div>

                <div class="user">
                    <div class="userimage">
                        <h1>4</h1>
                    </div>

                    <div class="username">
                        <h3 id="member_nickName4">-</h3>
                        <h4 id="entry_date4" class="userdate">-</h4>
                    </div>

                    <div class="userrank">
                        <h2 id="member_grade4">-</h2>
                    </div>

                </div>

            </div>
        </div>

        <div class="party-modal-bottom">
            <input id="party-enter" type="button" value="신청하기">
            <input id="info-close" type="button" value="닫기">
        </div>

    </div>
</div>
