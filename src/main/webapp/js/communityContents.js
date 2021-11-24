let cm_b_info = [];
let skipIndex = 0;
let countIndex = 6;

//페이지 로딩시 실행
window.onload = () => {
    startRowFinder();
    cm_allInfo();
    cm_detailEvent();
}

//퀴리스트링을 객체로 저장해주는 함수
function get_query(){

    var url = document.location.href;

    var qs = url.substring(url.indexOf('?') + 1).split('&');

    for(var i = 0, result = {}; i < qs.length; i++){

        qs[i] = qs[i].split('=');

        result[qs[i][0]] = decodeURIComponent(qs[i][1]);

    }

    return result;

}

//페이지 로딩시 skipIndex 초기화 해주는 함수
function startRowFinder() {
    const param = get_query();
    if(param.pageIndex != null){
        document.getElementById("pageIndex" + param.pageIndex).style.textDecoration = "underline";
        skipIndex = (param.pageIndex - 1) * countIndex;
    }else{
        document.getElementById("pageIndex1").style.textDecoration = "underline";
    }

}

//커뮤니티 글의 내용을 가져오는 함수
function cm_allInfo(){
    cm_b_info = [];
    $.ajax({
        type: 'get',
        url: "BorderIndex",
        dataType: 'json',
        data: {skipIndex: skipIndex, countIndex: countIndex},
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
            borderModalOn(cm_b_info[i].cm_b_code);
        });
    }
}