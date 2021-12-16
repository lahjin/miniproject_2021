let deleteBtn = document.getElementById('party-delete');

if (deleteBtn != null) {
    deleteBtn.addEventListener('click', () => {
        Swal.fire({
            title: '경고',
            text: "선택한 파티를 정말로 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네',
            cancelButtonText: '아니요'
        }).then((result) => {
            if (result.isConfirmed) {
                let party_code = document.getElementById('party_code').innerText;
                $.ajax({
                    type: 'get',
                    url: "PartyDelete",
                    dataType: 'text',
                    data: {party_code: party_code},
                    //성공시 함수
                    success: function (data) {
                        let icon, title, text, link;
                        if (data == 1) {
                            icon = "success";
                            title = "파티 삭제 성공!";
                            text = "확인버튼 클릭 시 파티관리로 이동합니다.";
                            link = "mypageDetail.jsp?category=party";
                            swalOnButtonPreset(icon,title,text,link);
                        } else {
                            icon = "error";
                            title = "에러";
                            text = "파티 삭제를 실패하였습니다";
                            swalPreset(icon,title,text);
                        }
                    }
                })
            }
        })

    })
}

document.getElementById('info-back').addEventListener("click", () => {
    history.back();
})

