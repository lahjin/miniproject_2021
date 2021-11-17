let star = 0;

//글쓰기 버튼을 눌렀을때(모달 켜짐)
document.getElementById("cm_write").addEventListener("click", function (){
    document.querySelector('.community-write-modal').style.display = "flex";
    document.body.style.overflow = 'hidden';
})

//별에 마우스를 올릴때 이벤트 리스너
let starIcon = document.querySelectorAll(".star > i");
for (let i = 0; i < starIcon.length; i++) {
    starIcon[i].addEventListener("mouseover", function () {
        fillStar(i);
    })
}

//별에 마우스를 땠을때 이벤트 리스너
for (let i = 0; i < starIcon.length; i++) {
    starIcon[i].addEventListener("mouseout", function () {
        fillStar(star);
    })
}

//별을 클릭 했을 때 이벤트 리스너
let starLabel = document.querySelectorAll(".star");
for (let i = 0; i < starLabel.length; i++) {
    starLabel[i].addEventListener("click", function () {
        star = i;
    })
}

//별 클래스 변경
function fillStar(idx){
    $(starIcon).removeClass();
    for(let i=0; i<5; i++){
        if (i<=idx){
            $(starIcon[i]).addClass("fas fa-star");
        }else{
            $(starIcon[i]).addClass("far fa-star");
        }
    }
}



//작성버튼을 눌렀을때
document.getElementById("modal-write-post").addEventListener("click", function (){
    Swal.fire({
        title: '게시물 작성',
        text: "게시물을 등록하시겠습니까?",
        icon: 'info',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '네',
        cancelButtonText: '아니오'
    }).then((result) => {
        if(result.isConfirmed){
            let title = document.getElementById("cm_b_title").value;
            let subTitle = document.getElementById("cm_b_subTitle").value;
            let genre1 = document.getElementById("cm_b_genre1").value;
            let genre2 = document.getElementById("cm_b_genre2").value;
            let member = document.getElementById("cm_b_member").value;
            let service = document.getElementById("cm_b_service").value;
            let content = document.getElementById("cm_b_content").value;
            let star = $("input[name='cm_b_star']:checked").val();

            $.ajax({
                type: 'post',
                url: "BorderWrite",
                dataType: 'text',
                data: {"cm_b_title": title, "cm_b_subTitle": subTitle, "cm_b_genre1": genre1, "cm_b_genre2": genre2,
                    "cm_b_member": member, "cm_b_service": service,"cm_b_content": content, "cm_b_star": star},
                //성공시 함수
                success: function (data) {
                    let icon,title,text,link;
                    if(data == 1){
                        icon = "success";
                        title = "성공";
                        text = "게시글이 등록되었습니다";
                        link = "community.jsp"
                        swalOnButtonPreset(icon,title,text,link);
                    }else if (data == 0){
                        icon = "error";
                        title = "오류";
                        text = "게시글이 등록되지않았습니다";
                        swalPreset(icon,title,text);
                    }
                    document.querySelector('.community-write-modal').style.display = "none";
                    document.body.style.overflow = 'auto';
                }
            })

        }
    })
})

//취소 버튼을 눌렀을때
document.getElementById("modal-write-cancel").addEventListener("click", function (){
    document.querySelector('.community-write-modal').style.display = "none";
    document.body.style.overflow = 'auto';
})