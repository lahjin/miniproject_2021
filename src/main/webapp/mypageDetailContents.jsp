<%@ page import="member.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="party.PartyDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String param = request.getParameter("category");
    String member_code = new MemberDAO().idToCode((String) session.getAttribute("member_id"));
    String nickname = new MemberDAO().idToNickname((String) session.getAttribute("member_id"));
%>
<div class="detail-parents">

    <!--목록을 나타내는 사이드바 div  -->
    <div class="sidebar">
        <!-- 유저 정보 -->
        <div>
            <div class="userinfo">
                <h3><%=nickname%>님</h3>
                <h3>어서오세요</h3>
            </div>
            <hr>
            <!-- 메뉴목록 -->
            <ul class="bigul">
                <li class="main-topic"><a href="mypageDetail.jsp?category=user">회원 정보 관리</a></li>
                <ul class="small-topic">
                    <li><a href="mypageDetail.jsp?category=edit-pwd">-비밀번호 변경</a></li>
                    <li><a href="mypageDetail.jsp?category=edit-nickname">-닉네임 변경</a></li>
                    <li><a href="mypageDetail.jsp?category=user-withdrawal">-회원탈퇴</a></li>
                </ul>
                <li class="main-topic"><a href="mypageDetail.jsp?category=OTT">OTT 관리</a></li>
                <li class="main-topic"><a href="mypageDetail.jsp?category=party">파티 관리</a></li>
                <li class="main-topic"><a href="mypageDetail.jsp?category=border">글 관리</a></li>
                <li class="main-topic"><a href="mypageDetail.jsp?category=cash">결제 관리</a></li>
            </ul>
            <hr>
        </div>
    </div>
        <%
            switch (param){
                case "user": %> <jsp:include page="mypageDetailUser.jsp"/> <% break;
                case "edit-pwd": %> <jsp:include page="mypageDetailUser-editPwd.jsp"/> <% break;
                case "edit-nickname": %> <jsp:include page="mypageDetailUser-editNickname.jsp"/> <% break;
                case "user-withdrawal": %> <jsp:include page="mypageDetailUser-Withdrawal.jsp"/> <% break;
                case "OTT": %> <jsp:include page="mypageDetailOtt.jsp"/> <% break;
                case "party": %> <jsp:include page="mypageDetailParty.jsp"/> <% break;
                case "border": %> <jsp:include page="mypageDetailBorder.jsp"/> <% break;
                case "cash": %> <jsp:include page="mypageDetailCash.jsp"/> <% break;
                case "borderView": %><jsp:include page="mypageDetailBorderView.jsp"/> <% break;
                case "borderEdit": %><jsp:include page="mypageDetailBorderEdit.jsp"/> <% break;
                case "partyInfo": %><jsp:include page="mypageDetailPartyInfo.jsp"/> <% break;
}
        %>
</div>
