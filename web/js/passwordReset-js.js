 function checkData(){
        var pwChecking = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,14}$/;
	    var idChecking = /[^0-9]/g;
        
        if (!pwChecking.test($("input[name=pw]").val())) {
            alert("비밀번호는 8~14자 영소문자,대문자로 이루어져 있습니다.");
            return false;
        }

        if ($("input[name=pw]").val() != $("input[name=pwCheck]").val()) {
            alert("비밀번호가 일치하지 않습니다.");
            $("input[name=pwCheck]").val("");
            return false;
        }
        return true;
    }