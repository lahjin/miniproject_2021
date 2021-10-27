function adminAccess(adminError) {
    if(adminError == "InsertSuccess"){
        Swal.fire({
            icon: 'success',
            title: '성공',
            text: '관리자계정을 만들었어요!'
        })
    }
    else if(adminError == "InsertExist"){
        Swal.fire({
            icon: 'error',
            title: '오류',
            text: '이미 관리자 계정이 있어요!'
        })
    }
    else if(adminError == "InsertError"){
        Swal.fire({
            icon: 'question',
            title: '데이터베이스 오류',
            text: '서버와의 연결이 끊어졌어요!'
        })
    }

}