let star = 0;

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
    for(let cnt=0; cnt<5; cnt++){
        if (cnt<=idx){
            $(starIcon[cnt]).addClass("fas fa-star");
        }else{
            $(starIcon[cnt]).addClass("far fa-star");
        }
    }
}

//수정하기
document.getElementById('modal-write-post').addEventListener("click",() => {
    let title = document.getElementById("cm_b_title").value;
    let subTitle = document.getElementById("cm_b_subTitle").value;
    let genre1 = document.getElementById("cm_b_genre1").value;
    let genre2 = document.getElementById("cm_b_genre2").value;
    let service = document.getElementById("cm_b_service").value;
    let content = document.getElementById("cm_b_content").value;
    let star = $("input[name='cm_b_star']:checked").val();
    let code = document.getElementById('cm_b_code').value;

    $.ajax({
        type: 'post',
        url: "BorderEdit",
        dataType: 'text',
        data: {"cm_b_title": title, "cm_b_subTitle": subTitle, "cm_b_genre1": genre1, "cm_b_genre2": genre2,
            "cm_b_service": service,"cm_b_content": content, "cm_b_star": star, "cm_b_code": code},
        //성공시 함수
        success: function (data) {
            let icon,title,text,link;
            if(data == 1){
                icon = "success";
                title = "성공";
                text = "게시글이 수정되었습니다.";
                link = "javascript:location.href = document.referrer"
                swalOnButtonPreset(icon,title,text,link);
            }else if (data == 0){
                icon = "error";
                title = "오류";
                text = "게시글이 수정되지않았습니다";
                swalPreset(icon,title,text);
            }
        }
    })
})

//뒤로가기
document.getElementById('modal-write-cancel').addEventListener("click", () => {
    history.back();
});

//셀렉트 박스 수정관련
const genreList1 = document.querySelectorAll('#cm_b_genre1 > option');
const genreList2 = document.querySelectorAll('#cm_b_genre2 > option');
const ottList = document.querySelectorAll('#cm_b_service > option');
const starInputList = document.querySelectorAll('.star_rating > input');

genreList1.forEach(value => {
    if(value.value == selectGenre1){
        value.selected = true;
    }
})

genreList2.forEach(value => {
    if(value.value == selectGenre2){
        value.selected = true;
    }
})

ottList.forEach(value => {
    if(value.value == selectOtt){
        value.selected = true;
    }
})

for(let i=0; i< starInputList.length; i++){
    if(starInputList[i].value == selectStar){
        console.log(i);
        console.log(selectStar);
        starInputList[i].checked = true;
        star = i;
        fillStar(star);
    }
}

