<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>약관 동의</title>
    <link rel="stylesheet" href="css/agreeJoin.css">
</head>
<body>
<!-- 전체틀을 관리해줄 큰 틀 -->
<div class="box">
    <!-- 상단 텍스트 -->
    <h1 style="margin-bottom: 20px;">Assemble</h1>
    <!-- 전체적인 내용 -->
    <form action="join.jsp" name="frm_agreeJoin" method="post">
        <!-- 첫번째 체크박스 -->
        <label class="checkbox" >
            <input type="checkbox" class="one" name="checkBox">
            <span class="icon"></span>
            <span class="text" style="text-decoration:underline;">Assemble 이용약관, 개인정보 수집 및 이용, 프로모션 정보 수신 동<br>의에 모두 동의합니다.</span>
        </label>
        <br><br>

        <!-- 두번째 체크박스 -->
        <label class="checkbox">
            <input type="checkbox" class="two" name="checkBox" onclick="clickbtn();">
            <span class="icon"></span>
            <span class="text">Assemble 이용약관에 동의</span> <span style="color: green;">(필수)</span>
        </label>

        <br>

        <!-- 동의내용 -->
        <div class="text-introduce">
               <span style="margin: 10px 0px 0px 10px; display: inline-block;" >
                <strong>여러분을 환영합니다.</strong> <br>
                Assemble 서비스를 이용하시기 전 Assemble 서비스 회원으로 가입하실 경우 여러분은
                본 약관 및 관련 웅영 정책을 확인하거나 동의하게 되므로 잠시 시간을 내시어 주의 깊게
                살펴봐 주시기 바랍니다
                <br>
                <br>
                기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다.
                다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에
                의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용,
                이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다.
                자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실
                수 있습니다.
               </span>
        </div>

        <!-- 2번 -->
        <label class="checkbox">
            <input type="checkbox" class="three" name="checkBox" onclick="clickbtn();">
            <span class="icon"></span>
            <span class="text">Assemble 개인정보 수집 및 이용 동의</span> <span style="color: green;">(필수)</span>
        </label>
        <br>
        <div class="text-introduce">
                <span style="margin: 10px 0px 0px 10px; display: inline-block;" >
                   <strong> 1. 개인정보 수집목적 및 이용목적</strong>
                    <br>
                    <br>
                    (1) 홈페이지 회원 가입 및 관리
                    <br>
                    회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정이용 방지,
                    만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의여부 확인, 각종 고지․통지, 고충처리 등의 목적
                    <br>
                    <br>
                    (2) 재화 또는 서비스 제공 <br>
                   얼씨구 절씨구 절씨구 얼씨구
                </span>
        </div>

        <!-- 3번 -->
        <label class="checkbox">
            <input type="checkbox" name="checkBox"  onclick="clickbtn();">
            <span class="icon"></span>
            <span class="text">프로모션 수신 동의</span> <span style="color: gray;">(선택)</span>
        </label>
        <br>
        <span style="margin-top: 10px; margin-left: 60px; display: block; font-size: 12px; text-align: left; width: 460px;">
                ASsemble에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화
                이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나
                가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며,
                 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.
        </span>

        <div class="btn">
            <a href="javascript:history.go(-1);"><button type="button" onclick="">취소</button></a>
            <a href="#" role="button"><button type="submit" onclick="return finalCheck()">확인</button></a>
        </div>

    </form>

</div>
    <script src="js/agreeJoin.js" defer></script>
    <script src="js/sweetalert.js"></script>
    <script src="js/swalPreset.js"></script>
</body>
</html>
