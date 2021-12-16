<%@ page import="java.util.ArrayList" %>
<%@ page import="service.ServiceDAO" %>
<%@ page import="party.PartyDAO" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="javabean.Party" %>
<%@ page import="grade.GradeDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    if(session.getAttribute("member_id") == null){
        RequestDispatcher dispatcher = request.getRequestDispatcher("matchingSelectError.jsp");
        dispatcher.forward(request, response);
    }

    String service_code = request.getParameter("service");
    ServiceDAO serviceDAO = new ServiceDAO();
    String[] service = serviceDAO.selectService(service_code);

    PartyDAO partyDAO = new PartyDAO();
    ArrayList<Party> list = partyDAO.selectParty(service_code,0,6);

    String nickName = new MemberDAO().idToNickname((String) session.getAttribute("member_id"));
    if (list.isEmpty()) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("matchingSelectError.jsp");
        dispatcher.forward(request, response);
    }
%>

<div class="matching_select">
    <div class="sidebar">
        <h2><%=nickName%>님이 <br> 선택하신 서비스는 </h2>
        <img src="<%=service[1]%>" alt="OTT이미지">
        <input id="service" type="hidden" value="<%=service_code%>">
        <input id="backOtt" type="button" value="다른 OTT 선택하기">
    </div>

    <!-- 파티 영역 -->
    <div class="cash-area">
        <!-- 상단 텍스트 영역 -->

        <div class="top-text">
            <h2>파티 매칭</h2>
            <p>원하시는 파티를 선택하세요</p>
        </div>
        <!-- 파티 목록 div -->
        <div class="middle-area">
            <%
                for(int cnt=0; cnt<6; cnt++){
                    if(list.size() > cnt){
                        String[] memberInfo = new MemberDAO().memberPartyInfo(list.get(cnt).getParty_member());
                        int fee = (int) (Math.ceil(Integer.parseInt(service[2]) / 100 / list.get(cnt).getParty_total())*100 + 500);
                        fee = Integer.parseInt(String.format("%4d", fee));
                        String grade = new GradeDAO().myGrade(Integer.parseInt(memberInfo[1]));
            %>
                <div class="party-info">
                    <div class="top-text">
                        <h3><%=memberInfo[0]%>님의 파티</h3>
                        <h3><%=grade%></h3>
                    </div>
                    <!-- 유저 매칭현황 요약 -->
                    <span class="date"><%=list.get(cnt).getParty_start()%></span>

                    <h2 class="fee"><%=fee%>원</h2>

                    <div class="party-btnbox">
                        <div class="user-countbox">
                            <%
                                for(int mCnt=0; mCnt < list.get(cnt).getParty_total(); mCnt++){
                                    if (mCnt < list.get(cnt).getParty_now()){
                            %>
                                        <img src="./asset/icon/user.png" alt="" class="onuser">
                            <%
                                    }else {
                            %>
                                        <img src="./asset/icon/user.png" alt="">
                            <%
                                    }
                                }
                            %>
                        </div>
                        <input id="<%=cnt%>" type="button" value="상세보기" class="openBtn">
                    </div>
                </div>
            <%
                    }else{
            %>
                <div class="party-null">

                    <h1 class="circle">X</h1>
                    <span class="no-party">파티정보가 없어요</span>

                </div>
            <%
                    }
                }
            %>
        </div>
        <!-- 하단 버튼 div -->
        <div class="btn-box">
            <input type="button" id="createPartyBtn" value="파티만들기">
            <span id="pageNumber" class="pageNumber">Page1</span>
            <input type="button" id="prevPartyBtn" value="이전파티">
            <input type="button" id="nextPartyBtn" value="다음파티">
        </div>
    </div>
</div>