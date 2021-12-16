// 체크박스
let fcheck = document.querySelector('.firstcheck');
let checkBox = document.querySelectorAll(".check");

// 체크박스 이벤트
fcheck.addEventListener('click', function() {

    if(fcheck.checked == true)
    {
        checkBox.forEach(value => {
            value.checked = true;
        })
    }
    else
    {
        checkBox.forEach(value => {
            value.checked = false;
        })
    }
});

//선택삭제 이벤트 리스너
document.getElementById('selectedDelete').addEventListener("click", ev => {
    let checkCnt = 0;
    checkBox.forEach(value => {
        if (value.checked == true) checkCnt++;
    })
    if(checkCnt == 0){
        let icon = 'info';
        let title = '정보';
        let text = '선택한 글이 없습니다';
        swalPreset(icon, title, text);
    }else{
        Swal.fire({
            title: '경고',
            text: "선택한 글을 정말로 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네',
            cancelButtonText: '아니요'
        }).then((result) => {
            if (result.isConfirmed) {
                for (let i=0; i<checkBox.length; i++){
                    if(checkBox[i].checked == true)
                        deleteBorder(borderIndex[i]);
                }
            }
        })
    }
})

//삭제버튼 이벤트 리스너
const deleteBtn = document.querySelectorAll('.delete-border');

for (let i=0; i<deleteBtn.length; i++){
    deleteBtn[i].addEventListener("click", evt => {
        Swal.fire({
            title: '경고',
            text: "선택한 글을 정말로 삭제하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네',
            cancelButtonText: '아니요'
        }).then((result) => {
            if (result.isConfirmed) {
                deleteBorder(borderIndex[i]);
            }
        })
    })
}
function deleteBorder(index){
    $.ajax({
        type: 'post',
        url: "BorderDelete",
        dataType: 'text',
        data: {"cm_b_code": index},
        //성공시 함수
        success: function (data) {
            let icon,title,text,link;
            if(data == 1){
                icon = "success";
                title = "성공";
                text = "게시글이 삭제되었습니다";
                link = "mypageDetail.jsp?category=border"
                swalOnButtonPreset(icon,title,text,link);
            }else if (data == 0){
                icon = "error";
                title = "오류";
                text = "게시글이 삭제되지않았습니다";
                swalPreset(icon,title,text);
            }
        }
    })
}