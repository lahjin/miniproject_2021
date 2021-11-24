let cm_b_code = null;

//모달창 띄우기
function borderModalOn(pageNo) {
    cm_b_code = pageNo;
    $.ajax({
       url: "../community-border-modal.jsp",
       async: false,
       type: 'get',
       data: {pageNo: pageNo},
       success: function (data){
           $("body").prepend($(data).fadeIn());
       }
    });
    modal__events();
    document.body.style.overflow = 'hidden';
}
let dd;
//클릭이벤트
function modal__events() {
    let notLogIn = document.querySelectorAll('.session_null');
    let didLogIn = document.querySelectorAll('.session_notNull');

    //비로그인 좋아요 싫어요 클릭 이벤트
    if(notLogIn != null){
        for(let i=0; i<notLogIn.length; i++){
            notLogIn[i].addEventListener("click", function (){
                swalPreset("warning","경고", "로그인 하셔야  좋아요 또는 싫어요를 하실 수 있습니다.");
            })
        }
    }

    //로그인 좋아요 싫어요 클릭 이벤트
    if(didLogIn != null){
        for(let i=0; i<didLogIn.length; i++){
            didLogIn[i].addEventListener("click", function (){
                if(i == 0){
                    $.ajax({
                        url: "BorderLike",
                        async: false,
                        type: 'post',
                        dataType: 'json',
                        data: {cm_b_code: cm_b_code, member_id: member_id},
                        success: function (data){
                            let result = data;
                            if(result.state == "self"){
                                alert('self');
                            } else if(result.state == "fail"){
                                alert('fail');
                            }else if(result.state == "internetError"){
                                alert('internetError');
                            }else if(result.state == "success"){
                                if(result.like == 1){
                                    alert('좋아요를 눌렀습니다.');
                                }else if(result.like == 0){
                                    alert('좋아요를 해제했습니다.');
                                }
                                document.getElementById("modal-border-like").innerText = result.count;
                            }

                        }
                    });
                }else if(i == 1){
                    $.ajax({
                        url: "BorderDislike",
                        async: false,
                        type: 'post',
                        data: {cm_b_code: cm_b_code, member_id: member_id},
                        success: function (data){

                        }
                    });
                }
            })
        }
    }

    //수정하기
    document.getElementById("edit-modal-border").addEventListener("click", ev => {
        alert('수정하기 버튼 클릭');
    })

    //뒤로가기
    document.getElementById("close-modal-border").addEventListener("click", ev => {
        $('.community-border-modal').remove();
        document.body.style.overflow = 'auto';
    })
}
