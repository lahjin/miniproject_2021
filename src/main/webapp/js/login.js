// 유효성검사 정규식 패턴


//swalPreset에 넘겨줄 매개변수
var icon = null;
var title = null;
var text = null;
var footer = null;

//로그인 유효성 검사 함수
function loginCheck(){
    //아이디 입력x
    if(!document.getElementById("member_id").value){
        icon = 'error';
        title = '아이디를 입력해주세요!';
        toastPreset(icon, title);
        return false;
    }

    const idReg = /^[a-z0-9]{4,12}$/g; //영문 소문자 or 숫자로만 이루어진 4~12글자

    //아이디 정규식 위반
    if(!idReg.test(document.getElementById('member_id').value)){
        icon = 'warning';
        title = '아이디를 4~12자의 영문 소문자, 숫자로 입력해주세요!';
        toastPreset(icon, title);
        return false;
    }

    //비밀번호 입력 x
    if(!document.getElementById("member_pwd").value){
        icon = 'error';
        title = '비밀번호를 입력해주세요!';
        toastPreset(icon, title);
        return false;
    }

    const pwdReg = /^(?=.*[A-Za-z])(?=.*\d).{8,16}$/g; //최소 한개의 문자 + 숫자 특수문자는 선택 8~16글자

    //비밀번호 정규식 위반
    if(!pwdReg.test(document.getElementById("member_pwd").value)){
        icon = 'warning';
        title = '비밀번호를 8~16자의 영문 대소문자, 숫자, 특수문자로 입력해주세요!';
        toastPreset(icon, title);
        return false;
    }
}

//로그인이 정상적으로 되었는지 알려주는 알림창을 관리하는 함수
function loginAccess(errorMsg) {
    //아이디가 존재하지 않음
    if(errorMsg == "idError"){
        icon = 'error';
        title = '아이디 오류';
        text = '존재하지않는 아이디입니다!';
        footer = '<a href="../idFind.jsp" style="color: #70BBF7; font-weight: bold">아이디를 잊어버리셨나요?</a>';
        swalPreset(icon, title, text, footer);
    }
    //비밀번호가 틀림
    else if(errorMsg == "pwdError"){
        icon = 'error';
        title = '비밀번호 오류';
        text = '비밀번호를 정확히 입력해주세요!';
        footer = '<a href="../pwdFind.jsp" style="color: #70BBF7; font-weight: bold">비밀번호를 잊어버리셨나요?</a>';
        swalPreset(icon, title, text, footer);
    }
    //DB가 끊겻거나 없음
    else if(errorMsg == "dbSeverError"){
        icon = 'question';
        title = '데이터베이스 오류';
        text = '서버와의 연결이 끊어졌어요!';
        swalPreset(icon, title, text);
    }

}

function test(){
    Swal.fire({
        icon: "success",
        html: "<html><body><label>label</label></body></html>"
    })
}