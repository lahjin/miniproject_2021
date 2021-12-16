//ott코드
let ottIndex = [];

$.ajax({
    type: 'post',
    url: "OTTList",
    dataType: 'json',
    data: {member_id: member_id},
    async: false,
    success: function (data) {
        let cnt =0;
        for (let key in data) {
            ottIndex[cnt] = data[key];
            cnt++;
        }
    }
})

// ott관련 변수들
const ott = document.querySelectorAll('.ott');
const ottinfo = document.querySelector('.ott-info');
const ottnotinfo = document.querySelector('.ott-notinfo');
const ottInput = document.querySelector(".ott-input");

// 상단에 있는 ott네임
let ottname = document.getElementsByClassName("ottname");
// 바뀌는 ott네임
let change = document.querySelector('.change-ottname');

let checkedOtt = -1;

for(let i = 0; i < ott.length-1; i++)
{
    ott[i].addEventListener('click', function() {
        checkedOtt = i;

        ottnotinfo.style.display = 'none';
        ottinfo.style.display = 'flex';
        ottInput.style.display = 'none';
        for(let i=0; i< ott.length-1; i++) ott[i].style.backgroundColor = "lightgray";
        ott[i].style.backgroundColor = 'royalblue';

        change.innerText = ottname[i].innerHTML;

        let my_id, my_pwd;
        $.ajax({
            type: 'post',
            url: "OTTSelect",
            dataType: 'json',
            data: {ott_code: ottIndex[i].ott_code},
            async: false,
            success: function (data) {
                for (let key in data) {
                    my_id = data[key].ott_id;
                    my_pwd = data[key].ott_pwd;
                }
            }
        })
        ottid.innerText = "아이디 = " + my_id;
        ottpwd.innerText = "비밀번호 = " + my_pwd;

    });
}

// 마지막 버튼 애니메이션
ott[ott.length-1].addEventListener('click', function() {
    for(let i=0; i< ott.length-1; i++) ott[i].style.backgroundColor = "lightgray";
    ottnotinfo.style.display = 'none';
    ottinfo.style.display = 'none';
    ottInput.style.display = 'flex';
})

//OTT 삭제 이벤트 리스너
document.getElementById('deleteOtt').addEventListener('click', () =>{
    $.ajax({
        type: 'post',
        url: "OTTDrop",
        dataType: 'text',
        data: {ott_code: ottIndex[checkedOtt].ott_code},
        async: false,
        success: function (data) {
            location.href = data;
        }
    })
})

//OTT추가 이벤트 리스너
document.getElementById('insertOtt').addEventListener('click', ()=>{
    document.ott_input.action = "OTTInsert";
    document.ott_input.submit();
})