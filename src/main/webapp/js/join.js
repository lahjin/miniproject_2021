//유효성검사 체크여부
let validInfo = new Array(9);
validInfo.fill(false);

//유효성검사 체크UI
var ERROR_CLASS = "far fa-times-circle unableValue";
var SUCCESS_CLASS = "far fa-check-circle ableValue";

//swalPreset에 넘겨줄 매개변수
var icon = null;
var title = null;

//아이디 유효성 검사
document.getElementById("member_id").addEventListener("blur",() => {
    //input박스에 member_id값을 가져옴
    var member_id = document.getElementById("member_id").value;

    //아이디 공백
    if (member_id.length == 0) {
        icon = 'error';
        title = '아이디를 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_id").removeClass().addClass(ERROR_CLASS);
        validInfo[0] = false;
        return false;
    }

    const idReg = /^[a-z0-9]{4,12}$/g; //영문 소문자 or 숫자로만 이루어진 4~12글자

    //아이디 정규식 위반
    if (!idReg.test(member_id)) {
        icon = 'warning';
        title = '아이디는 4~12자의 영문 소문자, 숫자만 사용 가능합니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_id").removeClass().addClass(ERROR_CLASS);
        validInfo[0] = false;
        return false;
    }

    //ajax로 중복체크 확인
    $.ajax({
        type: 'post',
        url: "IdCheck",
        dataType: 'text',
        data: {member_id: member_id}, //member_id변수를 member_id로 바꿔서 데이터 전송
        //성공시 함수
        success: function (data) {

            //아이디 중복
            if (data == 1) {
                icon = 'warning';
                title = '이미 존재하는 아이디입니다!';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                $("#validityCheck_id").removeClass().addClass(ERROR_CLASS);
                validInfo[0] = false;
            }
            //아이디 사용가능
            else{
                var icon = 'success';
                var title = '사용가능한 아이디입니다!';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                $("#validityCheck_id").removeClass().addClass(SUCCESS_CLASS);
                validInfo[0] = true;
            }
        }
    });
    return true;
})

//비밀번호 유효성 검사
document.getElementById("member_pwd").addEventListener("blur", () =>{
    //input박스에 member_pwd값을 가져옴
    var member_pwd = document.getElementById("member_pwd").value;

    //비밀번호 공백
    if (member_pwd.length == 0) {
        icon = 'error';
        title = '비밀번호를 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd").removeClass().addClass(ERROR_CLASS);
        validInfo[1] = false;
        return false;
    }

    //비밀번호와 비밀번호 재확인까지 다 체크하고 나서 다시 비밀번호를 변경했을 때 대비
    if (validInfo[1] == true && validInfo[2] == true) {
        $("#validityCheck_pwd2").removeClass().addClass(ERROR_CLASS);
        validInfo[2] = false;
    }
    const pwdReg = /^(?=.*[A-Za-z])(?=.*\d).{8,16}$/g; //최소 한개의 문자 + 숫자 특수문자는 선택 8~16글자

    //비밀번호 정규식 위반
    if (!pwdReg.test(member_pwd)) {
        icon = 'warning';
        title = '비밀번호는 8~16자의 최소 1개의 영문 대소문자, 숫자, 특수문자(선택)만 사용 가능합니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd").removeClass().addClass(ERROR_CLASS);
        validInfo[1] = false;
        //비밀번호와 비밀번호 재확인까지 다 체크하고 나서 다시 비밀번호를 변경했을 때 대비
        if (validInfo[2] == true) {
            $("#validityCheck_pwd2").removeClass().addClass(ERROR_CLASS);
            validInfo[1] = false;
        }
    }

    //사용가능한 비밀번호
    else {
        icon = 'success';
        title = '사용가능한 비밀번호입니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd").removeClass().addClass(SUCCESS_CLASS);
        validInfo[1] = true;
    }
})

//비밀번호 재확인 유효성 검사
document.getElementById("member_pwd2").addEventListener("blur", () =>{
    //input박스에 member_pwd값을 가져옴
    var member_pwd = document.getElementById("member_pwd").value;
    //input박스에 member_pwd2값을 가져옴
    var member_pwd2 = document.getElementById("member_pwd2").value;

    //비밀번호 공백
    if (member_pwd.length == 0) {
        icon = 'error';
        title = '비밀번호를 먼저 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd").removeClass().addClass(ERROR_CLASS);
        $("#validityCheck_pwd2").removeClass().addClass(ERROR_CLASS);
        validInfo[1] = false;
        validInfo[2] = false;
    }
    //비밀번호 확인 공백
    else if (member_pwd2.length == 0) {
        icon = 'error';
        title = '비밀번호 재확인을 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd2").removeClass().addClass(ERROR_CLASS);
        validInfo[2] = false;
    }
    //비밀번호가 일치하지않음
    else if (member_pwd != member_pwd2) {
        icon = 'warning';
        title = '비밀번호가 일치하지 않습니다.';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd2").removeClass().addClass(ERROR_CLASS);
        validInfo[2] = false;
    }
    //비밀번호가 유효하지않은 비밀번호인데 비밀번호 재확인을 시도할때
    else if (validInfo[1] != true && member_pwd == member_pwd2) {
        icon = 'warning';
        title = '비밀번호가 유효하지 않습니다.';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd").removeClass().addClass(ERROR_CLASS);
        $("#validityCheck_pwd2").removeClass().addClass(ERROR_CLASS);
        validInfo[2] = false;
    }
    //비밀번호 일치
    else if (validInfo[1] == true && member_pwd == member_pwd2) {
        icon = 'success';
        title = '비밀번호가 일치합니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd2").removeClass().addClass(SUCCESS_CLASS);
        validInfo[2] = true;
    }
})

