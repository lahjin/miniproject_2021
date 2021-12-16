<%@ page import="java.util.ArrayList" %>
<%@ page import="service.ServiceDAO" %>
<%@ page import="javabean.Service" %>
<%@ page import="ott.OTTDAO" %>
<%@ page import="member.MemberDAO" %>
<%@ page import="javabean.OTT" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<div class="contents-center-box">
    <div class="userarea">

        <h1>OTT 관리</h1>

        <h4>OTT를 선택해주세요</h4>
        <%
            String member_id = (String) session.getAttribute("member_id");
            String member_code = new MemberDAO().idToCode(member_id);
            ArrayList<OTT> list = new OTTDAO().memberToAllList(member_code);
        %>
        <div class="ottbox">
            <%
                for (int i=0; i<list.size(); i++){
                    String[] service = new ServiceDAO().selectService(list.get(i).getOtt_service());
            %>
                    <div class="ott"><h3 class="ottname"><%=service[0]%></h3></div>
            <%
                }if (list.isEmpty()){
            %>
                    <div class="emptyOtt"><h3>등록된 OTT가 없어요</h3></div>
            <%
                }
            %>
            <!-- 없다면 -->
            <div class="ott">
                <img src="../asset/icon/plus.png" alt="" width="30px" height="30px">
                <h3>추가</h3>
            </div>
        </div>

        <div class="ott-info">
            <div class="ott-infobox">

                <h3 class="change-ottname"></h3>

                <div class="textbox">
                    <p id="ottid">아이디 : </p>
                    <p id="ottpwd">비밀번호 : </p>
                </div>

                <div class="btn box">
                    <input type="button" value="삭제하기" id="deleteOtt">
                </div>

            </div>
        </div>

        <div class="ott-notinfo">
            <img src="../asset/icon/no-reject.png" alt="">
            <h3>OTT가 선택되지 않았습니다. 선택해주세요</h3>
        </div>

        <div class="ott-input">
            <form name="ott_input" action="" method="post">
                <h2>OTT 추가</h2>
                <div>
                    <label for="ott_service">OTT</label>
                    <select id="ott_service" name="ott_service">
                        <%
                            ArrayList<Service> serviceList = new ServiceDAO().managedService();
                            for(Service val: serviceList){
                        %>
                        <option value="<%=val.getService_code()%>"><%=val.getService_name()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div>
                    <label for="ott_id">ID</label>
                    <input type="text" id="ott_id" name="ott_id">
                </div>
                <div>
                    <label for="ott_pwd">PW</label>
                    <input type="password" id="ott_pwd" name="ott_pwd">
                </div>
                <div>
                    <a href="javascript:void(0);"><button type="submit" id="insertOtt">추가하기</button></a>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    const member_id = "<%=(String) session.getAttribute("member_id")%>";
</script>
