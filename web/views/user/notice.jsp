<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<title>배달 정보 업로드</title>
<%@ include file="/views/common/header.jsp"%>
<%@ include file="/views/myPage/myPageHeader.jsp"%>
<!-- date picker -->
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"
	charset="utf-8"></script>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<!-- post -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/notice.js?ver=2" charset="utf-8"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="<%=request.getContextPath()%>/js/post.js" charset="utf-8"></script>


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>

<body class="bg-light">
	<div class="container">
		<!-- <nav></nav> -->
		<div class="row">
			<div class="col-md-2 order-md-1 mb-1"></div>
			<!-- 세션 내용 본문 -->
			<div class="col-md-8 order-md-2">
				<hr>
				<h4 class="mb-3">배달 정보</h4>
				<hr class="mb-4">
				<!-- ---- 데이터 폼 ---- -->
				<form action="" method="post" id="boardUp" name="boardUp"
					class="needs-validation" enctype="multipart/form-data">
					<div class="row">
						<div class="col-md-12 mb-3">
							<label for="firstName">화물 정보(제목)</label> <input type="text"
								class="form-control" name="stuff" id="board-stuff"
								placeholder="침대 이사 소파등 배송목록" value="" required>
						</div>
					</div>

					<label for="address">출발지 주소</label>
					<div class="input-group mb-1">
						<input type="text" class="form-control start-postcode"
							name="post-number" placeholder="우 편 번 호"
							style="text-align: center" id="st-addr-post" readonly> <input
							type="text" class="form-control start-addr" name="start-addr"
							placeholder="주소를 검색해주세요" onkeydown="JavaScript:Enter_Check(1);"
							id="st-addr" readonly>
						<div class="input-group-append">
							<button class="btn btn-outline-secondary start-btn" type="button"
								id="button-addon1" onclick="execDaumPostcode(1)">주소 찾기</button>
						</div>
					</div>
					<input type="text" class="form-control start-addr-detail"
						name="start-detail" id="address" placeholder="상세 주소를 입력해주세요"
						value="" required>

					<div class="mb-4"></div>
					<label for="address2">도착지 주소</label>
					<div class="input-group mb-1">
						<input type="text" class="form-control end-postcode"
							name="post-number2" placeholder="우 편 번 호"
							style="text-align: center" id="end-addr-post" readonly> <input
							type="text" class="form-control end-addr" name="end-addr"
							placeholder="주소를 검색해주세요" onkeydown="JavaScript:Enter_Check(2);"
							id="end-addr" readonly>
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2" onclick="execDaumPostcode(2)">주소 찾기</button>
						</div>
					</div>
					<input type="text" class="form-control end-addr-detail"
						name="end-detail" id="address2" placeholder="상세 주소를 입력해주세요"
						required> <br>

					<!-- 설명 -->
					<div class="mb-3">
						<label for="">설명</label>
						<textarea class="form-control" name="etc" id="board-mat-textarea"
							rows="3" placeholder="여기에는 배송관련 정보를 입력해주세요"></textarea>
					</div>
					<!-- 화물 차종 선택 -->
					<div class="mb-3">
						<label for="truck-size">화물차 선택(선택사항)</label>
						<div class="col-8">
							<div class="form-group">
								<select class="form-control main" id="select-car"
									name="select-car">
									<option value="0">Car Type</option>
									<option value="2">1.5톤 일반</option>
									<option value="3">1.5톤 냉각차</option>
									<option value="4">1.5톤 탑차</option>
									<option value="5">2.5톤 일반</option>
									<option value="6">2.5톤 탑차</option>
									<option value="7">2.5톤 냉각차</option>
									<option value="8">1톤 일반</option>
								</select>
							</div>
						</div>
					</div>
					</script>

					<!-- 희망 배송일 -->
					<div class="mb-3">
						<label for="">희망 배송일</label>
						<div class="col-8">
							<input type="text" class="form-control" name="memo"
								id="board-memo" placeholder="연락 메모">
							<div style="height: 4px"></div>
							<input class="form-control" id="datepicker" name="date"
								placeholder="일 / 월 / 년" readonly />
						</div>
					</div>


					<hr class="mb-4">

					<!-- 이미지 목록 리스트 -->
					<h3 class="mb-3">이미지 목록</h3>
					<strong>사진은 최소 1개, 최대 5개&nbsp;<span
						style="font-size: 12px;">(사진당 2.0mb 이하)</span></strong>
					<!-- <strong>사진은 최소 1개, 최대 5개(사진당 2.0mb 이하)</strong> -->
					<hr class="mb-1">

					<!-- 이미지 업로드 버튼 -->
					<div class="input-group mb-3" hidden>
						<div class="custom-file">
							<input type="file" name="ajaxFilenames"
								class="custom-file-input file-img-upload" id="input-img-file"
								accept=".jpg, .png, .pdf" multiple> <label
								class="custom-file-label" for="input-img-file">Choose
								file</label>
						</div>
					</div>

					<div class="mb-2">
						<button class="btn btn-primary btn-sm col-3" type="button"
							onclick="imgUpload()">사진 올리기</button>
						<small class="text-muted"> &nbsp;최대 5장까지 업로드가 가능</small>
					</div>
					<div class="notice-img-list notice-img">
						<!-- 이미지 생성 공간 -->
					</div>
					<div class='col-md12' hidden>
						<input class='imgNames' type="text" name='imgNamess'></input>
					</div>

					<hr class="mb-6">
					<!-- 글 업로드시 최소 사진이 1장 이상일때 업로드가능 -->
					<button class="btn btn-primary btn-lg btn-block" id="boardUpload"
						type="button">글 올리기</button>

					<hr>
					<div class="input-group mb-1">
						<div class="col-md-8"></div>
						<div class="col-md-4">
							<button class="btn btn-danger btn-sm btn-block" type="button"
								onclick="cancle();">뒤로가기</button>
						</div>
					</div>
					<script>
				function cancle() {
					location.href="<%=request.getContextPath()%>/my/pageTop";
				}
			</script>
				</form>
				<!-- //---------// -->

			</div>
			<!-- aside -->
			<div class="col-md-2 order-md-3 mb-1">
				<!-- <aside>aside</aside> -->
			</div>
		</div>
	</div>
	<script>
		
			$('#boardUpload').click(function () {
			console.log('loglog');
			var du = boardDuple();	//유효성 검사
			
			if(du != 0){
				//fd.append("bs",ajaxFile.ajaxFileTest.files[0]);
				//여러개파일 업로드
				// $.each(boardUp.ajaxFilenames.files,function(i,item){
				// 	boardFd.append("boardImages" + i, item);
				// 	console.log(item);
				// });
				
				boardFd.append("boardStuff", $('#board-stuff').val()); //title
				boardFd.append("stAddrPost", $('#st-addr-post').val());
				boardFd.append("stAddr", $('#st-addr').val());
				boardFd.append("stAddrDe", $('#address').val());
				boardFd.append("endAddrPost", $('#end-addr-post').val());
				boardFd.append("endAddr", $('#end-addr').val());
				boardFd.append("endAddrDe", $('#address2').val());
				
				boardFd.append("boardTextA", $('#board-mat-textarea').val());
				if($("#select-car option:selected").val() == "0"){
					boardFd.append("carType", "8");
				}else{
					boardFd.append("carType", $("#select-car option:selected").val());
				}
				boardFd.append("boardMemo", $('#board-memo').val());
				boardFd.append("boardDate", $('#datepicker').val());
				console.log("test");
				$.ajax({
					url:"<%=request.getContextPath()%>/board/upload",
					data:boardFd,
					type:'post',
					processData:false,
					contentType:false,
					success:function (data) {
						alert('upload seccess!!');
						location.href="<%=request.getContextPath()%>/";
											},
											error : function(er) {
												console.log('error');
												console.log(er);
											}
										});//ajax

							} else { // 유효성 검사 실패
								console.log('input error');
							}

						});
	</script>

</body>

<footer class="my-5 pt-5 text-muted text-center text-small">
	<!-- <p class="mb-1">footer</p> -->
</footer>

</html>

