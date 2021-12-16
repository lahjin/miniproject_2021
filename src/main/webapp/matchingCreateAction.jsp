<%@ page import="party.PartyDAO" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="generator.CodeGenerator" %>
<%@ page import="entry.EntryDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %> <%-- post방식 한글인코딩 깨짐 문제 해결--%>
<html>
<head>
    <title>파티 생성</title>
    <link rel="stylesheet" href="./css/sweetalert.css">
    <link rel="stylesheet" href="./css/Animate.css">
    <script src="./js/sweetalert.js"></script>
    <script src="./js/swalPreset.js"></script>
</head>
<body>
    <%
        String member_nickname = request.getParameter("member_nickname");
        String service_code = request.getParameter("service");
        int party_period = Integer.parseInt(request.getParameter("party_period").replace("개월", ""));
        int party_total = Integer.parseInt(request.getParameter("party_total").replace("명", ""));

//        String party_code = new PartyDAO().partyCodeGenerator(service_code);
        String party_code = new CodeGenerator().partyCodeGenerator(service_code);
        if(party_code.equals("trafficOver")){
    %>
        <script>
            let icon = "info";
            let title = "일일 파티 생성 초과!";
            let text = "확인 버튼을 클릭하면 매칭 페이지로 이동합니다.";
            let link = "matchingMain.jsp";
            swalOnButtonPreset(icon, title, text, link);
        </script>
    <%  }else{
            String member_code = new MemberDAO().nickNameToCode(member_nickname);

            boolean result = new PartyDAO().createParty(party_code, member_code, service_code, party_period, party_total);
            if(result){
                String entry_code = new CodeGenerator().entryCodeGenerator(party_code);
                int eResult = new EntryDAO().addEntry(entry_code, party_code,member_code);
                if (eResult == 1){
                    String member_id = (String) session.getAttribute("member_id");
                    ArrayList<Object> member = new MemberDAO().myInfo(member_id);

                    int addPoint = (int)member.get(9) + 10;
                    int grade = new MemberDAO().updateMemberGrade(member_code,addPoint);
    %>
            <script>
                let icon = "success";
                let title = "파티 생성 성공!";
                let text = "확인 버튼을 클릭하면 매칭 페이지로 이동합니다.";
                let link = "matchingMain.jsp";
                swalOnButtonPreset(icon, title, text, link);
            </script>
        <%      }else { %>
                    <script>
                        let icon = "question";
                        let title = "데이터베이스 오류";
                        let text = "확인 버튼을 클릭하면 매칭 페이지로 이동합니다.";
                        let footer = "<a href=\"#\" style=\"color: #70BBF7; font-weight: bold\">관리자에게 문의</a>"
                        let link = "matchingMain.jsp";
                        swalOnButtonPreset(icon, title, text, footer,link);
                    </script>
        <%      }
            }else { %>
            <script>
                let icon = "question";
                let title = "데이터베이스 오류";
                let text = "확인 버튼을 클릭하면 매칭 페이지로 이동합니다.";
                let footer = "<a href=\"#\" style=\"color: #70BBF7; font-weight: bold\">관리자에게 문의</a>"
                let link = "matchingMain.jsp";
                swalOnButtonPreset(icon, title, text, footer,link);
            </script>
    <%      }
        }
    %>
</body>
</html>
