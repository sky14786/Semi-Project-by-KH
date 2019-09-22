function certifiedCheck() {
  if (!sessionStorage.getItem("isCertified")) {
    alert("비정상적인 접근입니다.");
    location.href = "../";
  }
}

function checkData() {
  // 조건1. 8~14 영문 대소문자
  // 조건2. 최소 1개의 숫자 혹은 특수 문자를 포함해야 함
  //   var pwChecking = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,14}$/;
  var idChecking = /[^0-9]/g;
  var formatChecking = /\.(jpg|pdf|jpeg|png)$/i;
  var sizeChecking = 1024 * 1024 * 3;

  if (!(idChecking.test($("input[name=id]").val()) || $("input[name=id]").val())) {
    alert("아이디가 정상적이지 못합니다.");
    return false;
  }
  if (!$("input[name=dateOfBirth]").val()) {
		alert("생년월일을 입력해 주세요.");
		return false;
	}
	if (!$("input[name=dLicense]").val()) {
		alert("면허증을 등록해 주세요.");
		return false;
	}

	if (!$("input[name=bLicense]").val()) {
		alert("사업자등록증을 등록해 주세요.");
		return false;
	}
	for(var i =1 ; i<6;i++){
		if ($("input[name=carpic"+i+"]").val()) {
			if (!formatChecking.test($("input[name=carpic"+i+"]").val().toLowerCase())) {
				alert("프로필사진의 확장자를 확인해 주세요. [pdf,jpg,jpeg,png]");
				$("input[name=carpic"+i+"]").val("");
				return false;
			}
		}
	}
	for(var i=1;i<6;i++){
		if ($("input[name=carPic]").val()) {
			var size = document.getElementById("carPic").files[0].size;
			if (sizeChecking < size) {
				alert("차사진의 용량을 확인해 주세요. [3MB]");
				$("input[name=carPic]").val("");
				return false;
			}
		}
	}
	
	 isValiDate($("input[name=dateOfBirth]").val());
	 
	 for(var i =1 ; i<6;i++){
			if ($("input[name=carPic"+i+"]").val()) {
				if (!formatChecking.test($("input[name=carPic"+i+"]").val().toLowerCase())) {
					alert("프로필사진의 확장자를 확인해 주세요. [pdf,jpg,jpeg,png]");
					$("input[name=carPic"+i+"]").val("");
					return false;
				}
			}
		}
		for(var i=1;i<6;i++){
			if ($("input[name=carPic"+i+"]").val()) {
				var size = document.getElementById("carPic"+i).files[0].size;
				if (sizeChecking < size) {
					alert("차사진의 용량을 확인해 주세요. [3MB]");
					$("input[name=carPic"+i+"]").val("");
					return false;
				}
			}
		}
	

	  if (!$("input:checkbox[name=isAgree]").is(":checked")) {
		alert("이용약관에 동의해 주세요.");
		return false;
	}
 
}

function isDateCheck(dateStr) {
    var year = Number(dateStr.substr(0,4)); 
    var month = Number(dateStr.substr(4,2));
    var day = Number(dateStr.substr(6,2));
    var today = new Date(); // 날자 변수 선언
    var yearNow = today.getFullYear();
    var adultYear = yearNow-20;


    if (year < 1900 || year > adultYear){
         alert("년도를 확인하세요. "+adultYear+"년생 이전 출생자만 등록 가능합니다.");
         return false;
    }
    if (month < 1 || month > 12) { 
         alert("달은 1월부터 12월까지 입력 가능합니다.");
         return false;
    }
   if (day < 1 || day > 31) {
         alert("일은 1일부터 31일까지 입력가능합니다.");
         return false;
    }
    if ((month==4 || month==6 || month==9 || month==11) && day==31) {
         alert(month+"월은 31일이 존재하지 않습니다.");
         return false;
    }
    if (month == 2) {
         var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
         if (day>29 || (day==29 && !isleap)) {
              alert(year + "년 2월은  " + day + "일이 없습니다.");
              return false;
         }
    }
    return true;
}


