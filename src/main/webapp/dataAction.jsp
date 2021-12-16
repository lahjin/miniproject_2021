<%--회원가입을 처리하는 Action--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <link rel="stylesheet" href="./css/sweetalert.css">
    <link rel="stylesheet" href="./css/Animate.css">
    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="./js/sweetalert.js"></script>
    <script src="./js/swalPreset.js"></script>
</head>
<body>
<%
    int info = Integer.parseInt(request.getParameter("info"));
    int msg = Integer.parseInt(request.getParameter("msg"));
    if(info == 1){
        if(msg == 1){
%>
        <script>
            let icon = "success";
            let title = "OTT 추가 성공";
            let text = "확인 버튼을 클릭하면 OTT 페이지로 이동합니다.";
            let link = "mypageDetail.jsp?category=OTT";
            swalOnButtonPreset(icon, title, text, link);
        </script>
<%
        }else {
%>
        <script>
            let icon = "error";
            let title = "OTT 추가 실패";
            let text = "확인 버튼을 클릭하면 OTT 페이지로 이동합니다.";
            let link = "mypageDetail.jsp?category=OTT";
            swalOnButtonPreset(icon, title, text, link);
        </script>
<%      }
    }else if(info == 3){
    if(msg == 1){
%>
        <script>
            let icon = "success";
            let title = "OTT 삭제 성공";
            let text = "확인 버튼을 클릭하면 OTT 페이지로 이동합니다.";
            let link = "mypageDetail.jsp?category=OTT";
            swalOnButtonPreset(icon, title, text, link);
        </script>
<%
        }else {
%>
        <script>
            let icon = "error";
            let title = "OTT 삭제 실패";
            let text = "확인 버튼을 클릭하면 OTT 페이지로 이동합니다.";
            let link = "mypageDetail.jsp?category=OTT";
            swalOnButtonPreset(icon, title, text, link);
        </script>
<%      }
    }else if(info == 4){
%>
    <script>
        let icon = "error";
        let title = "로그인 이후 사용가능한 서비스입니다.";
        let text = "확인 버튼을 클릭하면 로그인페이지로 이동합니다.";
        let link = "login.jsp";
        swalOnButtonPreset(icon, title, text, link);
    </script>
<%    }else if (info == 5){
        if(msg == 1){
%>
    <script>
        let icon = "success";
        let title = "1대1문의 작성 성공";
        let text = "확인 버튼을 클릭하면 1대1문의 페이지로 이동합니다.";
        let link = "cs.jsp?category=askList";
        swalOnButtonPreset(icon, title, text, link);
    </script>
<%
    }else {
%>
    <script>
        let icon = "error";
        let title = "1대1문의 작성 실패";
        let text = "확인 버튼을 클릭하면 1대1문의 페이지로 이동합니다.";
        let link = "cs.jsp?category=ask";
        swalOnButtonPreset(icon, title, text, link);
    </script>
<%      }
    }
%>
</body>
</html>