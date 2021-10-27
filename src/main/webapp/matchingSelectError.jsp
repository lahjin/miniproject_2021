<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>매칭 셀렉트</title>
    <link rel="stylesheet" href="./css/sweetalert.css">
    <link rel="stylesheet" href="./css/Animate.css">
    <script src="./js/sweetalert.js"></script>
    <script src="./js/swalPreset.js"></script>
</head>
<body>
    <script>
        let icon = 'question';
        let title = '결과 없음';
        let text = '생성된 파티가 없어요!';
        let footer = '<a href="matchingCreate.jsp" style="color: #70BBF7; font-weight: bold">파티를 직접 생성할까요?</a>';
        let button = 'matchingMain.jsp';
        swalOnButtonPreset(icon, title, text, footer, button);
    </script>
</body>
</html>
