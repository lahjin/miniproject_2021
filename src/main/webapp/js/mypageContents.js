//정보변경 버튼 이벤트 리스너
let MgrMember = document.querySelector('.edit');
MgrMember.addEventListener("click", function (){
    location.href = "mypageDetail.jsp?category=user";
})

//관리버튼의 이벤트 리스너
let mgrBtn = document.querySelectorAll('.location-btn');
for(let i =0; i<mgrBtn.length; i++){
    mgrBtn[i].addEventListener("click",function (){
        switch (i){
            case 0:
                location.href = "mypageDetail.jsp?category=cash";
                break;
            case 1:
                location.href = "mypageDetail.jsp?category=OTT";
                break;
            case 2:
                location.href = "mypageDetail.jsp?category=party";
                break;
            case 3:
                location.href = "mypageDetail.jsp?category=border";
                break;
        }
    })
}