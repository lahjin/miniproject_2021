<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="member.MemberDAO" %>
<html>
<head>
</head>
<body>
    <%
        MemberDAO memberDAO = new MemberDAO();

        int result = memberDAO.makeAdmin();
        switch (result) {
            case 0: //계정 생성
                session.setAttribute("InsertAdmin", "InsertSuccess"); //InsertAdmin InsertSuccess 값을 가진 세션 생성
                response.sendRedirect("../login.jsp");
                break;

            case 1: //계정이 이미 있음
                session.setAttribute("InsertAdmin", "InsertExist"); //InsertAdmin  InsertExist 값을 가진 세션 생성
                response.sendRedirect("../login.jsp");
                break;

            case -1: //DB연결 오류
                session.setAttribute("InsertAdmin", "InsertError"); //loginError이름으로  InsertError 값을 가진 세션 생성
                response.sendRedirect("../login.jsp");
                break;
        }
    %>
</body>
</html>
