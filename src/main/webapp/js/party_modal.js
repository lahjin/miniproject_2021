//모달창 안에 내용 수정
function partyModalInfo(index, fee){
    document.querySelector('.mypage-party-wrap').style.display = "flex";
    document.body.style.overflow = 'hidden';


    let entry_party = party_info[index].party_code;
    $.ajax({
        type: 'post',
        url: "EntryCheck",
        dataType: 'json',
        data: {party_code: entry_party}, //entry_party 변수를 party_code로 바꿔서 데이터 전송
        //성공시 함수
        success: function (data) {

            document.getElementById('party_code').innerText = entry_party;
            document.getElementById('entry_period').innerText = party_info[index].party_period +"개월";
            document.getElementById('entry_price').innerText =  party_info[index].party_price + "원";
            document.getElementById('entry_now').innerText = party_info[index].party_now + "/" + party_info[index].party_total;
            document.getElementById('party_state').innerText = party_info[index].party_state;

            let i = 1;
            let member_nickName,entry_date;
            for(key in data){
                member_nickName = "member_nickName" + i;
                entry_date = "entry_date" + i;
                document.getElementById(member_nickName).innerText = data[key].member_nickname;
                document.getElementById(entry_date).innerText = data[key].entry_date;
                i++;
            }
            if(i < 5){
                while (i < 5){
                    member_nickName = "member_nickName" + i;
                    entry_date = "entry_date" + i;
                    document.getElementById(member_nickName).innerText = "-";
                    document.getElementById(entry_date).innerText = "-";
                    i++;
                }
            }
        }
    });
}

//모달창 파티가입버튼
document.getElementById("party-enter").addEventListener('click', (e) =>{
    let leaderNick = document.getElementById('member_nickName1').innerText;
    Swal.fire({
        title: '파티가입',
        text: leaderNick + "님의 파티에 가입하시겠습니까?",
        icon: 'info',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: '네',
        cancelButtonText: '아니오'
    }).then((result) => {
        if(result.isConfirmed){
            let entry_party = document.getElementById('party_code').innerText;
            let entry_leader = document.getElementById('member_nickName1').innerText;
            $.ajax({
                type: 'post',
                url: "EnterEntry",
                dataType: 'text',
                //entry_party/entry_leader변수를 entry_party/entry_leader(String타입)으로 바꿔서 데이터 전송
                //String 타입의 변수를 보낼땐 반드시 앞에 ("")를 붙여준다
                data: {"entry_party": entry_party, "entry_leader": entry_leader},
                //성공시 함수
                success: function (data) {
                    let icon, title, text, link;
                    if(data == -2){
                        icon = "error";
                        title = "오류";
                        text = "이미 모집완료된 파티입니다!";
                        swalPreset(icon,title,text);
                    }else if(data == -1){
                        icon = "warning";
                        title = "경고";
                        text = "본인이 생성한 파티입니다!";
                        swalPreset(icon,title,text);
                    }else if(data == 1){
                        icon = "warning";
                        title = "경고";
                        text = "이미 가입한 파티입니다!";
                        swalPreset(icon,title,text);
                    }else if(data == 0){
                        icon = "success";
                        title = "성공";
                        text = leaderNick + "님의 파티에 가입하였습니다!";
                        link = "javascript:history.go(0)";
                        swalOnButtonPreset(icon,title,text,link);

                    }
                    document.querySelector('.modal-wrap').style.display = "none";
                    document.body.style.overflow = 'auto';
                }
            });
        }
    })

});

//모달창 취소버튼
document.getElementById("info-close").addEventListener('click',(e) =>{
    document.querySelector('.mypage-party-wrap').style.display = "none";
    document.body.style.overflow = 'auto';
});