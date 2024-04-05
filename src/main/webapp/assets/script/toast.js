/**
 * 
 */
function toast({
    title = '', 
    message = '', 
    type = 'info', 
    duration= 3000
}) {
    const main = document.getElementById('toast');
    if(main){
        const toast = document.createElement('div');

        const removeToastAuto = setTimeout(function() {
            main.removeChild(toast);
        }, duration + 1000)

        toast.onclick=function(e){
            if(e.target.closest('.toast__close')){
                main.removeChild(toast);
                clearTimeout(removeToastAuto);
            }
        }

        const icons = {
            success: 'fa-solid fa-circle-check',
            info: 'fa-solid fa-circle-info',
            error: 'fa-solid fa-triangle-exclamation',
            warning: 'fa-solid fa-circle-exclamation',
        };

        const icon = icons[type];
        const delay = (duration/1000).toFixed(2);
        toast.classList.add('toast', `toast--${type}`);
        toast.style.animation = `truotTuPhaiSangTrai ease 0.3s, moDanRoiAnDi linear 1s ${delay}s forwards`;
        toast.innerHTML = `<div class="toast__icon">
                                <i class="${icon}"></i>
                            </div>
                            <div class="toast__body">
                                <h3 class="toast__title">${title}</h3>
                                <p class="toast__msg">${message}</p>
                            </div>
                            <div class="toast__close">
                                <i class="fa-solid fa-xmark"></i>
                            </div>`;
        main.appendChild(toast);
        
    }
}



function showSuccessToast(){
    toast({
        title :'Success',
        message : 'Bạn đã đăng kí thành công tài khoản.',
        type  : 'success',
        duration : 5000
    })
}

function showInfoToast(){
    toast({
        title :'Info',
        message : 'Bạn có một thông báo mới.',
        type  : 'info',
        duration : 5000
    })
}

function showWarningToast(){
    toast({
        title :'Warning',
        message : 'Dung lượng của bạn gần đầy, vui lòng nâng cấp dung lượng.',
        type  : 'warning',
        duration : 5000
    })
}

function showErrorToast(){
    toast({
        title :'Error',
        message : 'Đã xảy ra lỗi, vui lòng kiểm tra lại thông tin.',
        type  : 'error',
        duration : 5000
    })
}
