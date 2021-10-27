<%--  로그아웃을 관리하는 jsp Action  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
</head>
<body>
    <%--  모든 세션 제거  --%>
    <%
        session.invalidate();
        //추후에 문제가 생기면 아래 세션 삭제로 변경
        //session.removeAttribute("member_id");
    %>
    <%--  메인 페이지로 다시 보내줌  --%>
    <script>
        location.href = "main.jsp";
    </script>
</body>
</html>
