<%@ page import="member.MemberDAO" %>
<%@ page import="grade.GradeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="ranking_wrap">

    <div class="main_box">
        <h1>랭킹</h1>
        <div class="ranking_menu">
            <div class="ranking_number"><span>순위</span></div>
            <div class="ranking_nickName"><span>닉네임</span></div>
            <div class="ranking_grade"><span>등급</span></div>
            <div class="ranking_point"><span>점수</span></div>
        </div>

        <%
            String[][] rank = new MemberDAO().rank50List();
            for (int r = 0; r<50; r++){
                if (rank[r][0] != null){
                String grade = new GradeDAO().myGrade(Integer.parseInt(rank[r][1]));
        %>
                    <div class="ranking_data">
                        <div class="ranking_number"><span><%=r+1%></span></div>
                        <div class="ranking_nickName"><span><%=rank[r][0]%></span></div>
                        <div class="ranking_grade"><span><%=grade%></span></div>
                        <div class="ranking_point"><span><%=rank[r][1]%></span></div>
                    </div>
        <%
                }
            }
        %>

        <h3>50위 이후부터는 제공하지않습니다.</h3>
    </div>
</div>
