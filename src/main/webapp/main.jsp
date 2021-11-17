<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>MODIVA Project</title>

    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/mainContents.css">

    <script src="./js/mainContents.js" defer></script>

    <!--구글 아이콘 LINK-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Scroll Magic Library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- GSAP SCROLL TO PLUGIN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.8.0/gsap.min.js" integrity="sha512-eP6ippJojIKXKO8EPLtsUMS+/sAGHGo1UN/38swqZa1ypfcD4I0V/ac5G3VzaHfDaklFmQLEs51lhkkVaqg60Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.8.0/ScrollToPlugin.min.js" integrity="sha512-eI+25yMAnyrpomQoYCqvHBmY4dLfqKWPnD4j8y0E3Js+yqpF26xncL4t81M1zxC+ISYfRoCN52rN/n0q2UIBZQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
    <%-- 메인 페이지 모듈화한 jsp파일을 각각 include하여 화면 생성--%>
    <jsp:include page="header.jsp" flush="false"/>
    <jsp:include page="mainContents.jsp" flush="false"/>
    <jsp:include page="footer.jsp" flush="false"/>
</body>
</html>
