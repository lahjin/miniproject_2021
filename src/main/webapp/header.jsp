<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
    <header class="header"> <!-- 헤더 시작-->
        <a href="./main.jsp" class="logo">MODIVA</a>   <!-- 로고 부분-->
        <nav>
            <div class="menu"> <!-- 메뉴 바 시작-->
                <ul>
                    <li><a href="main.jsp">Home</a></li>
                    <li><a href="matchingMain.jsp">Matching</a></li>
                    <li><a href="community.jsp">Community</a></li>
                    <li><a href="404error.jsp">Grade</a></li>
                    <li><a href="500error.jsp">CS</a></li>
                    <% if (session.getAttribute("member_id") == null){ %>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="agreeJoin.jsp">Sign in</a></li>
                    <% } else{ %>
                    <li><a href="mypage.jsp">Mypage</a></li>
                    <li><a href="logoutAction.jsp">Logout</a></li>
                    <% } %>
                </ul>
            </div>  <!-- 메뉴 바 끝-->
        </nav>
    </header> <!-- 헤더 끝-->