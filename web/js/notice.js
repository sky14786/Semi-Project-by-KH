var imgCk = 0; //고유 테그넘버
var boardFd=new FormData();
var imgTemp = [];

//이미지 자바스크립트
function imgUpload() { // 파일 업로드 on
	var fileTarget = $('.file-img-upload');
	fileTarget.val(''); // 기존 사진 값을 초기화
	fileTarget.click();
};

$(function() {
	//달력 피커
	$('#datepicker').datepicker({
		uiLibrary: 'bootstrap4'
	});
	
	var fileTarget = $('.file-img-upload'); 
	
	fileTarget.on('change', function(){
		//console.log( $('.notice-img').children().length ); // 추가 파일 총 갯수
		if(window.FileReader){
			var fileN = $(this)[0].files; //파일의 배열을 가져옴
			var allImg = $('.notice-img').children().length; // 자식노드 개수

			if( $(fileN).length < 6 && (allImg+$(fileN).length) < 6){ //업로드된 파일 수를 체크
				// 이미지 파일 체크
				for(var j = 0; j < $(fileN).length; j++){
					var file_img = this.files;
					if(!/\.(gif|jpg|jpeg|png)$/i.test(file_img[j].name)){
						alert('gif, jpg, png 파일 확장자만 가능합니다.');
						return;
					}else if(file_img[j].size > (1024 * 1024 * 20)){
						alert('10M 이하 사진 업로드 가능합니다.');
						return;
					}
				}

				// 올라온 이미지 중복확인
				if($('.notice-img').children().length > 0){
					// console.log('중복 확인 : ' + $('.notice-img-lb').val() );
					for(var i = 0; i < $('.notice-img').children().length; i++){
						//console.log($('.notice-img-lb'+i).val());
						for(var j = 0; j < $(fileN).length; j++){
							if( $('.notice-img-lb'+i).val() == $(fileN)[j].name ){
								alert('같은 사진이 존재 합니다.');
								return;
							}
						}
					}//for
				}//if

				// 이미지 생성
				for (var i=0; i < $(fileN).length; i++) {
					// 선택된 이미지 태그생성                
					var imgLabel = 'notice-img-lb' + imgCk;
					var img = $('<input>').attr(
							{'type':'text', 'class':'form-control col-md12 '+ imgLabel ,'placeholder':'사진경로 / 이름' ,'required':'', 'value':fileN[i].name}
					);
					var imgNumbr = 'notice-img-check' + imgCk; //클래서 + 넘버 부여
					var imgBtn = $('<button>').attr(
							{'type':'button', 'class':'btn btn-danger ' + imgNumbr, 'value':imgCk}
					).text('사진 삭제')
					// <--- 사진삭제 리스너--->
					.on('click', function () {
						var ck = $(this).val();
						// console.log(ck);
						// console.log("boardImages"+ck);
						boardFd.delete("boardImages"+ck);
						$(this).parent().remove();
					});
					var imgDiv = $('<div>').attr('class','input-group mb-1 notice-img-div' + imgCk).append(img, imgBtn);

					$('.notice-img-list').append(imgDiv);
					//이미지 폼데이터
					boardFd.append("boardImages" + imgCk, boardUp.ajaxFilenames.files[i]);
					//console.log(boardUp.ajaxFilenames);
					imgCk++;
					
				}//for
			}//if
			else{ // 이미지 개수가 5개 미만일때
				alert('이미지 5장 이상업로드가 불가능합니다.');
				fileTarget.val(''); //초기화
			}
		}//if
		else {
			console.log("img file else->");
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
	}); 


	//글 업로드
	function cancle() {
		console.log('이전 페이지로 이동함');
	}
	
});

// 수정 사진 삭제
function imgDels(im) {
	// $('#fef').prev()
	// var ck = $(this).val().toLowerCase();
	
	// console.log('notice-img-check'+im);
	var ck = '.notice-img-check'+im;
	//boardFd.delete("boardImages"+ck);
	// console.log($(ck).prev().val());
	imgTemp.push($(ck).prev().val());
	$(ck).parent().remove();
}

// null check
function isNull(elStr)
{
	//Null 체크 함수
	//var elm;
	return (elStr == null || elStr == "" || elStr == "undefined" || elStr == " ") ? true : false
}

function boardDuple() {
	//-------- 정규식 ----------
	var ck = 0;
	var boardText = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9|\*]+$/;
	
	if (!boardText.test($('#board-stuff').val()) || $('#board-stuff').val() == "") {
	    alert("비어 있거나 한글/영문/숫자만 입력 가능합니다");
	    return ck;
	}

	if ($('#st-addr-post').val() == "" && $('#st-addr').val() == "" && $('#address').val()){
		alert("출발지 주소를 입력하세요");
		return ck;
	}

	if ($('#end-addr-post').val() == "" && $('#end-addr').val() == "" && $('#address2').val()){
		alert("도착지 주소를 입력하세요");
		return ck;
	}

	// if (!boardText.test($('#board-mat-textarea').val()) || $('#board-mat-textarea').val() == "") {
	if ($('#board-mat-textarea').val().length < 1) {	
	    alert("내용이 비어 있거나 한글/영문/숫자만 입력 가능합니다");
	    return ck;
	}
	// 현재 날짜보다 이전선택하면 안됨(*)
	if ($('#datepicker').val() == ""){
		alert("날짜를 입력해야 합니다");
		return ck;
	}
	// console.log('ttttttt');
	// console.log($('.notice-img').children().length);
	if ($('.notice-img').children().length == 0){
		alert('사진이 1장 이상 필요합니다');
		return ck;
	}
	
	ck = 1;
	return ck;

}


// 이미지 파일 리스트
// function imgNames() {
// 	var imgFileNames = "";
// 	var k = $('.notice-img').children().length;
// 	for (var i=0; i < k; i++) {
// 		var imglb = 'notice-img-lb' + i;
// 		imgFileNames += $('.'+imglb).val() + ','; 
// 		$(".imgNames").val(imgFileNames);


// 빈 값이 있는 지확인하는 스크립트 필요

//정규식





	
