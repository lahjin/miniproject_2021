<%--회원가입을 처리하는 Action--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %> <%-- post방식 한글인코딩 깨짐 문제 해결--%>
<%@page import="member.MemberDAO" %>
<%@ page import="generator.CodeGenerator" %> <%-- MemberDAO 클래스 import--%>
<jsp:useBean id="member" class="javabean.Member"/> <%-- 자바빈 방식으로 데이터를 class 단위로 이동 --%>
<jsp:setProperty name="member" property="*"/>      <%-- member로 불러온 자바빈에 property가 일치하는 값에 자동으로 set 해줌 --%>
<html>
<head>
    <link rel="stylesheet" href="./css/sweetalert.css">
    <link rel="stylesheet" href="./css/Animate.css">
    <script src="./js/sweetalert.js"></script>
    <script src="./js/swalPreset.js"></script>
</head>
<body>
    <%
//        MemberDAO memberDAO = new MemberDAO();
//        String member_code = memberDAO.memberCodeGenerator("일반");
        String member_code = new CodeGenerator().memberCodeGenerator("일반");
        //하루 회원가입 인원 초과
        if(member_code.equals("trafficOver")){ %>
            <script>
                let icon = "info";
                let title = "일일 회원가입 초과!";
                let text = "확인 버튼을 클릭하면 회원가입 페이지로 이동합니다.";
                let link = "join.jsp";
                swalOnButtonPreset(icon, title, text, link);
            </script>
    <%  }else{
            member.setMember_code(member_code);
            boolean result = new MemberDAO().register(member);
            //회원가입 성공
            if(result){%>
                <script>
                    let icon = "success";
                    let title = "회원가입 성공!";
                    let text = "확인 버튼을 클릭하면 로그인 페이지로 이동합니다.";
                    let link = "login.jsp";
                    swalOnButtonPreset(icon, title, text, link);
                </script>
    <%      }
            //DB연결 실패
            else{ %>
                <script>
                    let icon = "question";
                    let title = "데이터베이스 오류";
                    let text = "확인 버튼을 클릭하면 회원가입 페이지로 이동합니다.";
                    let footer = "<a href=\"#\" style=\"color: #70BBF7; font-weight: bold\">관리자에게 문의</a>"
                    let link = "join.jsp";
                    swalOnButtonPreset(icon, title, text, footer,link);
                </script>
    <%        }
        }
    %>
</body>
</html>