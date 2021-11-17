let service_code;
let service_price;
let skipIndex = 0;
let countIndex = 6;
let pageIndex = 1;
let pageMaxIndex;
let party_info = [];
let member_info = [];

//페이지 로딩이후 실행
window.onload = () => {
    service_code = document.getElementById("service").value;
    maxCountCalc();
    party_price();
    partyDetailInfo();
    detailInfo();
}

//페이지의 끝을 계산하는 함수
function maxCountCalc(){
    $.ajax({
        type: 'get',
        url: "RowCountCheck",
        dataType: 'json',
        data: {service_code: service_code},
        async: false,
        success: function (data) {
            pageMaxIndex = data%countIndex;
        }
    })
}

//서비스 가격을 가져오는 함수
function party_price(){
    $.ajax({
        type: 'get',
        url: "PriceCheck",
        dataType: 'json',
        data: {service_code: service_code},
        async: false,
        success: function (data) {
            service_price = data;
        }
    })
}

//상세보기를 눌렀을때 나올 값을 배열에 저장하는 함수
function partyDetailInfo() {
    party_info = [];
    $.ajax({
        type: 'get',
        url: "PartyDetailSearch",
        dataType: 'json',
        data: {service_code: service_code, skipIndex: skipIndex, countIndex: countIndex},
        async: false,
        success: function (data) {

            let arrayCnt = 0;
            for (let key in data) {
                party_info[arrayCnt] = data[key];
                arrayCnt++;
            }
        }
    })
}

//파티리스트의 기본정보를 배열에 저장하는 함수
function partySimpleInfo(){
    member_info = [];
    for(let cnt=0; cnt<party_info.length; cnt++){
        let member_code = party_info[cnt].party_leader;
        $.ajax({
            type: 'get',
            url: "PartySimpleSearch",
            dataType: 'json',
            data: {member_code: member_code},
            async: false,
            success: function (data) {
                for (let key in data) {
                    member_info[cnt] = data[key];
                }
            }
        })
    }
}

//상세보기 이벤트 리스너
function detailInfo(){
    let partyBtn = document.querySelectorAll(".openBtn");
    for (let i = 0; i < partyBtn.length; i++) {
        partyBtn[i].addEventListener("click", function () {
            partyModalInfo(this.id);
        });
    }
}


//다른 OTT 선택하기 버튼 클릭
document.getElementById('backOtt').addEventListener("click", () => {
    location.href = "matchingMain.jsp";
})

//파티만들기 버튼 이벤트 리스너
document.getElementById("createPartyBtn").addEventListener("click", ev => {
    let service_code = document.getElementById("service").value;
    location.href = "matchingCreate.jsp?service=" + service_code;
})

//이전파티 버튼 이벤트 리스너
document.getElementById("prevPartyBtn").addEventListener("click", function () {
    maxCountCalc();
    if (pageIndex > 1) {
        pageIndex--;
        skipIndex -= countIndex;

        document.getElementById("pageNumber").innerText = "Page" + pageIndex;

        partyDetailInfo();
        partySimpleInfo();
        $(".middle-area").empty();
        for(let cnt=0; cnt<countIndex; cnt++){
            if(party_info[cnt] == null){
                addNullParty();
            }else{
                addParty(cnt);
            }
        }
        detailInfo();
    }else{
        let icon = "warning";
        let title = "경고";
        let text = "처음 페이지 입니다";
        swalPreset(icon, title, text);
    }
})

//다음파티 버튼 이벤트 리스너
document.getElementById("nextPartyBtn").addEventListener("click", function () {
    maxCountCalc();
    if(pageIndex < pageMaxIndex){
        pageIndex++;
        skipIndex += countIndex;

        document.getElementById("pageNumber").innerText = "Page" + pageIndex;

        partyDetailInfo();
        partySimpleInfo();

        $(".middle-area").empty();
        for(let cnt=0; cnt<countIndex; cnt++){
            if(party_info[cnt] == null){
                addNullParty();
            }else{
                addParty(cnt);
            }
        }
        detailInfo();
    }else{
        let icon = "warning";
        let title = "경고";
        let text = "마지막 페이지 입니다";
        swalPreset(icon, title, text);
    }
});


function addParty(cnt) {
    let now_length = party_info[cnt].party_now;
    let total_length = party_info[cnt].party_total;
    let fee = Math.ceil(service_price/total_length / 100) * 100 + 400;

    let $party = $("<div class=\"party-info\">" +
        "                    <div class=\"top-text\">" +
        "                        <h3>"+ member_info[cnt].member_nickName + "님의 파티</h3>" +
        "                        <h3>" + member_info[cnt].member_grade+"</h3>" +
        "                    </div>" +
        "                    <span class=\"date\">" + party_info[cnt].party_start + "</span>" +
        "                    <h2 class=\"fee\">" + fee + "원</h2>" +
        "                    <div class=\"party-btnbox\">" +
        "                        <div class=\"user-countbox boxCnt"+ cnt + "\">" +
        "                        </div>" +
        "                        <input id=\""+ cnt + "\" type=\"button\" value=\"상세보기\" class=\"openBtn\">" +
        "                    </div>" +
        "                </div>");

    $(".middle-area").append($party);

    for(let idx=0; idx<total_length; idx++){
        if(idx < now_length){
            $(".boxCnt" + cnt).append("<img src=\"./asset/icon/user.png\" alt=\"\" class=\"onuser\">");
        }else{
            $(".boxCnt" + cnt).append("<img src=\"./asset/icon/user.png\" alt=\"\">");
        }
    }
}

function addNullParty() {
    var $null = $(
        "<div class=\"party-null\">" +
        "      <h1 class=\"circle\">X</h1>" +
        "      <span class=\"no-party\">파티정보가 없어요</span>" +
        "</div>");
    $(".middle-area").append($null);
}