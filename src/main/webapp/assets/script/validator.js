/**
 * 
 */

// Đối tượng validator
function Validator(options) {

    // Tìm formGroupInput
    function getParentOfInputElement(inputElement, selector) {
        while (inputElement.parentElement){
            if(inputElement.parentElement.matches(selector)){
                return inputElement.parentElement;
            }
            inputElement = inputElement.parentElement;
        }
    }

    var selectorRules = {};

    //Hàm thực hiện validate
    function validate(inputElement, rule) {
        var errorElement = getParentOfInputElement(inputElement, options.formGroupSelector).querySelector(options.errorElement);

        var value = inputElement.value;
        var errorMessage;

        // Lấy ra các rules của seletor
        var rules = selectorRules[rule.selector];
        // Lặp qua từng rule và kiểm tra
        for(var i=0; i<rules.length; i++) {
            switch(inputElement.type){
                case 'radio':
                case 'checkbox':
                    errorMessage = rules[i](
                        formElement.querySelector(rule.selector + ':checked')
                    );
                    break;
                default:
                    errorMessage = rules[i](value);
            }
            if(errorMessage) break;
        }

        if(errorMessage){
            errorElement.innerHTML = errorMessage;
            getParentOfInputElement(inputElement, options.formGroupSelector).classList.add('invalid');
        }else{
            errorElement.innerHTML = '';
            getParentOfInputElement(inputElement, options.formGroupSelector).classList.remove('invalid');
        }

        return !errorMessage;
    }
    // Lấy element của form cần validate
    var formElement = document.querySelector(options.form);

    if(formElement){
        // Khi submit form
        formElement.onsubmit = function(e){
            e.preventDefault();

            var isFormValid = true;

            // Lặp qua các rules va validate
            options.rules.forEach(function (rule){
                var inputElement = formElement.querySelector(rule.selector);
                var isValid = validate(inputElement, rule);
                if(!isValid){
                    isFormValid = false;
                }
            })

            if(isFormValid){
                // Lấy tất cả các thẻ trong form đăng kí có thuộc tính name và không có thuộc tính disabled
                if(typeof options.onSubmit === 'function'){
                    var enableInputs = formElement.querySelectorAll('[name]');
                    var formValues = Array.from(enableInputs).reduce(function(values, input) {

                        switch(input.type){
                            case 'radio':
                                if(input.matches(':checked')){
                                    values[input.name] = input.value;
                                }
                                break;
                            case 'checkbox':
                                if(input.matches(':checked')){
                                    if(Array.isArray(values[input.name])){
                                        values[input.name].push(input.value)
                                    }else{
                                        values[input.name] = [input.value];
                                    }
                                }
                                break;
                            case 'file':
                                values[input.name] = input.files
                                break;
                            default:
                                values[input.name] = input.value
                        }

                        return values;
                    }, {});

                    options.onSubmit(formValues);
                }else{
                    formElement.submit();
                }
            }
        }

        // Lặp qua tất cả các rules và xử lý sự kiện (burl, input, ...)
        options.rules.forEach(function (rule){

            // Lưu lại các rules cho mỗi input
            if(Array.isArray(selectorRules[rule.selector])){
                selectorRules[rule.selector].push(rule.text);
            }else{
                selectorRules[rule.selector] = [rule.text];
            }

            
            var inputElements = formElement.querySelectorAll(rule.selector);

            Array.from(inputElements).forEach(function (inputElement){
                if(inputElement){
                    // Xử lý khi người dùng blur khỏi input
                    inputElement.onblur = function(){
                        validate(inputElement, rule);
                    }
    
                    //Xử lý khi người dùng nhập vào input
                    inputElement.oninput = function (){
                        var errorElement = getParentOfInputElement(inputElement, options.formGroupSelector).querySelector(options.errorElement);
                        errorElement.innerHTML = '';
                        getParentOfInputElement(inputElement, options.formGroupSelector).classList.remove('invalid');
                    }
                }
            })
        })
    }
};


// Định nghĩa rules
Validator.isRequired = function(selector, message){
    return {
        selector : selector,
        text : function(value) {
            return value ? undefined : message || 'Vui lòng nhập trường này.';
        }
    }
}

Validator.isEmail = function(selector, message){
    return {
        selector : selector,
        text : function(value) {
            var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            return regex.test(value) ? undefined : message || 'Trường này phải nhập email.';
        }
    }
}

Validator.minLength = function(selector, min, message){
    return {
        selector : selector,
        text : function(value) {
            return value.length == min ? undefined : message || `Vui lòng nhập ${min} kí tự.`;
        }
    }
}

Validator.isConFirmed = function(selector, getConfirmValue, message){
    return {
        selector : selector,
        text : function(value) {
            return value === getConfirmValue() ? undefined : message || 'Giá trị nhập vào không đúng.';
        }
    }
}