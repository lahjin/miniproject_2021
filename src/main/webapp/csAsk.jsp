<%@ page import="member.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String member_id = (String) session.getAttribute("member_id");
    if(member_id == null){
%>
<script>
    location.href = "dataAction.jsp?info=4&msg=1";
</script>
<%
    }
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

<!-- BigBox를 감싸주는 div -->
<form action="AskWrite" class="real-big">
    <div class="bigbox">

        <div class="textbox">
            <h2>1:1문의하기</h2>
            <hr>
        </div>

        <div class="middlebox">

            <ul class="userarea">
                <li>
                    <span>사용자</span>
                    <input type="text" class="username" name="member_nickname" value="<%=member[0]%>" readonly>
                    <input type="hidden" class="member_code" name="ask_member" value="<%=member_code%>" readonly>
                </li>

                <li>
                    <span>제목</span>
                    <input type="text" class="titlename" name="ask_title" placeholder="제목을 입력해주세요">
                </li>

                <li>
                    <span>내용</span>
                    <textarea id="contents" name="ask_content"></textarea>
                </li>
            </ul>

            <div class="notice">
                <ul>
                    <li>성격에 맞지 않는 문의는 사전 통보 없이 삭제 되는점을 양해 부탁드립니다</li>
                </ul>
            </div>
        </div>

        <div class="bottombox">
            <input type="button" value="취소">
            <input type="submit" value="문의">
        </div>

    </div>
</form>
</div>
