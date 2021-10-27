var img_service = 0;

const circle =  document.querySelector('.circle');
const imgfile = document.querySelector('.imgfile');
const backcolor = document.querySelector('.container-box');
const circlecolor = document.querySelector('.center');


// 메인페이지 배경 색 변경 및 이미지 변경 js
setInterval(function () {
    img_service++;

    if(img_service == 0) {
        circle.style.backgroundColor="#FF0005";
        imgfile.src = "./asset/Netflix.png";
        imgfile.style.width ="200px";
        imgfile.style.height ="400px";
        imgfile.style.transform ="translate(0px, 0px)";
        backcolor.style.backgroundColor = "#121212";
        backcolor.style.color = "#FFF28C";
        circlecolor.style.backgroundColor = "#121212"
    }

    if(img_service == 1) {
        circle.style.backgroundColor="#FFFFFF";
        imgfile.src = "./asset/Watcha.png";
        imgfile.style.width ="340px";
        imgfile.style.height ="200px";
        imgfile.style.transform="rotate(0deg);"
        imgfile.style.transform ="translate(-55px, 120px)";
        // 배경부분
        backcolor.style.backgroundColor = "#F0788C";

        circlecolor.style.backgroundColor = "#F0788C"
    }

    if(img_service == 2) {
        circle.style.backgroundColor="#05DFF7";
        imgfile.style.width ="200px";
        imgfile.style.height ="400px";
        imgfile.src = "./asset/wavve.png";
        imgfile.style.transform ="translate(35px, 70px)";
        // 배경부분
        backcolor.style.backgroundColor = "#0094FF";

        circlecolor.style.backgroundColor = "#0094FF"
    }

    if(img_service == 3) {
        circle.style.backgroundColor="#ffec48";
        document.querySelector('.imgfile').src = "./asset/Millie.png";
        document.querySelector('.imgfile').style.width ="250px";
        document.querySelector('.imgfile').style.height ="200px";
        document.querySelector('.imgfile').style.transform ="translate(20px, 120px)";
        // 배경부분
        backcolor.style.backgroundColor = "lightred";
        circlecolor.style.backgroundColor = "lightred"
        img_service=-1;
    }


}, 3000);

// 슬라이드 js
const dev = document.querySelectorAll('.guide');

dev.forEach(function (spyEl) {
    new ScrollMagic
        .Scene({
            triggerElement: spyEl,
            tirggerHook: .5
        })
        .setClassToggle(spyEl, 'show')
        .addTo(new ScrollMagic.Controller());
});



// 아래 배너 옆으로 가는 슬라이드

const video = document.querySelector('.videobox');


var img_slide = 1;
setInterval(function () {
    if(img_slide < 800)
        video.style.transform = "translate(-"+img_slide+"px, 0px)";

    if(img_slide > 820)
    {
        img_slide = 0;
        video.style.transform = " translate(0px, 0px)";
    }
    img_slide+=7;

}, 120);



const topEl = document.querySelector('#top');
// 업로드 화살표
window.addEventListener('scroll', function() {
    console.log(window.scrollY);

    if(window.scrollY < 500)
    {
        gsap.to(topEl, .2, {
            opacity: 0,
        });
    }

    else {
        gsap.to(topEl, .2, {
            opacity: 1,
        });
    }
});




topEl.addEventListener('click', function() {
    gsap.to(window, .7, {
        scrollTo: 0
    });
});

