<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String param = request.getParameter("category");
%>
<html>
<head>
    <title>MODIVA MyPage <%=param%> 관리</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/mypageDetailContents.css">
    <link rel="stylesheet" href="./css/footer.css">
</head>
<body>
    <jsp:include page="header.jsp"/>
    <jsp:include page="mypageDetailContents.jsp"/>
    <jsp:include page="footer.jsp"/>
</body>
</html>
