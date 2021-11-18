<%@ page import="member.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="party.PartyDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String param = request.getParameter("category");
    String member_code = new MemberDAO().idToCode((String) session.getAttribute("member_id"));
    String nickname = new MemberDAO().idToNickname((String) session.getAttribute("member_id"));
%>
<div class="detail-parents">

    <!--목록을 나타내는 사이드바 div  -->
    <div class="sidebar">
        <!-- 유저 정보 -->
        <div>
            <div class="userinfo">
                <h3><%=nickname%>님</h3>
                <h3>어서오세요</h3>
            </div>
            <hr>
            <!-- 메뉴목록 -->
            <ul class="bigul">
                <li class="main-topic"><a href="mypageDetail.jsp?category=회원 정보">회원 정보 관리</a></li>
                <ul class="small-topic">
                    <li>-비밀번호 변경</li>
                    <li>-닉네임 변경</li>
                    <li>-회원탈퇴</li>
                </ul>
                <li class="main-topic"><a href="mypageDetail.jsp?category=OTT">OTT 관리</a></li>

                <li class="main-topic"><a href="mypageDetail.jsp?category=파티">파티 관리</a></li>
                <ul class="small-topic">
                    <li>-현재 사용중인 파티</li>
                    <li>-신청중인 파티</li>
                    <li>-지난 파티</li>
                </ul>
                <li class="main-topic"><a href="mypageDetail.jsp?category=글">글 관리</a></li>
                <ul class="small-topic">
                    <li>-게시물 보기</li>
                    <li>-게시물 삭제</li>
                </ul>

                <li class="main-topic"><a href="mypageDetail.jsp?category=결제">결제 관리</a></li>
                <ul class="small-topic">
                    <li>-카드변경</li>
                    <li>-??변경</li>
                </ul>
            </ul>
            <hr>
        </div>
    </div>

    <!-- 선택된 목록에 대한 컨텐츠를 나타내는 컨텐츠 박스 -->
    <div class="contents-box">
        <h1 style="margin: 20px"><%=param%> 관리</h1>
        <%
            if(param.equals("파티")){
                ArrayList<String> useParty = new PartyDAO().usedPartyList(member_code,"모집완료");
                ArrayList<String> gatherParty = new PartyDAO().usedPartyList(member_code,"모집중");
        %>
        <!-- 현재 파티에 대한 div -->
        <div class="now-party">
            <div class="contents-area">

                <h2>현재 사용중인 파티</h2>
                <hr>
                <div class="party-area">
                    <!-- 파티1 -->
                    <!-- 넷플 -->
                    <div class="party netflix">
                        <div class="innerbox">
                            <h3>넷플릭스 사용중</h3>
                            <h4>파티장<br>누구누구누구누구누구님</h4>
                            <input class="usePartyBtn" type="button" value="상세정보">
                        </div>
                    </div>

                    <!-- 왓챠 -->
                    <div class="party watcha">
                        <div class="innerbox">
                            <h3>왓챠 사용중</h3>
                            <h4>파티장<br>누구누구누구누구누구님</h4>
                            <input class="usePartyBtn" type="button" value="상세정보">
                        </div>
                    </div>

                    <!-- 웨이브 -->
                    <div class="party wavve">
                        <div class="innerbox">
                            <h3>웨이브 사용중</h3>
                            <h4>파티장<br>누구누구누구누구누구님</h4>
                            <input class="usePartyBtn" type="button" value="상세정보">
                        </div>
                    </div>


                    <!-- 밀리의서재 -->
                    <div class="party millie">
                        <div class="innerbox">
                            <h3>밀리의 서재 사용중</h3>
                            <h4>파티장<br>누구누구누구누구누구님</h4>
                            <input class="usePartyBtn" type="button" value="상세정보">
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- 신청한 파티 -->
        <div class="apply-party">
            <div class="contents-area">
                <h2>신청중인 파티</h2>
                <hr>
                <div class="party-area">
                    <!-- 파티1 -->
                    <div class="party netflix">
                        <div class="innerbox">
                            <h3>넷플릭스 신청중</h3>
                            <h4>파티장<br>누구누구누구누구누구님</h4>
                            <input class="waitPartyBtn" type="button" value="상세정보">
                        </div>
                    </div>

                    <div class="party watcha">
                        <div class="innerbox">
                            <h3>왓챠 신청중</h3>
                            <h4>파티장<br>누구누구누구누구누구님</h4>
                            <input class="waitPartyBtn" type="button" value="상세정보">
                        </div>
                    </div>

                    <div class="party wavve">
                        <div class="innerbox">
                            <h3>웨이브 신청중</h3>
                            <h4>파티장<br>누구누구누구누구누구님</h4>
                            <input class="waitPartyBtn" type="button" value="상세정보">
                        </div>
                    </div>

                    <div class="party millie">
                        <div class="innerbox">
                            <h3>밀리 신청중</h3>
                            <h4>파티장<br>누구누구누구누구누구님</h4>
                            <input class="waitPartyBtn" type="button" value="상세정보">
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- 지난 파티에 대한 div -->
        <div class="past-party">
            <div class="contents-area">
                <h2>지난 파티</h2>
                <hr>
                <div class="party-area">
                    <!-- 파티1 -->
                    <div class="party netflix">
                        <div class="innerbox">
                            <h3>지난기록</h3>
                            <h4>파티장<br>누구누구누구누구누구님</h4>
                            <input class="endPartyBtn" type="button" value="상세정보">
                        </div>
                    </div>

                    <div class="party watcha">
                        <div class="innerbox">
                            <h3>지난기록</h3>
                            <h4>파티장<br>누구누구누구누구누구님</h4>
                            <input class="endPartyBtn" type="button" value="상세정보">
                        </div>
                    </div>

                    <div class="party wavve">
                        <div class="innerbox">
                            <h3>지난기록</h3>
                            <h4>파티장<br>누구누구누구누구누구님</h4>
                            <input class="endPartyBtn" type="button" value="상세정보">
                        </div>
                    </div>

                    <div class="party millie">
                        <div class="innerbox">
                            <h3>지난기록</h3>
                            <h4>파티장<br>누구누구누구누구누구님</h4>
                            <input class="endPartyBtn" type="button" value="상세정보">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end -->
        <%
            }else{
        %>
            <div style="text-align: center; margin-top: 10%">
                <h1>준비중입니다</h1>
            </div>
        <%
            }
        %>
    </div>
</div>
