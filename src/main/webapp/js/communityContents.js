let pageIndex = 1;
let pageMaxIndex = 1;
let cm_b_info = [];
let filter_index = [];
let filter_count = 0;

//페이지 로딩시 실행
window.onload = () => {
    maxIndexCount();
    createPageIndexBtn();
    cm_allInfo();
    pageIndexEvent();
    cm_detailEvent();
    checkBoxDiv();
    exitBtnEvent();
}

//초기 체크박스 데이터 저장
function checkBoxDiv(){
    $('.index-wrap input:checked').each(function (){
        filter_index[filter_count] = $(this).val();
        filter_count++;
        $('.search-filter-log').append("<div class='filter-check'><span>"+$(this).val()+"</span><div class='check-remove'><i class='fas fa-times'></i></div></div>")
    })
}

//필터 체크박스 이벤트 리스너
let checkBtn = document.querySelectorAll('.index-wrap input');
for (let i=0; i<checkBtn.length; i++){
    checkBtn[i].addEventListener("click",function (){
        if(checkBtn[i].checked == true){
            $('.search-filter-log').append("<div class='filter-check'><span>"+$(this).val()+"</span><div class='check-remove'><i class='fas fa-times'></i></div></div>");
            filter_index[filter_count] = $(this).val();
            filter_count++;
            exitBtnEvent();
        }else{
            filter_count--;
            let result = filter_index.indexOf($(this).val());
            if(result != -1){
                let cnt;
                for(let i=0; i<filter_index.length; i++){
                    if(filter_index[i] == $(this).val()){
                        filter_index.splice(i,1);
                        cnt = i;
                        break;
                    }
                }
                $('.search-filter-log').children('div:eq(' + cnt+ ')').remove();
                exitBtnEvent();
            }
        }
    })
}

//필터 x버튼 이벤트 리스너
function exitBtnEvent(){
    let exitBtn = document.querySelectorAll('.check-remove');
    for (let i=0; i<exitBtn.length; i++){
        exitBtn[i].addEventListener("click",function (){
            $(this).parent().remove();
            let value = $(this).parent().text();
            for(let i=0; i<checkBtn.length; i++){
                if($(checkBtn[i]).val() == value){
                    checkBtn[i].checked = false;
                    break;
                }
            }
        })
    }
}


//페이지의 끝번호를 가져오는 함수
function maxIndexCount() {
    $.ajax({
        type: 'get',
        url: "BorderCount",
        dataType: 'json',
        async: false,
        success: function (data) {
            for (let key in data) {
                pageMaxIndex = data%6;
            }
        }
    })
}

//페이지숫자 버튼 생성 함수
function createPageIndexBtn(){
    $(".article-page").empty();
    $(".article-page").append("<a href=\"\" id=\"first-index\"><div><span><i class=\"fas fa-angle-double-left\"></i></span></div></a>");
    $(".article-page").append("<a href=\"\" id=\"prev\"><div><span><i class=\"fas fa-angle-left\"></i></span></div></a>");
    for (let idx=0; idx<pageMaxIndex; idx++){
        $(".article-page").append("<a href=\"\" id=\"pageIdx"+ (idx+pageIndex) + "\"><div><span>" + (idx+pageIndex) +"</span></div></a>");
    }
    $(".article-page").append("<a href=\"\" id=\"next\"><div><span><i class=\"fas fa-angle-right\"></i></span></div></a>");
    $(".article-page").append("<a href=\"\" id=\"last-index\"><div><span><i class=\"fas fa-angle-double-right\"></i></span></div></a>");
}

//커뮤니티 글의 내용을 가져오는 함수
function cm_allInfo(){
    cm_b_info = [];
    $.ajax({
        type: 'get',
        url: "BorderIndex",
        dataType: 'json',
        data: {skipIndex: (pageIndex-1)*6, countIndex: 6},
        async: false,
        success: function (data) {
            let cnt =0;
            for (let key in data) {
                cm_b_info[cnt] = data[key];
                cnt++;
            }
        }
    })
}

//커뮤니티 상세보기 버튼 이벤트 리스너
function cm_detailEvent(){
    let detailBtn = document.querySelectorAll(".detail-btn");
    for (let i = 0; i < detailBtn.length; i++) {
        detailBtn[i].addEventListener("click", function () {
            borderModalOn(this.id);
            borderInfo(cm_b_info[i]);
        });
    }
}

//페이지 새로고침(페이지인덱스 이동) 함수
function movePageIdx(index){
    alert(index);
}
//커뮤니티 페이지 숫자 이벤트리스너
function pageIndexEvent(){
    let pageIdxBtn = document.querySelectorAll(".article-page > a");
    for (let i = 0; i < pageIdxBtn.length; i++) {
        pageIdxBtn[i].addEventListener("click", function () {
            movePageIdx(this.id);
        })
    }
}

//앞으로 버튼 이벤트 리스너

//가장 앞으로 버튼 이벤트 리스너

//뒤로 버튼 이벤트 리스너

//가장 뒤로 버튼 이벤트 리스너