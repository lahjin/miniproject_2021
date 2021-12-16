const secession = "탈퇴하기";
const btn = document.querySelector('.firstbtn');

function printName() {
    const value = document.querySelector('.getout').value;

    if(value == secession) {
        btn.style.backgroundColor="royalblue";
        btn.style.color = "white"
        btn.disabled = false;
    }
    else {
        btn.style.backgroundColor="white";
        btn.style.color = "gray"
        btn.disabled = true;
    }
}

btn.addEventListener('click', ()=>{
    Swal.fire({
        title: '경고',
        text: "정말로 회원탈퇴 하시겠습니까?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '네',
        cancelButtonText: '아니요'
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                type: 'post',
                url: "MemberDelete",
                dataType: 'text',
                data: {member_id: member_id},
                //성공시 함수
                success: function (data) {
                    let icon, title, text, link;
                    if (data == 1) {
                        icon = "success";
                        title = "성공";
                        text = "회원탈퇴 처리되었습니다!";
                        link = "logoutAction.jsp";
                        swalOnButtonPreset(icon,title,text,link);
                    }
                    else {
                        icon = "error";
                        title = "오류";
                        text = "회원탈퇴 처리되지않았습니다!";
                        swalPreset(icon,title,text);
                    }
                }
            });
        }
    })
})
