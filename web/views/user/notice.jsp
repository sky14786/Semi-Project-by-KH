<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<title>배달 정보 업로드</title>

<!-- 부트스트랩 4 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="crossorigin="anonymous"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<!-- <script src="https://code.jquery.com/jquery-latest.min.js"></script> -->
<!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->

<!-- jquery -->
<!-- https://code.jquery.com/jquery-3.4.1.slim.js -->
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->

<!-- date picker -->
<script src="../../js/jquery-3.4.1.js" charset="utf-8"></script>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />

<!-- notice -->
<script src="../../js/notice.js" charset="utf-8"></script>
<!-- post -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="../../js/post.js" charset="utf-8"></script>

<style>
nav, aside {
	color: red;
}

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
		<div class="py-1 text-center">
			<h2>header</h2>
			<!-- 헤더 수정 -->


			<!-- <nav class="navbar navbar-expand-sm bg-nav sticky-top">

				<div class="row" style="height: 50; padding: 2 50;">

					<div class="col-md-1 .d-none .d-sm-block">
						<img
							src="<%=request.getContextPath()%>/images/project_images/t-logo.png"
							alt="logo.png" class="nav-bar" />
					</div>
					<div class="col-md-2 .d-none .d-sm-block">


						<p style="font-size: 28px; color: #ffffff;">This is Truckta</p>

					</div>
					<div class="col-md-6">
						<form>
							<div class="input-group">
								<input type="text" class="form-control header-search-bar"
									placeholder="Input your search_keyword" size="120"
									style="height: 45px;" />
								<div class="input-group-append">
									<button type="button" class="btn btn-bg-color ">검색</button>
								</div>
							</div>
						</form>
					</div>

					<div class="col-md-2 mb-1"
						style="display: inline-flex; margin-left: 60px;">
						<button type="button" class="btn btn-bg-color "
							style="width: 100px; height: 40px; margin-top: 2px; margin-right: 10px;">Login</button>
						<button type="button" class="btn btn-bg-color "
							style="width: 100px; height: 40px; margin-top: 2px; margin-right: 10px;">Sign
							Up</button>
					</div>
					<div class="col-md-1"></div>

				</div>
			</nav> -->














		</div>

		<div class="row">
			<div class="col-md-2 order-md-1 mb-1">
				<nav>nav</nav>

				<!-- ---------------------------------------- -->
			</div>
			
			<!-- 세션 내용 본문 -->
			<div class="col-md-8 order-md-2">
				<h4 class="mb-3">배달 정보</h4>
				<hr class="mb-4">
				<!-- ---- 데이터 폼 ---- -->
				
				<form action="" method="post" id="boardUp" name="boardUp" class="needs-validation" enctype="multipart/form-data" >
					<div class="row">
						<div class="col-md-12 mb-3">
							<label for="firstName">화물 정보</label> <input type="text"
								class="form-control" name="stuff" id="board-stuff"
								placeholder="제목) 침대, 이사, 소파 배송" value="" required>
						</div>
					</div>

					<label for="address">출발지 주소</label>
					<div class="input-group mb-1">
						<input type="text" class="form-control start-postcode" name="post-number"
							placeholder="우 편 번 호" style="text-align: center" id="st-addr-post" readonly> 
						<input type="text" class="form-control start-addr" name="start-addr"
							placeholder="주소를 검색해주세요" onkeydown="JavaScript:Enter_Check(1);" id="st-addr" readonly>
						<div class="input-group-append">
							<button class="btn btn-outline-secondary start-btn" type="button"
								id="button-addon1" onclick="execDaumPostcode(1)">주소 찾기</button>
						</div>
					</div>
					<input type="text" class="form-control start-addr-detail"
						name="start-detail" id="address" placeholder="상세 주소를 입력해주세요"
						required>

					<div class="mb-4"></div>
					<label for="address2">목적지 주소</label>
					<div class="input-group mb-1">
						<input type="text" class="form-control end-postcode" name="post-number2"
							placeholder="우 편 번 호" style="text-align: center" id="end-addr-post" readonly> <input
							type="text" class="form-control end-addr" name="end-addr"
							placeholder="주소를 검색해주세요" onkeydown="JavaScript:Enter_Check(2);" id="end-addr" readonly>
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
								<select class="form-control main" id="select-car" name="select-car">
							      <option>Car Type</option>
							      <option value="1">일반</option>
							      <option value="2">냉동차</option>
							      <option value="3">탑차</option>
							      <option value="4">리프트</option>
							      <option value="5">기타</option>
							    </select>
							</div>
						</div>
					</div>
					</script>

					<!-- 희망 배송일 -->
					<div class="mb-3">
						<label for="">희망 배송일</label>
						<div class="col-8">
							<input type="text" class="form-control" name="memo" id="board-memo"
								placeholder="배송 메모">
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
				
			<div class="input-group mb-1">
				<div class="col-md-8"></div>
				<div class="col-md-4">
					<button class="btn btn-danger btn-sm" type="button" onclick="cancle();">뒤로가기</button>
				</div>
				
			</div>
			
			</form>
		
			</div>
      
			<!-- aside -->
			<div class="col-md-2 order-md-3 mb-1">
				<aside>aside</aside>
			</div>
		</div>
     </div>
    <script>
    
    	function cancle() {
			console.log('이전 페이지로 이동함');
		}
    
        $('#boardUpload').click(function () {
    
          
			//fd.append("bs",ajaxFile.ajaxFileTest.files[0]);
			//여러개파일 업로드
	      	//console.log("<%=request.getContextPath()%>");
			var boardFd=new FormData();
			
			$.each(boardUp.ajaxFilenames.files,function(i,item){
           		boardFd.append("boardImages" + i, item);
            	// console.log(item);
			});
			
			boardFd.append("boardStuff", $('#board-stuff').val());
			boardFd.append("stAddrPost", $('#st-addr-post').val());
			boardFd.append("stAddr", $('#st-addr').val());
			boardFd.append("stAddrDe", $('#address').val());
			boardFd.append("endAddrPost", $('#end-addr-post').val());
			boardFd.append("endAddr", $('#end-addr').val());
			boardFd.append("endAddrDe", $('#address2').val());
			
			boardFd.append("boardTextA", $('#board-mat-textarea').val());			
			boardFd.append("carType", $("#select-car option:selected").val());
			boardFd.append("boardMemo", $('#board-memo').val());
			boardFd.append("boardDate", $('#datepicker').val());
	          
        $.ajax({
          url:'<%=request.getContextPath()%>/board/upload',
          data: boardFd,
          type:'post',
          processData:false,
          contentType:false,
          success:function (data) {
            //console.log(data);
            alert('upload seccess!!');

          },
          error : function(er) {
            console.log('error');
            console.log(er);
        }
	
      });
    });
    </script>

</body>

<footer class="my-5 pt-5 text-muted text-center text-small">
	<p class="mb-1">footer</p>
</footer>


</html>



