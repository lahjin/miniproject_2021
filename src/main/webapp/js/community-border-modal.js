//모달창 띄우기
function borderModalOn(id){
    document.querySelector('.community-border-modal').style.display = "flex";
    document.body.style.overflow = 'hidden';
}

function borderInfo(list){
    document.getElementById("title-Font").innerText = list.cm_b_title;
    document.getElementById("movie-Font").innerText = list.cm_b_subTitle;
    if(list.cm_b_genre2 != null){
        document.getElementById("modal-border-genre").innerText = list.cm_b_genre1 + "/" + list.cm_b_genre2;
    }else{
        document.getElementById("modal-border-genre").innerText = list.cm_b_genre1;
    }
    document.getElementById("modal-border-grade").innerText = list.cm_b_grade;
    document.getElementById("modal-border-nickname").innerText = list.cm_b_nickname;
    document.getElementById("modal-border-service").src = list.cm_b_service_img;
    document.getElementById("modal-border-service").alt = list.cm_b_service;
    let cm_b_star = document.querySelectorAll("#modal-border-star > i");
    for(let i=0; i<5; i++){
        $(cm_b_star[i]).removeClass()
        if(i< list.cm_b_star){
            $(cm_b_star[i]).addClass("fas fa-star");
        }else{
            $(cm_b_star[i]).addClass("far fa-star");
        }
    }
    document.getElementById("review-Font").innerText = list.cm_b_content;
    document.getElementById("modal-border-view").innerText = list.cm_b_hits;
    document.getElementById("modal-border-like").innerText = list.cm_b_likes;
    document.getElementById("modal-border-dislike").innerText = list.cm_b_dislikes;
    document.getElementById("modal-border-date").innerText = list.cm_b_date;
}

//수정하기
document.getElementById("edit-modal-border").addEventListener("click",ev => {
    alert('수정하기 버튼 클릭');
})

//뒤로가기
document.getElementById("close-modal-border").addEventListener("click",ev => {
    document.querySelector('.community-border-modal').style.display = "none";
    document.body.style.overflow = 'auto';
})