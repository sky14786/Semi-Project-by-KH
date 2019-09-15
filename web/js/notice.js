//이미지 자바스크립트

function imgUpload() { // 파일 업로드 on
	var fileTarget = $('.file-img-upload');
	fileTarget.val(''); // 기존 사진 값을 초기화
	fileTarget.click();
};

var imgCk = 0;

$(function() {
	//달력 피커
	$('#datepicker').datepicker({
		uiLibrary: 'bootstrap4'
	});
	
	var fileTarget = $('.file-img-upload'); 
	
	fileTarget.on('change', function(){
//		console.log( $('.notice-img').children().length ); // 추가 파일 총 갯수
		if(window.FileReader){
			var fileN = $(this)[0].files; //파일의 배열을 가져옴
			var allImg = $('.notice-img').children().length; // 자식노드 개수

			if( $(fileN).length < 6 && (allImg+$(fileN).length) < 6){ //업로드된 파일 수를 체크
				// console.log($(fileN).length);
				// var filename = $(this)[0].files[0].name;
				// console.log( fileN[0].name );

				// 이미지 파일 체크
				for(var j = 0; j < $(fileN).length; j++){
					var file_img = this.files;
					if(!/\.(gif|jpg|jpeg|png)$/i.test(file_img[j].name)){
						alert('gif, jpg, png 파일 확장자만 가능합니다.');
						return;
					}else if(file_img[j].size > (1024 * 1024 * 2)){
						alert('2M 이하 사진 업로드 가능합니다.');
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
							{'type':'button', 'class':'btn btn-danger '+ imgNumbr}
					).text('사진 삭제')
					// <--- 사진삭제 리스너--->
					.on('click', function () {
						$(this).parent().remove();
					})
					;
					var imgDiv = $('<div>').attr('class','input-group mb-1 notice-img-div' + imgCk).append(img, imgBtn);

					$('.notice-img-list').append(imgDiv);
					// console.log("? : " + fileN[i].name); 
					imgCk++; 
					
					// var imgInput = $('<input>').attr(
					// 		{'type' : 'text', 'name' : 'boardImg', 'value':fileN[i].name
					// });
					// var imgInput = $('.imgNames');
					// console.log( $('.'+imgLabel).val() );
					// imgFileNames += ($('.'+imgLabel).val() + ',');
					
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
		}//else
		// $(this).siblings('.upload-name').val(filename); 
	}); 
	
});

//$(function () {
    // $('#boardUpload').click(function () {
		
	// 	var boardFd = new FormData();

	// 	$.each(boardUp.filenames.files, function (i, item) {
	// 	boardFd.append("boardImages" + i, item);
	// 	// console.log(item);
	// 	});
		
	// 	/*  var test = {
	// 	'123':'a', '345':'b'
	// 	}; */
	// 	// boardFd.append('test', test);
	// 	// console.log(boardFd);
		
	// 	$.ajax({
	// 		url:'<%=request.getContextPath()%>/board/upload',
	// 		data: boardFd,
	// 		type:'POST',
	// 		processData:false,
	// 		contentType:false,
	// 		success:function (data) {
	// 			console.log(data);
	// 			alert('upload seccess!!');

	// 		},
	// 		error : function(er) {
	// 			console.log('error');
	// 			console.log(er);
				
	// 		}
	
	// 	});
	// });
//});


// 이미지 파일 리스트
// function imgNames() {
// 	var imgFileNames = "";
// 	var k = $('.notice-img').children().length;
// 	for (var i=0; i < k; i++) {
// 		var imglb = 'notice-img-lb' + i;
// 		imgFileNames += $('.'+imglb).val() + ','; 
// 		$(".imgNames").val(imgFileNames);


// 빈 값이 있는 지확인하는 스크립트 필요

	
