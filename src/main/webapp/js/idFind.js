const name2 = document.getElementsByName('username')[0];
const email = document.getElementsByName("useremail")[0];
const finalbtn = document.getElementsByName("emailsend")[0];

let text = '@';

//이메일 정규식 체크
function CheckEmail(str)

{                                                 
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

     if(!reg_email.test(str)) {                            
          return false;         
     }                            

     else {                       
          return true;         
     }                            

}         


// 클릭 이벤트
finalbtn.addEventListener('click', function() {

    

    if(!CheckEmail(email.value))	{
        alert("이메일 형식이 잘못되었습니다");
       email.focus();
        return;
    }           
    else {
          alert("입력하신 아이디로 보냈습니다~");
          location.href="./login.html";
    }     
});


// 텍스트상자에 일정 수 만큼 글을 적어야 이메일 보내기가 활성화됨
function letters() {
    if(name2.value.length > 2 && email.value.length > 5 && email.value.indexOf('@') > -1) {
        finalbtn.style.backgroundColor = "royalblue";
        finalbtn.style.color = "#fff";
     }

     else {
        finalbtn.style.backgroundColor = "lightgray";
        finalbtn.style.color = "gray";
     }
}
