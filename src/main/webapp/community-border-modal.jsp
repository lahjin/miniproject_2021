<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!-- 모달창 시작-->
<div class="community-border-modal">
    <form action="" name="" method="post">
        <div class="modal-World">
            <div class="modal-Box">
                <div class="modal-One-Line">
                    <div class="modal-Title">
                        <span class="border-Auto" id="title-Font">제목</span>
                    </div>
                </div>
                <div class="modal-Two-Line">
                    <span id="movie-Font">영화이름</span>
                </div>
                <div class ="modal-Three-Line">
                    <div class="modal-Genre">
                        <span id="modal-border-genre">장르</span>
                    </div>
                    <div class="modal-UserName">
                        <span id="modal-border-grade">작성자등급</span>
                        <span class="border-Auto" id="modal-border-nickname">작성자닉네임</span>
                    </div>
                </div>
                <div class="modal-Four-Line">
                    <div class="modal-ottImage">
                        <img id="modal-border-service" src="" alt="OTT 이름">
                    </div>
                </div>
                <div class="modal-Five-Line">
                    <div class="modal-Review">
                        <span id="review-Font">리뷰내용</span>
                    </div>
                </div>
                <div class="modal-Six-Line">
                    <div class="modal-Rating">
                    <span id="modal-border-star">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="far fa-star"></i>
                        <i class="far fa-star"></i>
                        <i class="far fa-star"></i>
                    </span>
                    </div>
                </div>
                <div class="modal-Seven-Line">
                    <div class="modal-Seven-Detail">
                        <div class="modal-Icon">
                            <span class="cm-a-view" onclick=""><i class="fas fa-eye fa-3x"><p class="point-Font" id="modal-border-view">-</p></i></span>
                            <span class="cm-a-like" onClick=""><i class="fas fa-heart fa-3x"><p class="point-Font" id="modal-border-like">-</p></i></span>
                            <span class="cm-a-dislike" onClick=""><i class="fas fa-heart-broken fa-3x"><p class="point-Font" id="modal-border-dislike">-</p></i></span>
                        </div>
                    </div>
                </div>
                <div class="modal-Eight-Line">
                    <div class="modal-Date">
                        <span id="modal-border-date">작성날짜</span>
                    </div>
                </div>
                <div class="modal-nine-Line">
                    <button type="button" id="edit-modal-border">수정하기</button>
                    <button type="button" id="close-modal-border">뒤로가기</button>
                </div>
            </div>
        </div>
    </form>
</div>
<!--모달창 끝-->