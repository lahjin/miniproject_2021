let cm_b_info = [];
let cm_b_daily = [];
let cm_b_weekly = [];
let cm_b_monthly = [];
let skipIndex = 0;
let countIndex = 6;
let hotCountIndex = 3;

//페이지 로딩시 실행
window.onload = () => {
    startRowFinder();
    cm_allInfo();
    cm_detailEvent();
    cm_daily_info();
    cm_weekly_info();
    cm_monthly_info();
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

//커뮤니티 일일 인기글 내용을 가져오는 함수
function cm_daily_info(){
    cm_b_daily = [];
    $.ajax({
        type: 'post',
        url: "BorderDaily",
        dataType: 'json',
        data: {countIndex: hotCountIndex},
        async: false,
        success: function (data) {
            let cnt =0;
            for (let key in data) {
                cm_b_daily[cnt] = data[key];
                cnt++;
            }
            cm_daily_detailEvent();
        }
    })
}

//커뮤니티 일일 인기글 이벤트 리스너
function cm_daily_detailEvent(){
    let dailyLink = document.querySelectorAll(".subIndex-today a");
    for (let i = 0; i < dailyLink.length; i++) {
        dailyLink[i].addEventListener("click", function () {
            borderModalOn(cm_b_daily[i].cm_b_code);
        });
    }
}

//커뮤니티 주간 인기글 내용을 가져오는 함수
function cm_weekly_info(){
    cm_b_weekly = [];
    $.ajax({
        type: 'post',
        url: "BorderWeekly",
        dataType: 'json',
        data: {countIndex: hotCountIndex},
        async: false,
        success: function (data) {
            let cnt =0;
            for (let key in data) {
                cm_b_weekly[cnt] = data[key];
                cnt++;
            }
            cm_weekly_detailEvent();
        }
    })
}

//커뮤니티 주간 인기글 이벤트 리스너
function cm_weekly_detailEvent(){
    let weeklyLink = document.querySelectorAll(".subIndex-week a");
    for (let i = 0; i < weeklyLink.length; i++) {
        weeklyLink[i].addEventListener("click", function () {
            borderModalOn(cm_b_weekly[i].cm_b_code);
        });
    }
}

//커뮤니티 월간 인기글 내용을 가져오는 함수
function cm_monthly_info(){
    cm_b_monthly = [];
    $.ajax({
        type: 'post',
        url: "BorderMonthly",
        dataType: 'json',
        data: {countIndex: hotCountIndex},
        async: false,
        success: function (data) {
            let cnt =0;
            for (let key in data) {
                cm_b_monthly[cnt] = data[key];
                cnt++;
            }
            cm_monthly_detailEvent();
        }
    })
}

//커뮤니티 월간 인기글 이벤트 리스너
function cm_monthly_detailEvent(){
    let monthlyLink = document.querySelectorAll(".subIndex-month a");
    for (let i = 0; i < monthlyLink.length; i++) {
        monthlyLink[i].addEventListener("click", function () {
            borderModalOn(cm_b_monthly[i].cm_b_code);
        });
    }
}