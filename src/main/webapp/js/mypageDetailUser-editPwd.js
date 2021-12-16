let icon, title;
let validInfo = new Array(3);
validInfo.fill(false);
const ERROR_CLASS = "far fa-times-circle unableValue";
const SUCCESS_CLASS = "far fa-check-circle ableValue";
let myPwd;
let checkPwd = false;

//현재비밀번호 유효성검사
document.getElementById('member_pwd_now').addEventListener("blur",() => {
    var member_pwd_now = document.getElementById("member_pwd_now").value;

    if(member_pwd_now.length == 0){
        icon = 'error';
        title = '현재 비밀번호를 입력해주세요!';
        toastPreset(icon, title);
        $("#validityCheck_now").removeClass().addClass(ERROR_CLASS);
        validInfo[0] = false;
        return false;
    }

    if(!checkPwd){
        $.ajax({
            type: 'post',
            url: "PwdCheck",
            async: false,
            dataType: 'text',
            data: {member_id: member_id},
            //성공시 함수
            success: function (data) {
                myPwd = data;
                checkPwd = true;
            }
        })
    }

    if (member_pwd_now != myPwd){
        icon = 'error';
        title = '현재 비밀번호가 아닙니다!';
        toastPreset(icon, title);
        $("#validityCheck_now").removeClass().addClass(ERROR_CLASS);
        validInfo[0] = false;
        return false;
    }

    if (member_pwd_now == myPwd){
        icon = 'success';
        title = '현재 비밀번호와 일치 합니다!';
        toastPreset(icon, title);
        $("#validityCheck_now").removeClass().addClass(SUCCESS_CLASS);
        validInfo[0] = true;
    }
})


//비밀번호 유효성 검사
document.getElementById("member_pwd").addEventListener("blur", () =>{
    //input박스에 member_pwd값을 가져옴
    var member_pwd = document.getElementById("member_pwd").value;

    //비밀번호 공백
    if (member_pwd.length == 0) {
        icon = 'error';
        title = '변경할 비밀번호를 입력해주세요!';
        //swalPreset.js의 toastPrest함수 호출
        toastPreset(icon, title);
        $("#validityCheck_pwd").removeClass().addClass(ERROR_CLASS);
        validInfo[1] = false;
        return false;
    }

    if (member_pwd == myPwd){
        icon = 'error';
        title = '이전에 사용하지않은 비밀번호로 입력해주세요!';
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

//변경하기 이벤트 리스너
document.getElementById('updatePwd').addEventListener('click', ev => {
    let checkPass = true;
    let checkIcon = document.querySelectorAll('.userarea i');

    for(var i =0; i < validInfo.length; i++){
        if(validInfo[i] == false){
            checkPass = false;
            $(checkIcon[i]).removeClass().addClass(ERROR_CLASS);
        }
    }
    //모든정보가 유효한 값이 아닐때
    if(!checkPass) {
        icon = "warning";
        title = "모든 정보를 입력해 주세요!"
        toastPreset(icon, title);
    }else {
        Swal.fire({
            title: '경고',
            text: "정말로 비밀번호를 변경하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네',
            cancelButtonText: '아니요'
        }).then((result) => {
            if (result.isConfirmed) {
                let member_pwd = document.getElementById('member_pwd').value;
                $.ajax({
                    type: 'post',
                    url: "PwdUpdate",
                    dataType: 'text',
                    data: {member_id: member_id, member_pwd: member_pwd},
                    success: function (data) {
                        let icon,title,text,link;
                        if(data == 1){
                            icon = "success";
                            title = "성공";
                            text = "비밀번호가 변경되었습니다!";
                            link = "mypageDetail.jsp?category=user";
                            swalOnButtonPreset(icon,title,text,link);
                        }else if (data == 0){
                            icon = "error";
                            title = "오류";
                            text = "비밀번호가 변경되지않았습니다";
                            swalPreset(icon,title,text);
                        }
                    }
                })
            }
        })
    }
})