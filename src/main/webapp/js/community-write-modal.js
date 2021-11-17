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
    alert("post버튼 클릭");
})

//취소 버튼을 눌렀을때
document.getElementById("modal-write-cancel").addEventListener("click", function (){
    document.querySelector('.community-write-modal').style.display = "none";
    document.body.style.overflow = 'auto';
})