<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<div id="container">
<!-- 컨텐츠 에어리어 -->
<div class="container-box">
    <!-- 텍스트 박스 -->
    <div class="textbox">
        <h2>다양한 OTT서비스를
            <br> 더욱 저렴하게 이용해보자!
        </h2>
        <span>넷플릭스, 왓챠, 웨이브로 나가는 구독료가 부담스럽다면</span> <br>
        <span>안전한 계정공유로 더욱 저렴하게!</span>
        <br>
        <!-- 매칭시작 버튼 클릭시 로그인페이지로 이동 -->

        <input type="button" value="매칭시작" class="matchingbtn" onclick="location.href='./matchingMain.jsp'">
    </div>

    <!-- 이미지 박스 시작 -->
    <div class="imagebox">
        <!-- 이미지div -->
        <div class="image">
            <img src="./asset/Netflix.png" alt="넷플릭스 이미지" class="imgfile" >
        </div>
        <!-- 큰원 -->
        <div class="circle">
            <span class="center"></span>
        </div>
    </div>
</div>
<!-- 슬라이드 컨텐트 박스 끝 -->

<!-- 간략소개 부분 -->
<div class="introduction">
    <!-- 첫번째 텍스트박스 -->
    <div class="textarea1">
        <label for="">Advantage!</label>
        <h1>파티매칭을 통한 <br>
            빠른 OTT서비스 이용!
        </h1>
        <p>
            커뮤니티에서 구하는 것보다 더욱 빠르게 <br>
            매칭이 가능합니다!
        </p>
    </div>
    <!-- 두번째 텍스트박스 -->
    <div class="textarea2">

        <h1>보다 더욱 저렴하게<br>
            이용할 수 있다.
        </h1>
        <p>
            달마다 부담되는 월정액 <br>
            MODIVA을 통해 절약해보는건 어떨까요?? <br>
            당신의 지갑을 지켜드립니다.
        </p>

        <div class="example">
            <h2>66%</h2>
            <p>더 저렴하게 <br>이용가능</p>

            <h2>4900</h2>
            <p>원으로 저렴하게 <br>
                이용가능</p>
        </div>

        <!-- 카드 보여줌 -->
    </div>

    <div class="card">
        <div class="netflix ott">NETFLIX
            <span class="text">4900원으로 이용</span>
        </div>

        <div class="watcha ott">WATCHA
            <span class="text">4800원으로 이용</span>
        </div>
        <div class="wavve ott">WAVVE
            <span class="text">4700원으로 이용</span>
        </div>
        <div class="millie ott">MILLIE
            <span class="text">4600원으로 이용</span>

        </div>
    </div>
</div>

<!-- 매칭 가이드 -->
<div class="guide ">
    <h1>어떻게 이용하나요??</h1>
    <span> 아래 간략 가이드를 참고하여 이용해주세요</span>
    <div class="box">

        <div class="circle back-to-position">
            <img src="./asset/icon/search.png" alt="" >
            <h2>SEARCH</h2>
            <span>파티원을 <br> 검색하세요!</span>
        </div>

        <img src="./asset/icon/left-arrow.png" alt="" class="arrow back-to-position">

        <div class="circle back-to-position">
            <img src="./asset/icon/pay.png" alt="">
            <h2>PAY</h2>
            <span>결제를 <br> 해주세요</span>
        </div>

        <img src="./asset/icon/left-arrow.png" alt="" class="arrow back-to-position">

        <div class="circle back-to-position">
            <img src="./asset/icon/finish.png" alt="">
            <h2>GOAL</h2>
            <span>서비스를 <br> 이용하세요</span>
        </div>
    </div>
</div>

<!-- 마무리 패널 -->
<div class="finish">
    <h1>더 저렴한 가격으로</h1>
    <h2>OTT서비스를 이용해봐요</h2>

    <div class="videobox">
        <img src="./asset/poster/체르노빌.png" alt="체르노빌" class="video">
        <img src="./asset/poster/검은태양.png" alt="검은태양" class="video">
        <img src="./asset/poster/귀멸의칼날.png" alt="귀멸" class="video">
        <img src="./asset/poster/기묘한이야기.png" alt="기묘한이야기" class="video">
        <img src="./asset/poster/오징어게임.png" alt="오징어" class="video">
        <img src="./asset/poster/종이의집.png" alt="종이의집" class="video">
        <img src="./asset/poster/에밀리파리에가다.png" alt="에밀리" class="video">
        <img src="./asset/poster/왕좌의게임.png" alt="왕좌" class="video">
    </div>

    <input type="button" value="서비스 시작하기" class="startbtn" onclick="location.href='./login.jsp'">
</div>
    <div id="top">
        <div class="material-icons">arrow_upward</div>
    </div>
</div>