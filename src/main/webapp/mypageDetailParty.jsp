<%@ page import="java.util.ArrayList" %>
<%@ page import="party.PartyDAO" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="javabean.Party" %>
<%@ page import="service.ServiceDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String member_code = new MemberDAO().idToCode((String) session.getAttribute("member_id"));
    ArrayList<String> useParty = new PartyDAO().usedPartyList(member_code,"모집완료",0,4);
    ArrayList<String> gatherParty = new PartyDAO().usedPartyList(member_code,"모집중",0,4);
    ArrayList<String> pastParty = new PartyDAO().usedPartyList(member_code,"기간만료",0,4);
%>
<div class="contents-box">
    <h1 style="margin: 20px">파티 관리</h1>
<!-- 현재 파티에 대한 div -->
    <div class="now-party">
        <div class="contents-area">

            <h2>
                <span>현재 사용중인 파티</span>
                <a class="now-party-more" href="javascript:void(0)">더보기</a>
            </h2>
            <hr>
            <div class="party-area">
            <%
                for (int i=0; i<4; i++) {
                    if(i >= useParty.size()) break;
                    ArrayList<Party> nowParty = new PartyDAO().getPartyInfo(useParty.get(i));
                    String[] service = new ServiceDAO().selectService(nowParty.get(0).getParty_service());
                    String[] member = new MemberDAO().memberPartyInfo(nowParty.get(0).getParty_member());
            %>
                    <div class="party">
                        <img src="<%=service[1]%>">
                        <div class="innerbox">
                            <h3><%=service[0]%> 사용중</h3>
                            <h4>파티장<br><%=member[0]%></h4>
                            <a href="mypageDetail.jsp?category=partyInfo&code=<%=useParty.get(i)%>"><input class="usePartyBtn" type="button" value="상세정보"></a>
                        </div>
                    </div>
            <%
                }
            %>
            </div>
        </div>
    </div>

    <!-- 신청한 파티 -->
    <div class="apply-party">
        <div class="contents-area">
            <h2>
                <span>신청중인 파티</span>
                <a class="apply-party-more" href="javascript:void(0)">더보기</a>
            </h2>
            <hr>
            <div class="party-area">
                <%
                    for (int i=0; i<4; i++) {
                        if(i >= gatherParty.size()) break;
                        ArrayList<Party> applyParty = new PartyDAO().getPartyInfo(gatherParty.get(i));
                        String[] service = new ServiceDAO().selectService(applyParty.get(0).getParty_service());
                        String[] member = new MemberDAO().memberPartyInfo(applyParty.get(0).getParty_member());
                %>
                <div class="party">
                    <img src="<%=service[1]%>">
                    <div class="innerbox">
                        <h3><%=service[0]%> 신청중</h3>
                        <h4>파티장<br><%=member[0]%></h4>
                        <a href="mypageDetail.jsp?category=partyInfo&code=<%=gatherParty.get(i)%>"><input class="usePartyBtn" type="button" value="상세정보"></a>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <!-- 지난 파티에 대한 div -->
    <div class="past-party">
        <div class="contents-area">
            <h2>
                <span>지난 파티</span>
                <a class="past-party-more" href="javascript:void(0)">더보기</a>
            </h2>
            <hr>
            <div class="party-area">
                <%
                    for (int i=0; i<4; i++) {
                        if(i >= pastParty.size()) break;
                        ArrayList<Party> past_Party = new PartyDAO().getPartyInfo(pastParty.get(i));
                        String[] service = new ServiceDAO().selectService(past_Party.get(0).getParty_service());
                        String[] member = new MemberDAO().memberPartyInfo(past_Party.get(0).getParty_member());
                %>
                <div class="party">
                    <img src="<%=service[1]%>">
                    <div class="innerbox">
                        <h3><%=service[0]%> 만료됨</h3>
                        <h4>파티장<br><%=member[0]%></h4>
                        <a href="mypageDetail.jsp?category=partyInfo&code=<%=pastParty.get(i)%>"><input class="usePartyBtn" type="button" value="상세정보"></a>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>