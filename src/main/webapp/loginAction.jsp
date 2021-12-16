<%-- 로그인 처리를 담당하는 jsp Action --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@page import="member.MemberDAO" %>
<%@ page import="generator.IpGenerator" %>
<%@ page import="logIn_log.LogIn_logDAO" %> <%-- MemberDAO 클래스 import--%>
<script src="./js/sweetalert.js"></script>
<script src="./js/login.js"></script>
<jsp:useBean id="member" class="javabean.Member"/> <%-- 자바빈 방식으로 데이터를 class 단위로 이동 --%>
<jsp:setProperty name="member" property="*"/>      <%-- member로 불러온 자바빈에 property가 일치하는 값에 자동으로 set 해줌 --%>
<%
    MemberDAO memberDAO = new MemberDAO();

    //memberDAO에서 처리한 로그인 결과를 받아옴
    int result = memberDAO.login(member.getMember_id(), member.getMember_pwd());

    switch (result){
        case 1: //로그인 성공
            session.setAttribute("member_id", member.getMember_id()); //member_id 값으로 세션 생성
            String member_code = new MemberDAO().idToCode(member.getMember_id()); //회원코드
            String ip = new IpGenerator().getClientIP(request); //접속한 ip주소 가져옴
            int rs1 = new LogIn_logDAO().insertLog(member_code,ip); //로그인 로그 생성
            if(rs1 == 1){
                String datetime = new LogIn_logDAO().logDatetime(member_code);
                int rs2 = new MemberDAO().updateMemberLog(datetime,member_code);
            }
            response.sendRedirect("main.jsp"); //main페이지로 세션값을 가지고 보내줌
            break;

        case 0: //로그인 실패 사유: 비밀번호가 틀림
            session.setAttribute("loginError","pwdError"); //loginError이름으로  pwdError 값을 가진 세션 생성
            response.sendRedirect("login.jsp");
            break;

        case -1: //로그인 실패 사유: 아이디가 없음
            session.setAttribute("loginError","idError"); //loginError이름으로  idError 값을 가진 세션 생성
            response.sendRedirect("login.jsp");
            break;

        case -2: //로그인 실패 사유: DB서버 연결 오류
            session.setAttribute("loginError","dbSeverError"); //loginError이름으로  dbSeverError 값을 가진 세션 생성
            response.sendRedirect("login.jsp");
            break;
    }
%>
