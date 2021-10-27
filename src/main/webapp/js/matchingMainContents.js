var slides = document.querySelector('.slides'),
    slide = document.querySelectorAll('.slides li'),
    currentIdx = 0,
    slideCount = slide.length,
    prevBtn = document.querySelector('.prev'),
    slideWidth = 150,
    slideMargin = 30,
    nextBtn = document.querySelector('.next');
var index = 0;
var colors = [ "red", "orange", "yellow", "green", "blue", "Indigo", "purple"];
var max = colors.length;
var timerId;
slides.style.width = (slideWidth + slideMargin)*slideCount - slideMargin + 'px';

//무빙 이벤트
function moveSlide(num) {
    slides.style.left = -num *180 + 'px';
    currentIdx = num;
}

//다음버튼 이벤트
nextBtn.addEventListener('click', function(){
    if(currentIdx < slideCount -4){
        moveSlide(currentIdx + 1);
    } else {
        moveSlide(0);
    }
});

//이전버튼 이벤트
prevBtn.addEventListener('click', function(){
    if(currentIdx > 0){
        moveSlide(currentIdx - 1);
    } else {
        moveSlide(slideCount - 4);
    }
});

//라디오버튼 선택
function matchingPreset(confirmText, action) {
    Swal.fire({
        title: '정보',
        text: "선택한 서비스는 " + document.querySelector('input[name="service"]:checked').parentElement.innerText + "입니다!",
        icon: 'info',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: confirmText,
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            form.action = action;
            form.submit();
        }
    })
}


let form = document.frm_matching;

let icon = null;
let title = null;
let text = null;
let confirmText = null;
let confirmAction = null;

//매칭하기 이벤트
document.getElementById('startMatching').addEventListener('click',function (){
    document.getElementById("colorChange").style.backgroundColor = "#a4e468";
    if (document.querySelector('input[name="service"]:checked') == null){
        icon = 'error';
        title = '오류';
        text = 'OTT 서비스를 선택해 주세요!';
        swalPreset(icon, title, text);
    }else{
        matchingPreset('매칭하기','matchingSelect.jsp');
    }
});

//파티만들기 이벤트
document.getElementById('makeParty').addEventListener('click', function (){
        document.getElementById("colorChange").style.backgroundColor = "#00a3d2";

        if(document.querySelector('input[name="service"]:checked') == null){
            icon = 'warning';
            title = '경고';
            text = 'OTT 서비스를 선택해 주세요!';
            swalPreset(icon, title, text);
        }else {
            matchingPreset('파티생성','matchingCreate.jsp');
        }
});

document.getElementById('accessLink').addEventListener('click', function (){
    document.getElementById("colorChange").style.backgroundColor = "FFD700";
});

//비로그인시
function loginSession(){
    icon = 'error';
    title = '오류';
    text = '로그인 이후 이용가능한 서비스입니다!';
    footer = '<a href="../login.jsp" style="color: #70BBF7; font-weight: bold">로그인 페이지로 이동</a>';
    swalPreset(icon, title, text, footer);
}


