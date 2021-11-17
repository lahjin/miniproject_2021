<%@ page import="service.ServiceDAO" %>
<%@ page import="javabean.Service" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="member.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>파티 만들기</title>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="./css/matchingCreate.css">
</head>
<body>
<div class="wrap">
  <h1>파티 만들기</h1>

  <div class="formDiv">
    <!-- form태그 시작 -->

    <form action="matchingCreateAction.jsp" name="partyCreate_frm" method="post" accept-charset="UTF-8">
      <!-- 제목 a태그 -->
      <div class="area">
        <a href="main.jsp" class="mainlogo">MODIVA</a>
      </div>

      <!-- 닉네임 영역 -->
      <%
        MemberDAO memberDAO = new MemberDAO();
        String sid = (String) session.getAttribute("member_id");
        String nickname = memberDAO.idToNickname(sid);
      %>
      <div class="area">
        <h3>닉네임</h3>
        <input type="text" id="member_nickname" name="member_nickname" value="<%= nickname %>" readonly />
      </div>

      <!-- 서비스 영역 -->
      <div class="area">
        <h3>서비스</h3>
        <div class ="slide_wrapper">
          <ul class="slides">
            <%
              ServiceDAO serviceDAO = new ServiceDAO();
              ArrayList<Service> list = new ArrayList<>();
              list = serviceDAO.managedService();
              for(Service values: list){
            %>
            <li>
              <div class="items">
                <input type="radio" class="serviceRadio" id="<%= values.getService_name()%>" name="service" value="<%= values.getService_code()%>">
                <label for="<%= values.getService_name()%>">
                  <img src="<%= values.getService_img()%>" alt="Not found image" width="100px" height="100px">
                  <%= values.getService_name()%>
                </label>
              </div>
            </li>
            <%
              }
            %>
          </ul>
          <p class="controls">
            <span class="prev">prev</span>
            <span class="next">next</span>
          </p>
        </div>
      </div>

      <!-- 기간 영역 -->
      <div class="area">
        <h3>기간</h3>
        <select id="party_period"  name="party_period" onchange="">
          <option value="기간">기간</option>
          <option value="1개월">1개월</option>
          <option value="3개월">3개월</option>
          <option value="6개월">6개월</option>
          <option value="12개월">12개월</option>
        </select>
      </div>

      <!-- 모집인원 영역 -->
      <div class="area">
        <h3>모집인원</h3>
        <select id="party_total" name="party_total" onchange="">
          <option value="모집인원">모집인원</option>
          <option value="2명">2명</option>
          <option value="3명">3명</option>
          <option value="4명">4명</option>
        </select>
      </div>

      <div class="area">
        <input type="submit" value="생성하기" name="partyCreate">
        <input type="button" value="뒤로가기" name="cancel" onclick="javascript:history.go(-1)">
      </div>
    </form>
  </div>

</div>
<script src="./js/matchingCreate.js"></script>
<%
  String code = request.getParameter("service");
  String[] service = new ServiceDAO().selectService(code);
%>
<script>
  document.getElementById('<%= service[0]%>').checked = true;
</script>
</body>
</html>

