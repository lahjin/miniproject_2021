// 유효성검사 정규식 패턴
var idReg = /^[a-z0-9]{4,12}$/g; //영문 소문자 or 숫자로만 이루어진 4~12글자
var pwdReg = /^(?=.*[A-Za-z])(?=.*\d).{8,16}$/g; //최소 한개의 문자 + 숫자 특수문자는 선택 8~16글자
var nameReg = /^[a-zA-Z가-힣]{3,20}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; //온전한한글 or 영문 3-20글자 && 영문이름 띄어쓰기 대비 앞 2~10글자 뒤 2~10글자
var nickReg = /^[A-Za-z0-9가-힣]{2,10}$/g; //영문 대소문자 or 숫자 or 온전한 한글로 이루어진 4~16글자
var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; //이메일 정규식
var birthReg = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/g; //생년월일 정규식
// var phoneReg = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/; //전화번호 정규식(구형번호까지)
var phoneReg = /^010-\d{4}-\d{4}$/; //전화번호 정규식 010-xxxx-xxxx 010고정에 4자리 4자리

//유효성검사 체크UI
var ERROR_CLASS = "far fa-times-circle unableValue";
var SUCCESS_CLASS = "far fa-check-circle ableValue";

//swalPreset에 넘겨줄 매개변수
var icon = null;
var title = null;

//아이디 유효성 검사
function idCheck() {
    //input박스에 member_id값을 가져옴
    var member_id = document.getElementById("member_id").value;
    //ajax로 중복체크 확인
    $.ajax({
        type: 'post',
        url: "IdCheck",
        dataType: 'text',
        data: {member_id: member_id}, //member_id변수를 member_id로 바꿔서 데이터 전송
        //성공시 함수
        success: function (data) {
            //아이디 공백
            if (member_id.length == 0) {
                icon = 'error';
                title = '아이디를 입력해주세요!';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                $("#validityCheck_id").removeClass().addClass(ERROR_CLASS);
                document.getElementById('enableId').innerText = "unable";
            }
            //아이디 정규식 위반
            else if (!idReg.test(member_id)) {
                icon = 'warning';
                title = '아이디는 4~12자의 영문 소문자, 숫자만 사용 가능합니다!';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                $("#validityCheck_id").removeClass().addClass(ERROR_CLASS);
                document.getElementById('enableId').innerText = "unable";
            }
            //아이디 중복
            else if (data == 1) {
                icon = 'warning';
                title = '이미 존재하는 아이디입니다!';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                $("#validityCheck_id").removeClass().addClass(ERROR_CLASS);
                document.getElementById('enableId').innerText = "unable";
            }
            //아이디 사용가능
            else if (data == 0) {
                var icon = 'success';
                var title = '사용가능한 아이디입니다!';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                $("#validityCheck_id").removeClass().addClass(SUCCESS_CLASS);
                document.getElementById('enableId').innerText = "checked";
            }
        }
    });
}

//비밀번호 유효성 검사
function pwdCheck() {
    //input박스에 member_pwd값을 가져옴
    var member_pwd = document.getElementById("member_pwd").value;
    //<span id="enablePwd2">의 텍스트 값을 가져옴
    var enablePwd2 = document.getElementById("enablePwd2").innerText;
    //비밀번호 공백
    if (member_pwd.length == 0) {
        icon = 'error';
        title = '비밀번호를 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enablePwd').innerText = "unable";
        //비밀번호와 비밀번호 재확인까지 다 체크하고 나서 다시 비밀번호를 변경했을 때 대비
        if (enablePwd2 == "checked") {
            $("#validityCheck_pwd2").removeClass().addClass(ERROR_CLASS);
            document.getElementById('enablePwd2').innerText = "unable";
        }
    }
    //비밀번호 정규식 위반
    else if (!pwdReg.test(member_pwd)) {
        icon = 'warning';
        title = '비밀번호는 8~16자의 최소 1개의 영문 대소문자, 숫자, 특수문자(선택)만 사용 가능합니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enablePwd').innerText = "unable";
        //비밀번호와 비밀번호 재확인까지 다 체크하고 나서 다시 비밀번호를 변경했을 때 대비
        if (enablePwd2 == "checked") {
            $("#validityCheck_pwd2").removeClass().addClass(ERROR_CLASS);
            document.getElementById('enablePwd2').innerText = "unable";
        }
    }
    //사용가능한 비밀번호
    else {
        icon = 'success';
        title = '사용가능한 비밀번호입니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd").removeClass().addClass(SUCCESS_CLASS);
        document.getElementById('enablePwd').innerText = "checked";
    }
}

