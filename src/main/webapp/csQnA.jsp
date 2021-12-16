<%@ page import="member.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String member_id = (String) session.getAttribute("member_id");
    String member_code = new MemberDAO().idToCode(member_id);
    String[] member = new MemberDAO().memberPartyInfo(member_code);
    if (member[0] == null) member[0] = "비회원";
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
    <div class="real-big">

        <div class="bigbox">

            <div class="textbox">
                <h2>자주 묻는 질문</h2>
                <hr>
            </div>

            <!-- ul li시작 -->
            <div class="middlebox">
                <!-- input check로 check여부 확인 -->
                <input type="checkbox" id="answer01">
                <label for="answer01">Q&A 어떻게 이용하나요? <em></em></label>
                <!-- 클릭시 나오는 박스 -->
                <div class="textbox">
                    <h1>Answer</h1>
                    <p>로그인 후 파티매칭을 통해 이용이 가능합니다. </p>
                </div>

                <input type="checkbox" id="answer02">
                <label for="answer02">Q&A 결제는 어떻게 하나요? <em></em></label>
                <!-- 클릭시 나오는 박스 -->
                <div class="textbox">
                    <h1>Answer</h1>
                    <p>마이페이지 → 결제관리 → 결제수단에 등록한 후 이용이 결제가 가능합ㄴ디ㅏ. </p>
                </div>

                <input type="checkbox" id="answer03">
                <label for="answer03">Q&A 파티 매칭은 얼마나 걸리나요? <em></em></label>
                <!-- 클릭시 나오는 박스 -->
                <div class="textbox">
                    <h1>Answer</h1>
                    <p>파티원 대기자와 파티 공간 비율에 따라 다르지만 일반적으로 신청일 24시간 내에  파티 매칭이 완료돼요 </p>
                </div>

                <input type="checkbox" id="answer04">
                <label for="answer04">Q&A 미성년자도 이용이 가능한가요? <em></em></label>
                <!-- 클릭시 나오는 박스 -->
                <div class="textbox">
                    <h1>Answer</h1>
                    <p>주요 OTT 서비스(넷플릭스, 웨이브, 왓챠) 모두 성인인증이 되어있어 성인콘텐츠 시청이 가능하기 때문에 미성년자는 이용이 불가능해요 </p>
                </div>

                <input type="checkbox" id="answer05">
                <label for="answer05">Q&A 파티 탈퇴/해체는 어떻게 하나요? <em></em></label>
                <!-- 클릭시 나오는 박스 -->
                <div class="textbox">
                    <h1>Answer</h1>
                    <p>파티 탈퇴는 파티 가입 한달뒤부터 가능해요(파티원)
                        파티 해체는 즉시 가능해요(파티장) </p>
                </div>

                <input type="checkbox" id="answer06">
                <label for="answer06">Q&A 플랫폼 변경은 어떻게 하나요 <em></em></label>
                <!-- 클릭시 나오는 박스 -->
                <div class="textbox">
                    <h1>Answer</h1>
                    <p>파티 탈퇴 후  다른 서비스(넷플릭스, 왓챠, 웨이브) 신청 후 이용권을 결제해주세요 </p>
                </div>

                <input type="checkbox" id="answer07">
                <label for="answer07">Q&A 사기당하면 어떻게 되나요 <em></em></label>
                <!-- 클릭시 나오는 박스 -->
                <div class="textbox">
                    <h1>Answer</h1>
                    <p>?? </p>
                </div>

                <input type="checkbox" id="answer08">
                <label for="answer08">Q&A미정<em></em></label>
                <!-- 클릭시 나오는 박스 -->
                <div class="textbox">
                    <h1>Answer</h1>
                    <p>자주하는 질문에 대한 답변내용을 넣어주세요 </p>
                </div>

            </div>

            <!-- 내용 끝 -->

        </div>
        <!-- big box -->
    </div>
    <!-- real-big -->
</div>
<!-- firstdiv -->
