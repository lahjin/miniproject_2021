<%@ page import="java.util.ArrayList" %>
<%@ page import="member.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    ArrayList<Object> list = new MemberDAO().myInfo((String) session.getAttribute("member_id"));

%>
<div class="contents-center-box">
    <!-- 회원정보 시작 -->
    <div class="userarea">

        <h1 class="title-text">회원 정보</h1>
        <hr>
        <br>
        <div class="now-info">

            <div class="profile">
                <div class="userimage"></div>
                <h3><%=list.get(3)%>님</h3>
            </div>

            <div class="Detail">
                <div class="Detail-info">
                    <div class="first-icon">N</div>
                    <div class="info-box">
                        <h4>닉네임</h4>
                        <span><%=list.get(8)%></span>
                    </div>
                </div>

                <div class="Detail-info">
                    <div class="first-icon">E</div>
                    <div class="info-box">
                        <h4>이메일</h4>
                        <span><%=list.get(4)%></span>
                    </div>
                </div>

                <div class="Detail-info">
                    <div class="first-icon">P</div>

                    <div class="info-box">
                        <h4>휴대전화</h4>
                        <span><%=list.get(5)%></span>
                    </div>
                </div>

                <div class="Detail-info">
                    <div class="first-icon">B</div>
                    <div class="info-box">
                        <h4>생일</h4>
                        <span><%=list.get(6)%></span>
                    </div>
                </div>

                <div class="Detail-info">
                    <div class="first-icon">G</div>
                    <div class="info-box">
                        <h4>성별</h4>
                        <span><%=list.get(7)%></span>
                    </div>
                </div>

                <div class="Detail-info">
                    <div class="first-icon">D</div>
                    <div class="info-box">
                        <h4>가입일</h4>
                        <span><%=list.get(10).toString().substring(0,10)%></span>
                    </div>
                </div>
            </div>
        </div>

        <!-- 카테고리를 보여주는 부모 div -->
        <div class="flex-parent">
            <!-- 회원 이미지 -->
            <div class="userimage-edit">
                <h3>비밀번호 변경</h3>
                    <!-- 프로필 div -->
                    <span>회원 비밀번호를 변경하시려면 <br> 아래 버튼을 눌러주세요</span>
                    <a href="mypageDetail.jsp?category=edit-pwd"><input type="button" value="변경" class="edit-btn"></a>
            </div>


            <!-- 유저 패스워드 변경 -->
            <div class="userpwd-info">
                <h3>닉네임 변경</h3>
                <span>회원 닉네임을 변경하시려면 <br>  아래 버튼을 눌러주세요</span>
                <a href="mypageDetail.jsp?category=edit-nickname"><input type="button" value="변경" class="edit-btn"></a>
            </div>
            <!-- 회원탈퇴 -->
            <div class="user-secession">
                <h3>회원탈퇴</h3>
                <!-- 아래영역 텍스트 -->
                <span>회원탈퇴를 원하시면 <br> 아래 버튼을 눌러주세요</span>
                <a href="mypageDetail.jsp?category=user-withdrawal"><input type="button" value="탈퇴" class="edit-btn secession"></a>
            </div>
        </div>

    </div>
</div>