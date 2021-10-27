<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>회원가입</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./css/join.css">
    <link rel="stylesheet" href="./css/sweetalert.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="./js/jquery-3.6.0.min.js"></script>
    <script src="./js/sweetalert.js"></script>
    <script src="./js/swalPreset.js"></script>
    <script src="./js/join.js"></script>
</head>
<body>
    <div class="background">
        <h1>계정 만들기</h1>

        <div class="joincard">
            <!-- form태그 시작 -->

            <form action="joinAction.jsp" name="join_frm" method="post" accept-charset="UTF-8">
                <!-- 제목 a태그 -->
                <div class="area">
                    <a href="main.jsp" class="mainlogo">Assemble</a>
                </div>

                <!-- 아이디 입력 div -->
                <div class="area">
                    <h3>아이디</h3>
                    <input type="text" id="member_id" name="member_id" placeholder="등록하실 아이디를 입력해주세요." onblur="idCheck()"/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_id"></i>
                </div>

                <!-- 비밀번호 입력 div -->
                <div class="area">
                    <h3>비밀번호</h3>
                    <input type="password" id="member_pwd" name="member_pwd" placeholder="비밀번호를 입력해주세요." onblur="pwdCheck()"/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_pwd"></i>
                </div>

                <!-- 비밀번호 재확인 div -->
                <div class="area">
                    <h3>비밀번호 재확인</h3>
                    <input type="password" id="member_pwd2" name="member_pwd2" placeholder="비밀번호를 재입력해주세요." onblur="pwd2Check()"/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_pwd2"></i>
                </div>

                <!-- 이름입력 div -->
                <div class="area">
                    <h3>이름</h3>
                    <input type="text" id="member_name" name="member_name" placeholder="이름을 입력해주세요." onblur="nameCheck()"/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_name"></i>
                </div>

                <!-- 닉네임 영역 -->
                <div class="area">
                    <h3>닉네임</h3>
                    <input type="text" id="member_nickname" name="member_nickname" placeholder="닉네임을 입력해주세요." onblur="nicknameCheck()"/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_nickname"></i>
                </div>

                <div class="area">
                    <h3>이메일</h3>
                    <input type="email" id="member_email" name="member_email" placeholder="이메일을 입력해주세요." onblur="emailCheck()"/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_email"></i>
                </div>

                <div class="area">
                    <h3>생년월일</h3>
                    <input type="text" id="member_birth" name="member_birth" placeholder="생년월일을 입력해주세요. ex)2021-01-01" onblur="birthCheck()"/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_birth"></i>
                </div>

                <div class="area">
                    <h3>성별</h3>
                    <select id="member_gender" name="member_gender" onchange="genderCheck()">
                        <option value="성별">성별</option>
                        <option value="남자">남자</option>
                        <option value="여자">여자</option>
                    </select>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_gender"></i>
                </div>

                <div class="area">
                    <h3>전화번호</h3>
                    <input type="text"  id="member_phone" name="member_phone" placeholder="전화번호를 입력해주세요. ex)010-1234-5678" onblur="phoneCheck()"/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_phone"></i>
                </div>

                <div class="area">
                    <input type="submit" value="가입하기" name="signup" onclick="return signInCheck()">
                    <input type="button" value="취소하기" name="cancel" onclick="javascript:history.go(-1)">
                </div>
                <%--유효성 검사 여부 확인 div--%>
                <div class="validityCheck" id="validityCheck" style="display: none">
                    <span class="validityCheck_id" id="enableId" name="enableId" hidden></span>
                    <span class="validityCheck_pwd" id="enablePwd" name="enablePwd" hidden></span>
                    <span class="validityCheck_pwd2" id="enablePwd2" name="enablePwd2" hidden></span>
                    <span class="validityCheck_name" id="enableName" name="enableName" hidden></span>
                    <span class="validityCheck_nickname" id="enableNickname" name="enableNickname" hidden></span>
                    <span class="validityCheck_email" id="enableEmail" name="enableEmail" hidden></span>
                    <span class="validityCheck_birth" id="enableBirth" name="enableBirth" hidden></span>
                    <span class="validityCheck_gender" id="enableGender" name="enableGender" hidden></span>
                    <span class="validityCheck_phone" id="enablePhone" name="enablePhone" hidden></span>
                </div>
            </form>
        </div>

    </div>
</body>
</html>
