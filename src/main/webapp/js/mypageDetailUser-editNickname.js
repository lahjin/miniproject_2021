let icon, title;
let validData = false;
//닉네임 유효성 검사
document.getElementById("editNickname").addEventListener("blur", () =>{
    //input박스에 member_nickname값을 가져옴
    var member_nickname = document.getElementById("editNickname").value;

    //닉네임 공백
    if (member_nickname.length == 0) {
        icon = 'error';
        title = '닉네임을 입력해주세요!';
        toastPreset(icon, title);
        validData = false;
        return false;
    }

    const nickReg = /^[A-Za-z0-9가-힣]{2,10}$/g; //영문 대소문자 or 숫자 or 온전한 한글로 이루어진 4~16글자

    //닉네임 정규식 위반
    if (!nickReg.test(member_nickname)) {
        icon = 'warning';
        title = '닉네임은 2~10자리 온전한 한글, 영문 대소문자, 숫자만 사용가능합니다! (한글 자음모음 불가)';
        toastPreset(icon, title);
        validData = false;
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
                toastPreset(icon, title);
                validData = false;
            }
            //닉네임 사용가능
            else {
                icon = 'success';
                title = '사용가능한 닉네임입니다!';
                //swalPreset.js의 toastPrest함수 호출
                toastPreset(icon, title);
                validData = true;
            }
        }
    });
    return true;
})

//변경 이벤트 리스너
document.getElementById('updateNick').addEventListener('click', () => {
    if(validData){
        Swal.fire({
            title: '경고',
            text: "정말로 닉네임을 변경하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네',
            cancelButtonText: '아니요'
        }).then((result) => {
            if (result.isConfirmed) {
                let member_nickname = document.getElementById('editNickname').value;
                $.ajax({
                    type: 'post',
                    url: "NicknameUpdate",
                    dataType: 'text',
                    data: {member_id: member_id ,member_nickname: member_nickname},
                    //성공시 함수
                    success: function (data) {
                        let icon, title, text, link;
                        if (data == 1) {
                            icon = "success";
                            title = "성공";
                            text = "닉네임이 변경되었습니다!";
                            link = "mypageDetail.jsp?category=user";
                            swalOnButtonPreset(icon,title,text,link);
                        }
                        else {
                            icon = "error";
                            title = "오류";
                            text = "닉네임이 변경되지않았습니다";
                            swalPreset(icon,title,text);
                        }
                    }
                });
            }
        })
    }else{
        icon = "warning";
        title = "유효한 닉네임을 입력해 주세요";
        toastPreset(icon, title);
    }
})