//이름 유효성 검사
document.getElementById("member_name").addEventListener("blur", () =>{
    //input박스에 member_name값을 가져옴
    var member_name = document.getElementById("member_name").value;
    //이름 공백
    if (member_name.length == 0) {
        icon = 'error';
        title = '이름을 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_name").removeClass().addClass(ERROR_CLASS);
        validInfo[3] = false;
        return false;
    }

    const nameReg = /^[a-zA-Z가-힣]{3,20}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; //온전한한글 or 영문 3-20글자 && 영문이름 띄어쓰기 대비 앞 2~10글자 뒤 2~10글자

    //이름 정규식 위반
    if (!nameReg.test(member_name)) {
        icon = 'warning';
        title = '이름은 3~20글자 온전한 한글,영문 대소문자만 사용가능합니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_name").removeClass().addClass(ERROR_CLASS);
        validInfo[3] = false;
    }
    //이름 정규식 통과
    else {
        $("#validityCheck_name").removeClass().addClass(SUCCESS_CLASS);
        validInfo[3] = true;
    }
})

//닉네임 유효성 검사
document.getElementById("member_nickname").addEventListener("blur", () =>{
    //input박스에 member_nickname값을 가져옴
    var member_nickname = document.getElementById("member_nickname").value;

    //닉네임 공백
    if (member_nickname.length == 0) {
        icon = 'error';
        title = '닉네임을 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_nickname").removeClass().addClass(ERROR_CLASS);
        validInfo[4] = false;
        return false;
    }

    const nickReg = /^[A-Za-z0-9가-힣]{2,10}$/g; //영문 대소문자 or 숫자 or 온전한 한글로 이루어진 4~16글자

    //닉네임 정규식 위반
    if (!nickReg.test(member_nickname)) {
        icon = 'warning';
        title = '닉네임은 2~10자리 온전한 한글, 영문 대소문자, 숫자만 사용가능합니다! (한글 자음모음 불가)';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_nickname").removeClass().addClass(ERROR_CLASS);
        validInfo[4] = false;
        return false;
    }

    //ajax로 중복체크 확인
    $.ajax({
        type: 'post',
        url: "NicknameCheck",
        dataType: 'text',
        data: {member_nickname: member_nickname}, //member_nickname변수를 member_nickname로 바꿔서 데이터 전송
        //성공시 함수
        success: function (data) {

            //닉네임 중복
            if (data == 1) {
                icon = 'warning';
                title = '이미 존재하는 닉네임입니다!';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                $("#validityCheck_nickname").removeClass().addClass(ERROR_CLASS);
                validInfo[4] = false;
            }
            //닉네임 사용가능
            else {
                icon = 'success';
                title = '사용가능한 닉네임입니다!';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                $("#validityCheck_nickname").removeClass().addClass(SUCCESS_CLASS);
                validInfo[4] = true;
            }
        }
    });
    return true;
})

//이메일 유효성 검사
document.getElementById("member_email").addEventListener("blur",() =>{
    //input박스에 member_email값을 가져옴
    var member_email = document.getElementById("member_email").value;
    //이메일 공백
    if (member_email.length == 0) {
        icon = 'error';
        title = '이메일을 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_email").removeClass().addClass(ERROR_CLASS);
        validInfo[5] = false;
        return false;
    }

    const emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; //이메일 정규식

    //이메일 정규식 위반
    if (!emailReg.test(member_email)) {
        icon = 'warning';
        title = '유효한 이메일 형식이 아닙니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_email").removeClass().addClass(ERROR_CLASS);
        validInfo[5] = false;
    }
    //이메일 정규식 통과
    else {
        $("#validityCheck_email").removeClass().addClass(SUCCESS_CLASS);
        validInfo[5] = true;
    }
})

//생년월일 유효성 검사
document.getElementById("member_birth").addEventListener("blur", () =>{
    //input박스에 member_birth값을 가져옴
    var member_birth = document.getElementById("member_birth").value;
    //생년월일 공백
    if (member_birth.length == 0) {
        icon = 'error';
        title = '생년월일을 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_birth").removeClass().addClass(ERROR_CLASS);
        validInfo[6] = false;
        return false;
    }

    const birthReg = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/g; //생년월일 정규식

    //생년월일 정규식 위반
    if (!birthReg.test(member_birth)) {
        icon = 'warning';
        title = '유효한 생년월일 형식이 아닙니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_birth").removeClass().addClass(ERROR_CLASS);
        validInfo[6] = false;
    }
    //생년월일 유효날짜 위반
    else if (validityDate(member_birth)) {
        icon = 'warning';
        title = '존재하지 않는 날짜입니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_birth").removeClass().addClass(ERROR_CLASS);
        validInfo[6] = false;
    }
    //생년월일 정규식 및 유효날짜 통과
    else {
        validityDate(member_birth);
        $("#validityCheck_birth").removeClass().addClass(SUCCESS_CLASS);
        document.getElementById("member_birth").value = member_birth.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3');
        validInfo[6] = true;
    }
})

