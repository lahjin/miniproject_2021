let usedCount = 0;
let gatherCount = 0;
let pastCount = 0;

let showUsed = 4;
let showGather = 4;
let showPast = 4;

const countIndex = 4;

window.onload = () =>{
    $.ajax({
        type: 'get',
        url: "MyPartyCount",
        dataType: 'text',
        data: {party_state: "모집완료"},
        //성공시 함수
        success: function (data) {
            usedCount = data;
            if(usedCount < showUsed) showUsed = usedCount;
        }
    })
    $.ajax({
        type: 'get',
        url: "MyPartyCount",
        dataType: 'text',
        data: {party_state: "모집중"},
        //성공시 함수
        success: function (data) {
            gatherCount = data;
            if(gatherCount < showGather) showGather = gatherCount;
        }
    })
    $.ajax({
        type: 'get',
        url: "MyPartyCount",
        dataType: 'text',
        data: {party_state: "기간만료"},
        //성공시 함수
        success: function (data) {
            pastCount = data;
            if(pastCount < showPast) showPast = pastCount;
        }
    })
}

let icon, title, text;
document.querySelector('.now-party-more').addEventListener('click', evt => {
    if(usedCount == showUsed){
        icon = 'info';
        title = '정보';
        text = '사용중인 파티가 더 없습니다.';
        swalPreset(icon, title,text);
    }else{
        $.ajax({
            type: 'get',
            url: "PartyCodeSearch",
            dataType: 'json',
            data: {party_state: "모집완료", skipIndex: showUsed, countIndex: countIndex},
            //성공시 함수
            success: function (data) {
                showUsed = showUsed+4;
                if(showUsed > usedCount) showUsed = usedCount;
                for(let key in data){
                    for(let key in data){
                        $(".apply-party .cash-area").append(
                            "<div class=\"party\">" +
                            "<img src=\"" + data[key].img + "\">" +
                            "<div class=\"innerbox\">" +
                            "<h3>" + data[key].name + " 사용중</h3>" +
                            "<h4>파티장<br>" + data[key].leader + "</h4>" +
                            "<a href=\"mypageDetail.jsp?category=partyInfo&code=" + data[key].code +"\"><input class=\"usePartyBtn\" type=\"button\" value=\"상세정보\"></a>" +
                            "</div>" +
                            "</div>");
                    }
                }
            }
        })
    }
})

document.querySelector('.apply-party-more').addEventListener('click', evt => {
    if(gatherCount == showGather){
        icon = 'info';
        title = '정보';
        text = '신청중인 파티가 더 없습니다.';
        swalPreset(icon, title,text);
    }else{
        $.ajax({
            type: 'get',
            url: "PartyCodeSearch",
            dataType: 'json',
            data: {party_state: "모집중", skipIndex: showGather, countIndex: countIndex},
            //성공시 함수
            success: function (data) {
                showGather += 4;
                if(showGather > gatherCount) showGather = gatherCount;
                for(let key in data){
                    $(".apply-party .cash-area").append(
                        "<div class=\"party\">" +
                            "<img src=\"" + data[key].img + "\">" +
                            "<div class=\"innerbox\">" +
                                "<h3>" + data[key].name + " 사용중</h3>" +
                                "<h4>파티장<br>" + data[key].leader + "</h4>" +
                                "<a href=\"mypageDetail.jsp?category=partyInfo&code=" + data[key].code +"\"><input class=\"usePartyBtn\" type=\"button\" value=\"상세정보\"></a>" +
                            "</div>" +
                        "</div>");
                }
            }
        })
    }
})

document.querySelector('.past-party-more').addEventListener('click', evt => {
    if(pastCount == showPast){
        icon = 'info';
        title = '정보';
        text = '지난 파티가 더 없습니다.';
        swalPreset(icon, title,text);
    }else{
        $.ajax({
            type: 'get',
            url: "PartyCodeSearch",
            dataType: 'json',
            data: {party_state: "기간만료", skipIndex: showPast, countIndex: countIndex},
            //성공시 함수
            success: function (data) {
                showPast = showPast+4;
                if(showPast > pastCount) showPast = pastCount;
                for(let key in data){
                    for(let key in data){
                        $(".apply-party .cash-area").append(
                            "<div class=\"party\">" +
                            "<img src=\"" + data[key].img + "\">" +
                            "<div class=\"innerbox\">" +
                            "<h3>" + data[key].name + " 사용중</h3>" +
                            "<h4>파티장<br>" + data[key].leader + "</h4>" +
                            "<a href=\"mypageDetail.jsp?category=partyInfo&code=" + data[key].code +"\"><input class=\"usePartyBtn\" type=\"button\" value=\"상세정보\"></a>" +
                            "</div>" +
                            "</div>");
                    }
                }
            }
        })
    }
})