<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Community</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="css/community-border-modal.css">
    <link rel="stylesheet" href="css/community-write-modal.css">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/communityContents.css">
    <link rel="stylesheet" href="./css/footer.css">
    <link rel="stylesheet" href="css/Animate.css">

</head>
<body>

<%--    <jsp:include page="community-border-modal.jsp"/>--%>
    <jsp:include page="community-write-modal.jsp"/>

    <jsp:include page="header.jsp"/>
    <jsp:include page="communityContents.jsp"/>
    <jsp:include page="footer.jsp"/>

    <script src="js/jquery-3.6.0.min.js" defer></script>
    <script src="js/sweetalert.js"></script>
    <script src="js/swalPreset.js"></script>
    <script src="js/communityContents.js" defer></script>
    <script src="js/community-border-modal.js" defer></script>
    <script src="js/community-write-modal.js" defer></script>
</body>
</html>