<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>아이디찾기</title>
    <link rel="stylesheet" href="css/idFind.css">
    <script src="js/idFind.js" defer></script>
</head>
<body>
<div class="findbox">

    <br>
    <div class="waybox">
        <a href="./main.jsp" class="logo">MODIVA</a>
        <div class="circle"></div>
        <span class="maintext">아이디가 기억나지 않으신가요??</span>
        <span>이메일 인증을 통하여 아이디를 확인하세요</span>
        <hr>

        <form action="">
            <div class="lineone">
                <input type="text" name="member_name" placeholder="이름을 입력해주세요" onkeyup="letters()">
                <input type="email" name="member_email" placeholder="이메일을 입력해주세요" onkeyup="letters()">

                <input type="button" name="sendEmail" value="이메일 보내기">
            </div>
        </form>

        <div class="bottombox">
            <a href="./login.jsp" class="backlogin">로그인 페이지</a>
            <a href="./pwdFind.jsp" class="backlogin">비밀번호 찾기</a>
        </div>

    </div>
</div>
</body>

</html>