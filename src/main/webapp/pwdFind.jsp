<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="kor">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>비밀번호 찾기</title>
  <link rel="stylesheet" href="css/pwdFind.css">
  <script src="./js/pwdFind.js" defer></script>
</head>
<body>

<div class="findbox">

  <br>
  <div class="waybox">
    <a href="./main.jsp" class="logo">MODIVA</a>
    <div class="circle"></div>
    <span class="maintext">비밀번호가 기억나지 않으신가요??</span>
    <span>이메일 인증을 통하여 비밀번호를 확인하세요</span>
    <hr>

    <form action="">
      <div class="lineone">
        <input type="text" placeholder="아이디를 입력해주세요" name="member_id" onkeyup="letters()">
        <input type="email" placeholder="이메일을 입력해주세요" name="member_email" onkeyup="letters()">

        <input type="button" name="sendEmail" value="이메일 보내기">
      </div>
    </form>

    <div class="bottombox">
      <a href="./login.jsp" class="backlogin">로그인 페이지</a>
      <a href="./idFind.jsp" class="backlogin">아이디 찾기</a>
    </div>


  </div>


</div>
</body>
</html>
