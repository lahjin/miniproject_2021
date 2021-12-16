<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <%
        String param = request.getParameter("category");
        if(param == null) param = "null";
    %>
    <title>MODIVA CS</title>
    <link rel="stylesheet" href="css/header.css">
    <%
        switch (param){
            case "csNotice": %> <link rel="stylesheet" href="css/csNotice.css"><% break;
            case "csNoticeInfo": %> <link rel="stylesheet" href="css/csNoticeInfo.css"><% break;
            case "csQnA": %> <link rel="stylesheet" href="css/csQnA.css"><% break;
            case "ask": %> <link rel="stylesheet" href="css/csAsk.css"><% break;
            case "askList": %> <link rel="stylesheet" href="css/csAskList.css"><% break;
            case "askIndex": %> <link rel="stylesheet" href="css/csAskIndex.css"><% break;
            case "null": %> <link rel="stylesheet" href="css/csContents.css"><% break;
    }
%>
    <link rel="stylesheet" href="css/footer.css">
</head>
<body>

    <jsp:include page="header.jsp"/>
    <%
        switch (param){
            case "csNotice": %> <jsp:include page="csNotice.jsp"/> <% break;
            case "csNoticeInfo": %> <jsp:include page="csNoticeInfo.jsp"/><% break;
            case "csQnA": %> <jsp:include page="csQnA.jsp"/> <%  break;
            case "ask": %> <jsp:include page="csAsk.jsp"/> <% break;
            case "askList": %> <jsp:include page="csAskList.jsp"/> <%  break;
            case "askIndex": %> <jsp:include page="csAskIndex.jsp"/> <%  break;
            case "null": %> <jsp:include page="csContents.jsp"/> <% break;
        }
    %>
    <jsp:include page="footer.jsp"/>
</body>
</html>
