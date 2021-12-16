<%@ page import="java.util.ArrayList" %>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="javabean.Notice" %>
<%@ page import="ask.AskDAO" %>
<%@ page import="member.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div class="middle-area">
    <h1 class="cs-text">고객센터</h1>

    <div class="category">

        <div class="notice">
            <h2>공지사항</h2>

            <div class="list">
                <!-- 아래부터 공지사항 리스트 -->
                <%
                    ArrayList<Notice> notices = new NoticeDAO().pageSelectNotice(0, 3);
                    for(int i=0; i<notices.size(); i++){
                %>
                <div class="contents">
                    <img src="asset/icon/notice.png" alt="">
                    <a href="cs.jsp?category=csNoticeInfo&index=<%=notices.get(i).getNotice_code()%>" class="title"><%=notices.get(i).getNotice_title()%></a>
                    <h4 class="date"><%=notices.get(i).getNotice_date()%></h4>
                </div>
                <hr>
                <%
                    }
                %>
            </div>

            <a href="cs.jsp?category=csNotice">
                <input type="button" value="더보기" class="move-page">
            </a>

        </div>

        <div class="often-qna">
            <h2>자주묻는질문</h2>

            <a href="cs.jsp?category=csQnA">
                <input type="button" value="확인하기" class="more_btn">
            </a>
        </div>


        <div class="ask">
            <h2 class="top-text">1:1 문의하기</h2>
            <%
                String member_id = (String) session.getAttribute("member_id");
                String member_code;
                if(member_id != null){
                    member_code = new MemberDAO().idToCode(member_id);
                    int totalAskCount = new AskDAO().upTimeAskCount(member_code);
            %>
                    <p>현재 문의 신청내역 : <%=totalAskCount%>건</p>
                    <div class="btn-box">
                        <a href="cs.jsp?category=ask">
                            <input type="button" value="문의하기">
                        </a>
                    </div>
            <%
                }else {
            %>
                    <p>로그인 이후 사용가능한 서비스 입니다.</p>
            <%    }
            %>
        </div>

        <div class="answer">
            <h2>1:1 문의답변</h2>
            <%
                if(member_id != null){
                    member_code = new MemberDAO().idToCode(member_id);
                    int nowAskCount = new AskDAO().upTimeAskCount(member_code, 0);
                    int endAskCount = new AskDAO().upTimeAskCount(member_code, 1);
            %>
            <p>답변된 대기 중 <%=nowAskCount%>건</p>

            <p>답변된 문의 <%=endAskCount%>건</p>

            <div class="btn-box">
                <a href="cs.jsp?category=askList">
                    <input type="button" value="답변확인" style="margin-left: 0px;">
                </a>
            </div>
            <%
            }else {
            %>
            <p>로그인 이후 사용가능한 서비스 입니다.</p>
            <%    }
            %>

        </div>


    </div>
</div>
