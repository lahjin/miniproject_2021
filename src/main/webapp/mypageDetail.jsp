<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String param = request.getParameter("category");
%>
<html>
<head>
    <title>MODIVA MyPage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/mypageDetailContents.css">
    <%
        switch (param){
            case "user": %> <link rel="stylesheet" href="css/mypageDetailUser.css"> <% break;
            case "edit-pwd": %> <link rel="stylesheet" href="css/mypageDetailUser-editPwd.css">
                                <link rel="stylesheet" href="css/sweetalert.css">
                                <link rel="stylesheet" href="css/Animate.css"> <% break;
            case "edit-nickname": %> <link rel="stylesheet" href="css/mypageDetailUser-editNickname.css">
                                     <link rel="stylesheet" href="css/sweetalert.css">
                                     <link rel="stylesheet" href="css/Animate.css"><% break;
            case "user-withdrawal": %> <link rel="stylesheet" href="css/mypageDetailUser-Withdrawal.css">
                                       <link rel="stylesheet" href="css/sweetalert.css">
                                       <link rel="stylesheet" href="css/Animate.css"><% break;
            case "OTT": %> <link rel="stylesheet" href="css/mypageDetailOtt.css"> <% break;
            case "party": %> <link rel="stylesheet" href="css/mypageDetailParty.css"> <% break;
            case "border": %> <link rel="stylesheet" href="css/mypageDetailBorder.css">
                              <link rel="stylesheet" href="css/Animate.css"><% break;
            case "cash": %> <link rel="stylesheet" href="css/mypageDetailCash.css">
                            <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
                            <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script><% break;
            case "borderView": %> <link rel="stylesheet" href="css/mypageDetailBorderView.css"> <% break;
            case "borderEdit": %> <link rel="stylesheet" href="css/mypageDetailBorderEdit.css"> <% break;
            case "partyInfo": %> <link rel="stylesheet" href="css/mypageDetailPartyInfo.css"> <% break;
}
%>
    <link rel="stylesheet" href="./css/footer.css">
</head>
<body>
    <jsp:include page="header.jsp"/>
    <jsp:include page="mypageDetailContents.jsp"/>
    <jsp:include page="footer.jsp"/>

    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/sweetalert.js"></script>
    <script src="js/swalPreset.js"></script>
    <%
        switch (param){
            case "user": %>  <% break;
            case "edit-pwd": %> <script src="js/mypageDetailUser-editPwd.js"></script> <% break;
            case "edit-nickname": %> <script src="js/mypageDetailUser-editNickname.js"></script> <% break;
            case "user-withdrawal": %> <script src="js/mypageDetailUser-Withdrawal.js"></script> <% break;
            case "OTT": %> <script src="js/mypageDetailOtt.js"></script> <% break;
            case "party": %> <script src="js/mypageDetailParty.js"></script> <% break;
            case "border": %> <script src="js/mypageDetailBorder.js"></script> <% break;
            case "cash": %> <script src="js/mypageDetailCash.js"></script> <% break;
            case "borderView": %> <% break;
            case "borderEdit": %> <script src="js/mypageDetailBorderEdit.js"></script><% break;
            case "partyInfo": %> <script src="js/mypageDetailPartyInfo.js"></script> <% break;
    }
    %>

</body>
</html>
