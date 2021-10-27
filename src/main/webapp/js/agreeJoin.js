let checkFlag = 'false';

let check = document.querySelector('.one');
let checkBox = document.getElementsByName("checkBox");
let finalcheck = document.querySelector('.gobtn');

// check 클릭 이벤트
check.addEventListener('click', function () {
    if (checkBox[1].checked == false || checkBox[2].checked == false || checkBox[3].checked == false) {
        for (i = 0; i < checkBox.length; i++) {
            checkBox[i].checked = true;
        }

    } else if (checkBox[1].checked == true && checkBox[2].checked == true && checkBox[3].checked == true) {
        for (i = 0; i < checkBox.length; i++) {
            checkBox[i].checked = false;
        }

    }


});

function clickbtn() {
    if (checkBox[1].checked == false || checkBox[2].checked == false || checkBox[3].checked == false) {
        check.checked = false;
    } else {
        check.checked = true;
    }
}

let icon = null;
let title = null;
let text = null;
function finalCheck(){
    if (checkBox[1].checked == true && checkBox[2].checked == true) {

    } else{
        icon = "error";
        title = "오류!";
        text = "필수 항목을 체크 해 주세요!";
        swalPreset(icon, title, text);
        return false;
    }
}

//onclick으로 하지않을때지만 방법을 모르겠어요
// finalcheck.addEventListener('submit', function (e) {
//     e.preventDefault();
//     if (checkBox[1].checked == true && checkBox[2].checked == true) {
//         alert('성공');
//     } else {
//         alert('실패');
//         return false;
//     }
// });

