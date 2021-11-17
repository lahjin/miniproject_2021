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
    <script src="./js/join.js" defer></script>
</head>
<body>
<%
    String[] checkBox = request.getParameterValues("checkBox");
    String promotionChecked = null;

    if (checkBox.length == 4){
        promotionChecked = "Y";
    }else{
        promotionChecked = "N";
    }
%>
    <div class="background">
        <h1>계정 만들기</h1>

        <div class="joincard">
            <!-- form태그 시작 -->

            <form name="join_frm" method="post" accept-charset="UTF-8">
                <!-- 제목 a태그 -->
                <div class="area">
                    <a href="main.jsp" class="mainlogo">MODIVA</a>
                </div>

                <!-- 아이디 입력 div -->
                <div class="area">
                    <label for="member_id">아이디</label>
                    <input type="text" id="member_id" name="member_id" placeholder="등록하실 아이디를 입력해주세요."/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_id"></i>
                </div>

                <!-- 비밀번호 입력 div -->
                <div class="area">
                    <label for="member_pwd">비밀번호</label>
                    <input type="password" id="member_pwd" name="member_pwd" placeholder="비밀번호를 입력해주세요."/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_pwd"></i>
                </div>

                <!-- 비밀번호 재확인 div -->
                <div class="area">
                    <label for="member_pwd2">비밀번호  재확인</label>
                    <input type="password" id="member_pwd2" name="member_pwd2" placeholder="비밀번호를 재입력해주세요."/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_pwd2"></i>
                </div>

                <!-- 이름입력 div -->
                <div class="area">
                    <label for="member_name">이름</label>
                    <input type="text" id="member_name" name="member_name" placeholder="이름을 입력해주세요."/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_name"></i>
                </div>

                <!-- 닉네임 영역 -->
                <div class="area">
                    <label for="member_nickname">닉네임</label>
                    <input type="text" id="member_nickname" name="member_nickname" placeholder="닉네임을 입력해주세요."/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_nickname"></i>
                </div>

                <div class="area">
                    <label for="member_email">이메일</label>
                    <input type="email" id="member_email" name="member_email" placeholder="이메일을 입력해주세요."/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_email"></i>
                </div>

                <div class="area">
                    <label for="member_birth">생년월일</label>
                    <input type="text" id="member_birth" name="member_birth" placeholder="생년월일을 입력해주세요. ex)20210101"/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_birth"></i>
                </div>

                <div class="area">
                    <label for="member_gender">성별</label>
                    <select id="member_gender" name="member_gender">
                        <option value="성별">성별</option>
                        <option value="남자">남자</option>
                        <option value="여자">여자</option>
                    </select>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_gender"></i>
                </div>

                <div class="area">
                    <label for="member_phone">전화번호</label>
                    <input type="text"  id="member_phone" name="member_phone" placeholder="전화번호를 입력해주세요. ex)01012345678"/>
                    <i class="far fa-times-circle hiddenUI" id="validityCheck_phone"></i>
                </div>

                <div class="area">
                    <input type="button" value="가입하기" id="signup" name="signup">
                    <input type="button" value="취소하기" id="cancel" name="cancel">
                </div>

                <div>
                    <label for="member_promotion">프로모션 동의</label>
                    <input type="text" id="member_promotion" name="member_promotion" value="<%= promotionChecked %>" readonly>
                </div>

            </form>
        </div>

    </div>
</body>
</html>
