<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="contents-center-box">
    <div class="userarea">
        <h1 class="title-text">닉네임 변경</h1>
        <span>파티창에서 보일 닉네임입니다</span>
        <hr>
        <!-- 프로필 이미지 -->

        <div class="nickname edit">
            <h3>닉네임</h3>
            <input id="editNickname" type="text" placeholder="닉네임을 입력해주세요">
        </div>
        <!-- 알림 -->
        <div class="notice">
            <h3>※주의사항※</h3>

            <ul>
                <li>중복 닉네임은 불가능합니다</li>
                <li>영문 대소문자 or 숫자 or 온전한 한글로 이루어진 4~16글자로 닉네임을 작명 해 주세요</li>
            </ul>
        </div>

        <!-- 변경 / 돌아가기 버튼박스 -->
        <div class="btn-box">
            <input id="updateNick" type="button" value="변경하기">
            <input type="button" value="돌아가기" onclick="history.go(-1)">
        </div>

    </div>
</div>
<script>
    const member_id = "<%=(String) session.getAttribute("member_id")%>";
</script>