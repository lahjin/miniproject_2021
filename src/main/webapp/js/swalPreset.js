//기본 swal
function swalPreset(){
    let parameter = arguments; //매개변수를 parameter에 배열로 대입
    let parameterCount = parameter.length; //매개변수의 갯수를 parameterCount 대입
    
    switch (parameterCount){
        //파라미터 3개(icon, title, text)
        case 3:
            Swal.fire({
                icon: parameter[0],
                title: parameter[1],
                text: parameter[2]
            })
            break;
        //파라미터 4개(icon, title, text, footer)
        case 4:
            Swal.fire({
                icon: parameter[0],
                title: parameter[1],
                text: parameter[2],
                footer: parameter[3]
            })
            break;
    }
}
//기본 swal + 확인버튼 클릭시 페이지 이동
function swalOnButtonPreset(){
    let parameter = arguments; //매개변수를 parameter에 배열로 대입
    let parameterCount = parameter.length; //매개변수의 갯수를 parameterCount 대입

    switch (parameterCount) {
        //파라미터 4개(icon, title, text, link)
        case 4:
            Swal.fire({
                icon: parameter[0],
                title: parameter[1],
                text: parameter[2],
                allowOutsideClick: () => {
                    const popup = Swal.getPopup()
                    popup.classList.remove('swal2-show')
                    setTimeout(() => {
                        popup.classList.add('animate__animated', 'animate__headShake')
                    })
                    setTimeout(() => {
                        popup.classList.remove('animate__animated', 'animate__headShake')
                    }, 500)
                    return false
                }
            }).then(function (){
                location.href = parameter[3];
            })
            break;

        //파라미터 5개(icon, title, text, footer, link)
        case 5:
            Swal.fire({
                icon: parameter[0],
                title: parameter[1],
                text: parameter[2],
                footer: parameter[3],
                allowOutsideClick: () => {
                    const popup = Swal.getPopup()
                    popup.classList.remove('swal2-show')
                    setTimeout(() => {
                        popup.classList.add('animate__animated', 'animate__headShake')
                    })
                    setTimeout(() => {
                        popup.classList.remove('animate__animated', 'animate__headShake')
                    }, 500)
                    return false
                }
            }).then(function (){
                location.href = parameter[4];
            })
            break;
    }
}

//기본 toastMessage
    function toastPreset(icon, title) {
        const Toast = Swal.mixin({
            toast: true,
            position: 'bottom',
            iconColor: 'white',
            customClass: {
                popup: 'colored-toast'
            },
            showCloseButton: true,
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: false
        })
        Toast.fire({
            icon: icon,
            title: title
        })
    }