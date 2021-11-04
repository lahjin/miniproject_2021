<%@ page import="java.util.ArrayList" %>
<%@ page import="service.ServiceDAO" %>
<%@ page import="party.PartyDAO" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="javabean.Party" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String service_code = request.getParameter("service");
    ServiceDAO serviceDAO = new ServiceDAO();
    String[] service = serviceDAO.selectService(service_code);

    PartyDAO partyDAO = new PartyDAO();
    ArrayList<Party> list = partyDAO.selectParty(service_code);

    if(list.isEmpty()){
        RequestDispatcher dispatcher = request.getRequestDispatcher("matchingSelectError.jsp");
        dispatcher.forward(request, response);
    }
%>

<!-- matching_select 시작-->
<div class = "matching_select">
    <!-- text 라인 시작-->
    <div class="service_text">
        <h2>현황</h2>
    </div>
    <!-- text 라인 끝-->

    <!--option_panel시작 -->
    <div class="option_panel">
        <div class="service">
            <img class="service_img" src="<%= service[1] %>" alt="Not found image">
            <label class="service_name" id="service_name"><%= service[0] %></label>
        </div>
        <div class="matching_state">
            <div class="weeklyState">
                <div class="weeklyCreate">
                    <label>이번주 매칭생성현황 </label>
                    <label id="weeklyCreate">10건</label>
                </div>
                <div class="weeklySuccess">
                    <label>이번주 매칭성공현황 </label>
                    <label>30건</label>
                </div>
            </div>
        </div>
    </div>
    <!--option_panel끝 -->

    <!-- text 라인 시작-->
    <div class="service_text">
        <h2>파티 목록</h2>
    </div>
    <!-- text 라인 끝-->

    <!--select_party시작 -->
    <div class="select_party">
        <%
            for(int cnt=0; cnt <3; cnt++){
                if(list.size() > cnt){
                String[] member = new MemberDAO().memberPartyInfo(list.get(cnt).getParty_member());
        %>
                    <!-- 파티1 시작-->
                    <div class="party" onclick="modalInfo('<%=list.get(cnt).getParty_code()%>','<%=list.get(cnt).getParty_period()%>',
                            '<%=service[2]%>','<%=list.get(cnt).getParty_now()%>', '<%=list.get(cnt).getParty_total()%>')">
                        <div class="info1">
                            <img src="./asset/icon/king.png" />
                            <label><%= member[0] %></label>
                            <label>[<%= list.get(cnt).getParty_now()%>/<%= list.get(cnt).getParty_total()%>]</label>
                        </div>
                        <div class="info2">
                            <div class="info2_top">
                                <div class="grade">
                                    <label>등급</label>
                                    <label><%= member[1] %></label>
                                </div>
                                <div class="period">
                                    <label>기간</label>
                                    <label><%= list.get(cnt).getParty_period()%>개월</label>
                                </div>
                            </div>
                            <div class="info2_bottom">
                                <div class="price">
                                    <label>예상금액</label>
                                    <label><%= service[2] %></label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 파티1 끝-->
        <%     }else{%>
                    <div class="party">
                        파티가 더 존재하지 않아요!
                    </div>
        <%      }
            }
        %>

    </div>
    <!--select_party 끝 -->

    <!-- button_panel 시작-->
    <div class="button_panel">
        <div class="create_party">
            <p>파티가 맘에 안든다면?</p>
            <input type="button" value="파티만들기">
        </div>
        <div class="otherSelect_party">
            <p>다른 파티를 보고싶으면?</p>
            <input type="button" value="더보기">
        </div>
        <div class="otherService_party">
            <p>서비스를 변경할려면?</p>
            <input type="button" value="파티찾기">
        </div>
    </div>
    <!-- button_panel 끝 -->
</div>
<!-- matching_select 끝 -->


<%--모달창--%>
<div class="modal-wrap">
    <div class="modal-matchingInfo">
        <div class="modal-title">
            <h1>파티 정보</h1>
        </div>
        <div class="info">
            <div class="code-info">
                <div class="data-info">
                    <label>파티코드</label>
                </div>
                <div class="value-info">
                    <label id="entry_party">code?</label>
                </div>
            </div>
            <div class="service-info">
                <div class="data-info">
                    <label>서비스</label>
                </div>
                <div class="value-info">
                    <label id="entry_service">service?</label>
                </div>
            </div>
            <div class="period-info">
                <div class="data-info">
                    <label>기간</label>
                </div>
                <div class="value-info">
                    <label id="entry_period">period?</label>

                </div>
            </div>
            <div class="price-info">
                <div class="data-info">
                    <label>가격</label>
                </div>
                <div class="value-info">
                    <label id="entry_price">price?</label>
                </div>
            </div>
        </div>
        <div class="party-entry">
            <div class="entry-index">
                <div class="data-info">
                    <label>닉네임</label>
                </div>
                <div class="data-info">
                    <label>가입일</label>
                </div>
            </div>

            <div class="entry-list">
                <div class="entry-info">
                    <div class="value-info">
                        <label id="entry_member1">nick?</label>
                    </div>
                    <div class="value-info">
                        <label id="entry_date1">date?</label>
                    </div>
                </div>
            </div>

            <div class="entry-list">
                <div class="entry-info">
                    <div class="value-info">
                        <label id="entry_member2">nick??</label>
                    </div>
                    <div class="value-info">
                        <label id="entry_date2">date??</label>
                    </div>
                </div>
            </div>

            <div class="entry-list">
                <div class="entry-info">
                    <div class="value-info">
                        <label id="entry_member3">nick???</label>
                    </div>
                    <div class="value-info">
                        <label id="entry_date3">date???</label>
                    </div>
                </div>
            </div>

            <div class="entry-list">
                <div class="entry-info">
                    <div class="value-info">
                        <label id="entry_member4">nick????</label>
                    </div>
                    <div class="value-info">
                        <label id="entry_date4">date????</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="entry-count">
            <div class="entry-now">
                <div class="data-info">
                    <label>현재인원</label>
                </div>
                <div class="value-info">
                    <label id="entry_now">?명</label>
                </div>
            </div>
            <div class="entry-total">
                <div class="data-info">
                    <label>모집인원</label>
                </div>
                <div class="value-info">
                    <label id="entry_total">?명</label>
                </div>
            </div>
        </div>
        <div class="entry-btn">
            <button type="button" id="party-enter">파티가입</button>
            <button type="button" id="info-close">취소하기</button>
        </div>
    </div>
</div>