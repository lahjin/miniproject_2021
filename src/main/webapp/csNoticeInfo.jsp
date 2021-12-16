<%@ page import="member.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javabean.Notice" %>
<%@ page import="notice.NoticeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String member_id = (String) session.getAttribute("member_id");
    String member_code = new MemberDAO().idToCode(member_id);
    String[] member = new MemberDAO().memberPartyInfo(member_code);
    if (member[0] == null) member[0] = "비회원";

    int index = Integer.parseInt(request.getParameter("index"));
    ArrayList<Notice> list = new NoticeDAO().selectNotice(index);
%>
<div class="firstdiv">
    <div class="sidebar">
        <!-- 유저 정보 -->
        <div>
            <div class="userinfo">
                <h3><%=member[0]%>님 </h3> <!-- 유저 이름-->
                <h3>안녕하세요</h3>
            </div>
            <hr>
            <!-- 메뉴목록 -->
            <ul class="bigul">
                <li class="main-topic">
                    <a href="cs.jsp?category=csNotice">공지사항</a>
                </li>

                <li class="main-topic">
                    <a href="cs.jsp?category=csQnA">자주묻는질문</a>
                </li>

                <li class="main-topic">
                    <a href="cs.jsp?category=ask">1:1문의</a>
                </li>

                <li class="main-topic">
                    <a href="cs.jsp?category=askList">1:1문의 내역</a>
                </li>
            </ul>
            <hr>
        </div>
    </div>
    <div class="real-big">

        <div class="bigbox">

            <div class="textbox">
                <h2>공지사항</h2>
                <hr>
            </div>

            <div class="title">
                <span><%=list.get(0).getNotice_title()%></span>
                <span><%=list.get(0).getNotice_date()%></span>
            </div>

            <div class="contents-text">
                <div class="text-area">

                    <p>
                        <%=list.get(0).getNotice_content()%>
                    </p>

                </div>
            </div>

            <div class="bottombox">
                <a href="javascript:history.back()">
                    <input type="button" value="글 목록">
                </a>
            </div>

        </div>
    </div>

</div>