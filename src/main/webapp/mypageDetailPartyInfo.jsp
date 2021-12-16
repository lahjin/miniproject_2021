<%@ page import="service.ServiceDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="party.PartyDAO" %>
<%@ page import="javabean.Party" %>
<%@ page import="javabean.Entry" %>
<%@ page import="entry.EntryDAO" %>
<%@ page import="member.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 모덜창 영역 -->
<%
    String party_code = request.getParameter("code");
    ArrayList<Party> partyInfo = new PartyDAO().getPartyInfoAll(party_code);
    ArrayList<Entry> entryList = new EntryDAO().entryPartyList(partyInfo.get(0).getParty_code());

    String[] service = new ServiceDAO().selectService(partyInfo.get(0).getParty_service());
    int fee = (int) (Math.ceil(Integer.parseInt(service[2]) / 100 / partyInfo.get(0).getParty_total())*100 + 500);
    fee = Integer.parseInt(String.format("%4d", fee));
%>
<div class="mypage-party-wrap">
    <div class="mypage-party-modal">
        <div class="party-modal-top">
            <h2>파티 정보</h2>
            <img id="service_img" src="<%=service[1]%>" alt="">
        </div>

        <div class="party-modal-middle">
            <!-- 파티정보 div -->
            <div class="partyinfo">
                <!-- 파티코드 -->
                <div class="party-code">
                    <h2>파티코드</h2>
                    <h2 id="party_code"><%=partyInfo.get(0).getParty_code()%></h2>
                </div>

                <div class="party-ready">
                    <div class="user-count">
                        <h3>모집인원</h3>
                        <h2 id="entry_now"><%=partyInfo.get(0).getParty_total()%></h2>
                    </div>

                    <div class="ready">
                        <h2 id="party_state"><%=partyInfo.get(0).getParty_state()%></h2>
                    </div>
                </div>


                <div class="count-date">
                    <h2 id="entry_period"><%=partyInfo.get(0).getParty_period()%>개월</h2>
                </div>

                <div class="money">
                    <h2 id="entry_price"><%=fee%>원</h2>
                </div>

            </div>

            <!-- 파티정보 끝 -->
            <!-- 유저정보 div -->
            <div class="userinfo">
<%
                for(int i=0; i<4; i++){
                    if(i < entryList.size()){
                        String[] member = new MemberDAO().memberPartyInfo(entryList.get(i).getEntry_member());
%>
                <div class="user">
                    <div class="userimage">
                        <h1><%=i+1%></h1>
                    </div>
                    <div class="username">
                        <h3 id="member_nickName1"><%=member[0]%></h3>
                        <h4 id="entry_date1" class="userdate"><%=entryList.get(i).getEntry_date()%></h4>
                    </div>
                    <div class="userrank">
                        <h2 id="member_grade1">-</h2>
                    </div>
                </div>
<%                    }else{%>
                <div class="user">
                    <div class="userimage">
                        <h1><%=i+1%></h1>
                    </div>

                    <div class="username">
                        <h3 id="member_nickName2">-</h3>
                        <h4 id="entry_date2" class="userdate">-</h4>
                    </div>

                    <div class="userrank">
                        <h2 id="member_grade2">-</h2>
                    </div>

                </div>
<%                    }

                }
%>
            </div>
        </div>

        <div class="party-modal-bottom">
            <%
                String member_id = (String) session.getAttribute("member_id");
                String member_code = new MemberDAO().idToCode(member_id);
                if(member_code.equals(partyInfo.get(0).getParty_member())){
            %>
            <input id="party-delete" type="button" value="삭제하기">
            <%
                }
            %>
            <input id="info-back" type="button" value="뒤로가기">
        </div>

    </div>
</div>