//비밀번호 재확인 유효성 검사
function pwd2Check() {
    //input박스에 member_pwd값을 가져옴
    var member_pwd = document.getElementById("member_pwd").value;
    //input박스에 member_pwd2값을 가져옴
    var member_pwd2 = document.getElementById("member_pwd2").value;
    //<span id="enablePwd">의 텍스트 값을 가져옴
    var enablePwd = document.getElementById("enablePwd").innerText;
    //비밀번호 공백
    if (member_pwd.length == 0) {
        icon = 'error';
        title = '비밀번호를 먼저 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd").removeClass().addClass(ERROR_CLASS);
        $("#validityCheck_pwd2").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enablePwd').innerText = "unable";
        document.getElementById('enablePwd2').innerText = "unable";
    }
    //비밀번호 확인 공백    
    else if (member_pwd2.length == 0) {
        icon = 'error';
        title = '비밀번호 재확인을 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd2").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enablePwd2').innerText = "unable";
    }
    //비밀번호가 일치하지않음
    else if (member_pwd != member_pwd2) {
        icon = 'warning';
        title = '비밀번호가 일치하지 않습니다.';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd2").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enablePwd2').innerText = "unable";
    }
    //비밀번호가 유효하지않은 비밀번호인데 비밀번호 재확인을 시도할때
    else if (enablePwd != "checked" && member_pwd == member_pwd2) {
        icon = 'warning';
        title = '비밀번호가 유효하지 않습니다.';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd").removeClass().addClass(ERROR_CLASS);
        $("#validityCheck_pwd2").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enablePwd2').innerText = "unable";
    }
    //비밀번호 일치
    else if (enablePwd == "checked" && member_pwd == member_pwd2) {
        icon = 'success';
        title = '비밀번호가 일치합니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd2").removeClass().addClass(SUCCESS_CLASS);
        document.getElementById('enablePwd2').innerText = "checked";
    }
}

//이름 유효성 검사
function nameCheck() {
    //input박스에 member_name값을 가져옴
    var member_name = document.getElementById("member_name").value;
    //이름 공백
    if (member_name.length == 0) {
        icon = 'error';
        title = '이름을 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_name").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enableName').innerText = "unable";
    }
    //이름 정규식 위반
    else if (!nameReg.test(member_name)) {
        icon = 'warning';
        title = '이름은 3~20글자 온전한 한글,영문 대소문자만 사용가능합니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_name").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enableName').innerText = "unable";
    }
    //이름 정규식 통과
    else {
        $("#validityCheck_name").removeClass().addClass(SUCCESS_CLASS);
        document.getElementById('enableName').innerText = "checked";
    }
}

//닉네임 유효성 검사
function nicknameCheck() {
    //input박스에 member_nickname값을 가져옴
    var member_nickname = document.getElementById("member_nickname").value;
    //ajax로 중복체크 확인
    $.ajax({
        type: 'post',
        url: "NicknameCheck",
        dataType: 'text',
        data: {member_nickname: member_nickname}, //member_nickname변수를 member_nickname로 바꿔서 데이터 전송
        //성공시 함수
        success: function (data) {
            //닉네임 공백
            if (member_nickname.length == 0) {
                icon = 'error';
                title = '닉네임을 입력해주세요!';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                $("#validityCheck_nickname").removeClass().addClass(ERROR_CLASS);
                document.getElementById('enableNickname').innerText = "unable";
            }
            //닉네임 정규식 위반
            else if (!nickReg.test(member_nickname)) {
                icon = 'warning';
                title = '닉네임은 2~10자리 온전한 한글, 영문 대소문자, 숫자만 사용가능합니다! (한글 자음모음 불가)';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                $("#validityCheck_nickname").removeClass().addClass(ERROR_CLASS);
                document.getElementById('enableNickname').innerText = "unable";
            }
            //닉네임 중복
            else if (data == 1) {
                icon = 'warning';
                title = '이미 존재하는 닉네임입니다!';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                $("#validityCheck_nickname").removeClass().addClass(ERROR_CLASS);
                document.getElementById('enableNickname').innerText = "unable";
            }
            //닉네임 사용가능
            else if (data == 0) {
                icon = 'success';
                title = '사용가능한 닉네임입니다!';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                $("#validityCheck_nickname").removeClass().addClass(SUCCESS_CLASS);
                document.getElementById('enableNickname').innerText = "checked";
            }
        }
    });
}

//이메일 유효성 검사
function emailCheck() {
    //input박스에 member_email값을 가져옴
    var member_email = document.getElementById("member_email").value;
    //이메일 공백
    if (member_email.length == 0) {
        icon = 'error';
        title = '이메일을 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_email").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enableEmail').innerText = "unable";
    }
    //이메일 정규식 위반
    else if (!emailReg.test(member_email)) {
        icon = 'warning';
        title = '유효한 이메일 형식이 아닙니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_email").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enableEmail').innerText = "unable";
    }
    //이메일 정규식 통과
    else {
        $("#validityCheck_email").removeClass().addClass(SUCCESS_CLASS);
        document.getElementById('enableEmail').innerText = "checked";
    }
}

