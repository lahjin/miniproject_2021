<%@ page import="javabean.Service" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.ServiceDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- 매칭1 시작-->
<div id="matchingF">
    <form action="" name="frm_matching" method="post">

        <!-- 문구 시작-->
        <div class="paragraph">
            <h1>원하는 열차에 탑승하세요!</h1>
            <h2>선택하신 플랫폼을 자유롭게 이용할 수 있습니다.</h2>
            <h3> 어떤 이용객을 만날지 궁금한가요? 그럼 OTT열차 출발합니다!</h3>
        </div>
        <!-- 문구 끝-->

        <!-- OTT 목록 시작-->
        <div class="slide">
            <div class="slide_wrapper ">
                <ul class="slides flex">
                    <%
                        ArrayList<Service> list = new ArrayList<>();
                        list = new ServiceDAO().managedService();
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
            </div>
            <p class="controls">
                <span class="prev">prew</span>
                <span class="next">next</span>
            </p>
        </div>
        <!-- OTT 목록 끝-->

        <!-- 열차이미지 시작-->
        <div class="trainArea" id="trainArea">
            <img class="train" src="./asset/img/train.png" onclick="this.style.left='450px'">
        </div>
        <!-- 열차 이미지 끝-->

        <!--버튼영역 시작-->
        <div class="colorCont" name='colorChange' id='colorChange'>
            <div class="threeBtn">
                <%
                    //로그인 안했을시
                    if(session.getAttribute("member_id") == null){
                %>
                    <input type= "button" class="button" value="매칭하기" onclick="loginSession()"/>
                    <input type= "button" class="button" value="파티만들기" onclick="loginSession()" />
                    <input type= "button" class="button" value="링크" onclick="loginSession()" />
                <%
                    }else {
                %>
                    <input type= "button" class="button" id="startMatching" value="매칭하기"/>
                    <input type= "button" class="button" id="makeParty" value="파티만들기" />
                    <input type= "button" class="button" id="accessLink" value="링크" />
                <%
                    }
                %>
            </div>
        </div>
        <!--버튼영역 끝-->

    </form>

</div>
<!--매칭1 끝-->