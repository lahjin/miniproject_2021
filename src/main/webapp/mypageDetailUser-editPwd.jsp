<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="contents-center-box">
    <div class="userarea">
        <h1 class="title-text">비밀번호변경</h1>
        <span>비밀번호를 변경합니다</span>
        <hr>
        <!-- 프로필 이미지 -->


        <div class="nowpwd edit">
            <h3>현재 비밀번호</h3>
            <input type="password" id="member_pwd_now">
            <i class="far fa-times-circle hiddenUI" id="validityCheck_now"></i>
        </div>

        <div class="changepwd edit">
            <h3>새로운 비밀번호</h3>
            <input type="password" id="member_pwd">
            <i class="far fa-times-circle hiddenUI" id="validityCheck_pwd"></i>
        </div>

        <div class="changepwd edit">
            <h3>비밀번호 확인</h3>
            <input type="password" id="member_pwd2">
            <i class="far fa-times-circle hiddenUI" id="validityCheck_pwd2"></i>
        </div>
        <!-- 알림 -->
        <div class="notice">
            <h3>※보안꿀팁※</h3>

            <ul>
                <li>다른 사이트에서 사용하지 않는 <br>비밀번호를 권장합니다.</li>
                <li>이전에 사용한 적 없는 비밀번호<br>가 안전해요</li>
            </ul>
        </div>

        <!-- 변경 / 돌아가기 버튼박스 -->
        <div class="btn-box">
            <input id="updatePwd" type="button" value="변경하기">
            <input type="button" value="돌아가기" onclick="history.go(-1)">
        </div>
    </div>
</div>
<script>
    const member_id = "<%=(String) session.getAttribute("member_id")%>";
</script>