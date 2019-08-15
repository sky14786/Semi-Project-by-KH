/**
 * 
 */

function certifiedCheck() {
	if (!sessionStorage.getItem("isCertified")) {
		alert("비정상적인 접근입니다.");
		location.href = "../signUpMain.html";
	}
}

function checkData() {
	// 조건1. 8~14 영문 대소문자
	// 조건2. 최소 1개의 숫자 혹은 특수 문자를 포함해야 함
	var pwChecking = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,14}$/;
	var idChecking = /[^0-9]/g;
	var formatChecking = /\.(jpg|pdf|jpeg|png)$/i;
	var sizeChecking = 1024 * 1024 * 3;

	if (!(idChecking.test($("input[name=id]").val()) || $("input[name=id]")
			.val())) {
		alert("아이디가 정상적이지 못합니다.");
		return false;
	}

	if (!pwChecking.test($("input[name=pw]").val())) {
		alert("비밀번호는 8~14자 영소문자,대문자로 이루어져 있습니다.");
		return false;
	}

	if ($("input[name=pw]").val() != $("input[name=pwCheck]").val()) {
		alert("비밀번호가 일치하지 않습니다.");
		$("input[name=pwCheck]").val("");
		return false;
	}

	if (!$("input[name=name]").val()) {
		alert("이름을 입력해 주세요.");
		return false;
	}

	if ($("input[name=profile]").val()) {
		if (!formatChecking.test($("input[name=profile]").val().toLowerCase())) {
			alert("프로필사진의 확장자를 확인해 주세요. [pdf,jpg,jpeg,png]");
			$("input[name=profile]").val("");
			return false;
		}
	}

	if ($("input[name=profile]").val()) {
		var size = document.getElementById("profile").files[0].size;
		if (sizeChecking < size) {
			alert("프로필사진의 용량을 확인해 주세요. [3MB]");
			$("input[name=profile]").val("");
			return false;
		}
	}

	if (!$("input:checkbox[name=isAgree]").is(":checked")) {
		alert("이용약관에 동의해 주세요.");
		return false;
	}

	sessionStorage.removeItem("isCertified");
}
