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
                            let icon, title, text;
                            if(result.state == "self"){
                                icon = 'warning';
                                title = '경고';
                                text = '본인글에는 좋아요를 누를 수 없습니다!'
                                swalPreset(icon,title,text);
                            } else if(result.state == "fail"){
                                icon = 'error';
                                title = '오류';
                                text = '좋아요를 실패했습니다!'
                                swalPreset(icon,title,text);
                            }else if(result.state == "internetError"){
                                icon = 'info';
                                title = '정보';
                                text = '인터넷연결이 끊겼습니다!'
                                swalPreset(icon,title,text);
                            }else if(result.state == "success"){
                                if(result.like == 1){
                                    icon = 'success';
                                    title = '성공';
                                    text = '좋아요를 눌렀습니다!'
                                    swalPreset(icon,title,text);
                                }else if(result.like == 0){
                                    icon = 'info';
                                    title = '정보';
                                    text = '좋아요를 해제했습니다!'
                                    swalPreset(icon,title,text);
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
                        dataType: 'json',
                        data: {cm_b_code: cm_b_code, member_id: member_id},
                        success: function (data){
                            let result = data;
                            if(result.state == "self"){
                                icon = 'warning';
                                title = '경고';
                                text = '본인글에는 싫어요를 누를 수 없습니다!'
                                swalPreset(icon,title,text);
                            } else if(result.state == "fail"){
                                icon = 'error';
                                title = '오류';
                                text = '싫어요를 실패했습니다!'
                                swalPreset(icon,title,text);
                            }else if(result.state == "internetError"){
                                icon = 'info';
                                title = '정보';
                                text = '인터넷연결이 끊겼습니다!'
                                swalPreset(icon,title,text);
                            }else if(result.state == "success"){
                                if(result.like == 1){
                                    icon = 'success';
                                    title = '성공';
                                    text = '싫어요를 눌렀습니다!'
                                    swalPreset(icon,title,text);
                                }else if(result.like == 0){
                                    icon = 'info';
                                    title = '정보';
                                    text = '싫어요를 해제했습니다!'
                                    swalPreset(icon,title,text);
                                }
                                document.getElementById("modal-border-dislike").innerText = result.count;
                            }
                        }
                    });
                }
            })
        }
    }

    //뒤로가기
    document.getElementById("close-modal-border").addEventListener("click", ev => {
        $('.community-border-modal').remove();
        document.body.style.overflow = 'auto';
    })
}
