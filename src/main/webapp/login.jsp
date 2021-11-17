<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Login Page</title>
    <link rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="./css/sweetalert.css">
    <script src="./js/jquery-3.6.0.min.js"></script>
    <script src="./js/sweetalert.js"></script>
    <script src="./js/swalPreset.js"></script>
    <script src="./js/login.js"></script>
    <script src="./temp/temp_adminAlert.js"></script>
</head>
<body>
<!-- 배경div -->
<!-- 배경div -->
<div class="background">
    <!-- 첫번째 박스 -->
    <div class="box">
        <div class="singin_card">
            <a href="./main.jsp"> MODIVA Project</a>
            <hr style="background-color: #ddd;">
            <form action="loginAction.jsp" name="frm_login" method="post">
                <input id="member_id" name="member_id" type="text" placeholder="아이디를 입력하세요.">
                <input id="member_pwd" name="member_pwd" type="password" placeholder="비밀번호를 입력하세요.">
                <input type="submit" value="로그인" onclick="return loginCheck()">
            </form>

            <div class="actionbtn">
                <a href="./agreeJoin.jsp">회원가입</a>
                <a href="./idFind.jsp">아이디 찾기</a>
                <a href="./pwdFind.jsp">비밀번호 찾기</a>
            </div>
        </div>

        <%--   유효한 로그인인지 세션으로 확인하여 유효한 로그인이 아니면 알림창을 띄워줌     --%>
        <%  String ErrorMsg = null; //에러 메세지를 저장할 변수 선언
            //세션이 null이 아닌지 우선 확인
            if(session.getAttribute("loginError") != null){
                ErrorMsg = (String) session.getAttribute("loginError"); //세션값을 String으로 형변환 하여 대입
                System.out.println("loginError: "+ ErrorMsg);
                //아이디 에러 : 아이디가 존재하지 않음
                if(ErrorMsg.equals("idError")){ %>
        <script>loginAccess('idError');</script>
        <!-- 비밀번호 에러 : 비밀번호가 틀림-->
        <% } else if(ErrorMsg.equals("pwdError")){ %>
        <script>loginAccess('pwdError');</script>
        <!-- 데이터베이스 에러 : DB가 연결이 끊겼거나 없음-->
        <% } else if(ErrorMsg.equals("dbSeverError")){ %>
        <script>loginAccess('dbSeverError');</script>
        <% } session.removeAttribute("loginError"); }
        %>

        <!-- 임시로 만든 자리 관리자 계정 생성 배포시에는 없애야댐 -->
        <div id="temp_make_admin">
            <form action="./temp/temp_makeAdmin.jsp" name="admin_frm" method="post">
                <button type="submit" style="width: 500px; height: 100px;">
                    <p><b style="font-size: 2em">추후에 배포시에 이 버튼은 삭제</b></p>
                    <p>DB 생성(아무 아이디 비번 입력하고 로그인 눌러도 생성되긴함)</p>
                    <p style="text-agline: center">및<p>
                    <p>관리자 계정생성 id: admin pwd: admin123</p>
                </button>
                <button type="button" onclick="test()">swal tester</button>
            </form>
        </div>

        <%--   유효한 관리자인지 세션으로 확인하여 유효한 관리자가 아니면 알림창을 띄워줌     --%>
        <%  String adminError = null; //에러 메세지를 저장할 변수 선언
            //세션이 null이 아닌지 우선 확인
            if(session.getAttribute("InsertAdmin") != null){
                adminError = (String) session.getAttribute("InsertAdmin"); //세션값을 String으로 형변환 하여 대입
                System.out.println("InsertAdmin: "+ adminError);
                //관리자 계정이 존재하지 않음 : 계정 생성
                if(adminError.equals("InsertSuccess")){ %>
        <script>adminAccess('InsertSuccess');</script>
        <!-- 관리자 계정이 존재함 -->
        <% } else if(adminError.equals("InsertExist")){ %>
        <script>adminAccess('InsertExist');</script>
        <!-- 데이터베이스 에러 : DB가 연결이 끊겼거나 없음-->
        <% } else if(adminError.equals("InsertError")){ %>
        <script>adminAccess('InsertError');</script>
        <% } session.removeAttribute("InsertAdmin");
        }
        %>
    </div>
</div>
</body>
</html>
