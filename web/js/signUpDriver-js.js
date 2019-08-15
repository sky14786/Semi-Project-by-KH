/**
 * 
 */

function certifiedCheck() {
	if (!sessionStorage.getItem("isCertified")) {
		alert("비정상적인 접근입니다.");
		location.href = "../signUpMain.html";
	}
}

function createInputDate() {
	var today = new Date();
	var toyear = parseInt(today.getYear());
	var start = toyear + 1900;
	var end = toyear - 70 + 1900;

	document
			.write("<select name=birth1 class='custom-select-sm select-birth-input'>");
	for (i = start; i >= end; i--) {
		document.write("<option value='" + i + "'>" + i);
	}
	document.write("</select><span class=input-dateofbirth-text>Year</span>  ");

	document
			.write("<select name=birth2 class='custom-select-sm select-birth-input'>");
	for (i = 1; i <= 12; i++) {
		document.write("<option value='" + i + "'>" + i);
	}
	document
			.write("</select><span class=input-dateofbirth-text>Month</span>  ");

	document
			.write("<select name=birth3 class='custom-select-sm select-birth-input'>");
	for (i = 1; i <= 31; i++) {
		document.write("<option value='" + i + "'>" + i);
	}
	document.write("</select><span class=input-dateofbirth-text>Day</span>");
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

	if (!($("select[name=birth1]").val() || $("select[name=birth2]").val() || $(
			"select[name=birth3]").val())) {
		alert("생년월일을 입력해 주세요.");
		return false;
	}

	if (!$("input[name=bLicense]").val()) {
		alert("사업자등록증을 등록해 주세요.");
		return false;
	}

	if (!formatChecking.test($("input[name=bLicense]").val().toLowerCase())) {
		alert("사업자등록증의 확장자를 확인해 주세요. [pdf,jpg,jpeg,png]");
		$("input[name=dLicense]").val("");
		return false;
	}

	if ($("input[name=bLicense]").val()) {
		var size = document.getElementById("bLicense").files[0].size;
		if (sizeChecking < size) {
			alert("사업자등록증의 용량을 확인해 주세요. [3MB]");
			$("input[name=bLicense]").val("");
			return false;
		}
	}

	if (!$("input[name=dLicense]").val()) {
		alert("면허증을 등록해 주세요.");
		return false;
	}

	if (!formatChecking.test($("input[name=dLicense]").val().toLowerCase())) {
		alert("면허증의 확장자를 확인해 주세요. [pdf,jpg,jpeg,png]");
		$("input[name=dLicense]").val("");
		return false;
	}

	if ($("input[name=dLicense]").val()) {
		var size = document.getElementById("dLicense").files[0].size;
		if (sizeChecking < size) {
			alert("사업자등록증의 용량을 확인해 주세요. [3MB]");
			$("input[name=dLicense]").val("");
			return false;
		}
	}

	if ($("input[name=carPic]").val()) {
		if (!formatChecking.test($("input[name=carPic]").val().toLowerCase())) {
			alert("차사진의 확장자를 확인해 주세요. [pdf,jpg,jpeg,png]");
			$("input[name=carPic]").val("");
			return false;
		}
	}

	if ($("input[name=carPic]").val()) {
		var size = document.getElementById("carPic").files[0].size;
		if (sizeChecking < size) {
			alert("차사진의 용량을 확인해 주세요. [3MB]");
			$("input[name=carPic]").val("");
			return false;
		}
	}

	if (!$("input:checkbox[name=isAgree]").is(":checked")) {
		alert("이용약관에 동의해 주세요.");
		return false;
	}
	sessionStorage.removeItem("isCertified");
}
