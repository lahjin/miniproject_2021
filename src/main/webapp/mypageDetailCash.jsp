<%@ page import="java.util.ArrayList" %>
<%@ page import="party.PartyDAO" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="javabean.Party" %>
<%@ page import="service.ServiceDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String member_code = new MemberDAO().idToCode((String) session.getAttribute("member_id"));
%>
<div class="contents-box">
    <h1 style="margin: 20px">결제 관리</h1>
    <div class="cash-list">
        <div class="contents-area">

            <h2>
                <span>결제 금액 목록</span>
            </h2>
            <hr>
            <div class="cash-area">
                <div class="cash">
                    <h1>포인트</h1>
                    <h2>5000원</h2>
                    <div class="innerbox">
                        <a href="javascript:void(0)"><input class="pointCashBtn" type="button" value="충전"></a>
                    </div>
                </div>

                <div class="cash">
                    <h1>포인트</h1>
                    <h2>10000원</h2>
                    <div class="innerbox">
                        <a href="javascript:void(0)"><input class="pointCashBtn" type="button" value="충전"></a>
                    </div>
                </div>

                <div class="cash">
                    <h1>포인트</h1>
                    <h2>20000원</h2>
                    <div class="innerbox">
                        <a href="javascript:void(0)"><input class="pointCashBtn" type="button" value="충전"></a>
                    </div>
                </div>

                <div class="cash">
                    <h1>포인트</h1>
                    <h2>50000원</h2>
                    <div class="innerbox">
                        <a href="javascript:void(0)"><input class="pointCashBtn" type="button" value="충전"></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    const member_id = "<%=session.getAttribute("member_id")%>";
</script>