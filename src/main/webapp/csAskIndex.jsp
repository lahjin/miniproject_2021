<%@ page import="member.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ask.AskDAO" %>
<%@ page import="javabean.Ask" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String member_id = (String) session.getAttribute("member_id");
    String member_code = new MemberDAO().idToCode(member_id);
    String[] member = new MemberDAO().memberPartyInfo(member_code);
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

    <!-- 슬라이드 방향 끝 -->
    <%
        int index = Integer.parseInt(request.getParameter("index"));
        ArrayList<Ask> ask = new AskDAO().selectAsk(index);
    %>
    <div class="real-big">

        <div class="bigbox">

            <div class="textbox">
                <h2>1:1 문의 내역</h2>
                <hr>
            </div>

            <div class="title">
                <span><%=ask.get(0).getAsk_title()%></span>
                <span><%=ask.get(0).getAsk_date()%></span>
            </div>

            <div class="contents-text">

                <div class="text-area">
                    <h1>Q</h1>
                    <p>
                        <%=ask.get(0).getAsk_content()%>
                    </p>

                </div>
                <hr>
                <div class="answer-area">
                    <h1>A</h1>
                    <p>
                        <%
                            if(ask.get(0).getAsk_re() == null)
                                out.print("<h1 style='margin: 25px; color:black; text-align: center'>답변 대기중입니다</h1>");
                            else out.print(ask.get(0).getAsk_re());
                        %>
                    </p>
                </div>

                <div class="admin-answer" style="display: none">

                    <textarea name="" placeholder="답변을 적어 주세요"></textarea>

                    <div class="admin-btnbox">
                        <input type="submit" value="답변완료" class="firstbtn">
                        <a href="./csAsk-list.html">
                            <input type="button" value="돌아가기">
                        </a>
                    </div>

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