//생년월일 유효성 검사
function birthCheck() {
    //input박스에 member_birth값을 가져옴
    var member_birth = document.getElementById("member_birth").value;
    //유효한 날짜인지 검사해주는 함수 호출
    var validationDate = validityDate(member_birth);
    //생년월일 공백
    if (member_birth.length == 0) {
        icon = 'error';
        title = '생년월일을 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_birth").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enableBirth').innerText = "unable";
    }
    //생년월일 정규식 위반
    else if (!birthReg.test(member_birth)) {
        icon = 'warning';
        title = '유효한 생년월일 형식이 아닙니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_birth").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enableBirth').innerText = "unable";
    }
    //생년월일 유효날짜 위반
    else if (member_birth != validationDate) {
        icon = 'warning';
        title = '존재하지 않는 날짜입니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_birth").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enableBirth').innerText = "unable";
    }
    //생년월일 정규식 및 유효날짜 통과
    else {
        validityDate(member_birth);
        $("#validityCheck_birth").removeClass().addClass(SUCCESS_CLASS);
        document.getElementById('enableBirth').innerText = "checked";
    }
}

//성별 유효성 검사
function genderCheck() {
    //select에 member_gender값을 가져옴
    var member_gender = document.getElementById("member_gender");
    var selectedGender = member_gender.options[member_gender.selectedIndex].value;
    //성별을 선택
    if (selectedGender == "성별") {
        $("#validityCheck_gender").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enableGender').innerText = "unable";
    }
    //남자
    else if (selectedGender == "남자") {
        $("#validityCheck_gender").removeClass().addClass(SUCCESS_CLASS);
        document.getElementById('enableGender').innerText = "checked";
    }
    //여자
    else if (selectedGender == "여자") {
        $("#validityCheck_gender").removeClass().addClass(SUCCESS_CLASS);
        document.getElementById('enableGender').innerText = "checked";
    }
}

//전화번호 유효성 검사
function phoneCheck() {
    //input박스에 member_phone값을 가져옴
    var member_phone = document.getElementById("member_phone").value;
    //전화번호 공백
    if (member_phone.length == 0) {
        icon = 'error';
        title = '전화번호를 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_phone").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enablePhone').innerText = "unable";
    }
    //전화번호 정규식 위반
    else if (!phoneReg.test(member_phone)) {
        icon = 'warning';
        title = '유효한 전화번호 형식이 아닙니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_phone").removeClass().addClass(ERROR_CLASS);
        document.getElementById('enablePhone').innerText = "unable";
    }
    //전화번호 정규식 통과
    else {
        $("#validityCheck_phone").removeClass().addClass(SUCCESS_CLASS);
        document.getElementById('enablePhone').innerText = "checked";
    }
}

//실제로 존재하는 날짜인지 체크하는 함수
function validityDate(member_birth) {
    //YYYY-MM-DD 형식을 YYYYMMDD로 바꿈
    var validityDate = new Date(member_birth.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));
    //년 월 일을 변수에 저장
    var year = validityDate.getFullYear();
    var month = validityDate.getMonth() + 1; //월은 0~11이 리턴되기에 +1
    var date = validityDate.getDate();

    //1~9월까지는 앞에 0이 안붙기에 0추가
    month = month.toString().padStart(2,'0');
    //1~9일까지는 앞에 0이 안붙기에 0추가
    date = date.toString().padStart(2,'0');
    //YYYY-MM-DD 형식으로 리턴
    return year + '-' + month + '-' + date;
}

//로그인체크(모든내용을 유효한 값으로 입력하였는지)
function signInCheck() {
    //validityCheck의 자식 태그를 가져옴
    var isChecked = document.getElementById('validityCheck').children;
    //모든요소가 check인지 아닌지 boolean으로 저장 (기본값은 true)
    var checkPass = true;
    //자식요소 전부다 반복
    for (var i = 0; i < isChecked.length; i++){
        //자식요소의 안의 내용이 checked가 아닐때
        if (isChecked.item(i).innerHTML != "checked"){
                checkPass = false; //false 변경
                $("#" + isChecked.item(i).className).removeClass().addClass(ERROR_CLASS);
                // document.getElementById(isChecked.item(i).className).style.backgroundColor = ERORR_COLOR; //에러 컬러로 변경
            }
    }
    //모든정보가 유효한 값이 아닐때
    if(!checkPass) {
        icon = "warning";
        title = "모든 정보를 입력해 주세요!"
        toastPreset(icon, title);
        return false;
    }
}