//생년월일 형식 변환
document.getElementById("member_birth").addEventListener("focus",() =>{
    var member_birth = document.getElementById("member_birth").value;
    const birthReg = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/g;

    if(birthReg.test(member_birth)){
        document.getElementById("member_birth").value = member_birth.replace(/(\d{4})-(\d{2})-(\d{2})/, '$1$2$3');
    }
})

//생년월일 숫자만 받기
document.getElementById("member_birth").addEventListener("keyup", () =>{
    document.getElementById("member_birth").value = document.getElementById("member_birth").value.replace(/[^0-9]/g, "");
})

//성별 유효성 검사
document.getElementById("member_gender").addEventListener("change",() =>{
    //select에 member_gender값을 가져옴
    var member_gender = document.getElementById("member_gender");
    var selectedGender = member_gender.options[member_gender.selectedIndex].value;
    //성별을 선택
    if (selectedGender == "성별") {
        $("#validityCheck_gender").removeClass().addClass(ERROR_CLASS);
        validInfo[7] = false;
    }
    //남자
    else if (selectedGender == "남자") {
        $("#validityCheck_gender").removeClass().addClass(SUCCESS_CLASS);
        validInfo[7] = true;
    }
    //여자
    else if (selectedGender == "여자") {
        $("#validityCheck_gender").removeClass().addClass(SUCCESS_CLASS);
        validInfo[7] = true;
    }
})

//전화번호 유효성 검사
document.getElementById("member_phone").addEventListener("blur", () =>{
    //input박스에 member_phone값을 가져옴
    var member_phone = document.getElementById("member_phone").value;
    //전화번호 공백
    if (member_phone.length == 0) {
        icon = 'error';
        title = '전화번호를 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_phone").removeClass().addClass(ERROR_CLASS);
        validInfo[8] = false;
        return false;
    }

    const phoneReg = /^(010)(\d{4})(\d{4})$/; //전화번호 정규식 010xxxxxxxx 010고정에 4자리 4자리

    //전화번호 정규식 위반
    if (!phoneReg.test(member_phone)) {
        icon = 'warning';
        title = '유효한 전화번호 형식이 아닙니다!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_phone").removeClass().addClass(ERROR_CLASS);
        validInfo[8] = false;
    }
    //전화번호 정규식 통과
    else {
        $("#validityCheck_phone").removeClass().addClass(SUCCESS_CLASS);
        document.getElementById("member_phone").value = member_phone.replace(phoneReg,'$1-$2-$3');
        validInfo[8] = true;
    }
})

//전화번호 형식 변환
document.getElementById("member_phone").addEventListener("focus",() =>{
    var member_phone = document.getElementById("member_phone").value;
    const phoneReg = /^(010)-(\d{4})-(\d{4})$/;
    if(phoneReg.test(member_phone)){
        document.getElementById("member_phone").value = member_phone.replace(phoneReg,'$1$2$3');
    }
})

//전화번호 숫자만 받기
document.getElementById("member_phone").addEventListener("keyup", () =>{
    document.getElementById("member_phone").value = document.getElementById("member_phone").value.replace(/[^0-9]/g, "");
})

//실제로 존재하는 날짜인지 체크하는 함수
function validityDate(member_birth) {
    //YYYYMMDD형식을 YYYY-MM-DD로 바꿈
    let validityDate = new Date(member_birth.replace(/(\d{4})(\d{2})(\d{2})/, '$1-$2-$3'));

    if(validityDate == "Invalid Date"){
        return true;
    }else{
        return false;
    }
}

//로그인체크(모든내용을 유효한 값으로 입력하였는지)
document.getElementById("signup").addEventListener("click", () =>{
    //모든요소가 check인지 아닌지 boolean으로 저장 (기본값은 true)
    let checkPass = true;

    for(var i =0; i < validInfo.length; i++){
        if(validInfo[i] == false){
            checkPass = false;
            let invalid =  document.join_frm.children.item(i+1).children.item(2).id;
            $("#" + invalid).removeClass().addClass(ERROR_CLASS);
        }
    }
    //모든정보가 유효한 값이 아닐때
    if(!checkPass) {
        icon = "warning";
        title = "모든 정보를 입력해 주세요!"
        toastPreset(icon, title);
    }else {
        document.join_frm.action = "joinAction.jsp";
        document.join_frm.submit();
    }
})

//취소하기 버튼
document.getElementById("cancel").addEventListener("click",()=>{
    location.href = "main.jsp";
})