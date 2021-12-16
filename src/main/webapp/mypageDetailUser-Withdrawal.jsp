<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="contents-center-box">
    <div class="userarea">
        <h1 class="title-text">회원탈퇴</h1>
        <span>회원탈퇴를 원하시면 "탈퇴하기"라고 적어주세요</span>
        <hr>
        <!-- 프로필 이미지 -->

        <div class="nickname edit">
            <input type="text" class="getout" onkeyup="printName()">
        </div>
        <!-- 알림 -->
        <div class="notice">
            <h3>※주의사항※</h3>

            <ul>
                <li>탈퇴시 가입된 파티는 탈퇴처리됩니다.</li>
            </ul>
        </div>

        <!-- 변경 / 돌아가기 버튼박스 -->
        <div class="btn-box">
            <input type="button" value="탈퇴하기" class="firstbtn" disabled='disabled'>
            <input type="button" value="돌아가기" onclick="history.go(-1)">
        </div>

    </div>
</div>
<script>
    const member_id = "<%=(String) session.getAttribute("member_id")%>";
</script>
