function checkData() {
  // 조건1. 8~14 영문 대소문자
  // 조건2. 최소 1개의 숫자 혹은 특수 문자를 포함해야 함
  //   var pwChecking = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,14}$/;
  var formatChecking = /\.(jpg|pdf|jpeg|png)$/i;
  var sizeChecking = 1024 * 1024 * 3;

	 
	  if (!$("input[name=title]").val()) {
		alert("제목을 입력해 주세요.");
		return false;
	}
	  if (!$("textarea[name=etc]").val()) {
			alert("내용을 입력해 주세요.");
			return false;
		}
	  for(var i =1 ; i<6;i++){
			if ($("input[name=qnaPic"+i+"]").val()) {
				if (!formatChecking.test($("input[name=qnaPic"+i+"]").val().toLowerCase())) {
					alert("사진의 확장자를 확인해 주세요. [pdf,jpg,jpeg,png]");
					$("input[name=carpic"+i+"]").val("");
					return false;
				}
			}
		}
		for(var i=1;i<6;i++){
			if ($("input[name=qnaPic"+i+"]").val()) {
				var size = document.getElementById("qnaPic"+i).files[0].size;
				if (sizeChecking < size) {
					alert("차사진의 용량을 확인해 주세요. [3MB]");
					$("input[name=qnaPic"+i+"]").val("");
					return false;
				}
			}
		}
		
	return true;	
}