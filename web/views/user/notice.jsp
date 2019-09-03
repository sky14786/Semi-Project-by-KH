<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>배달 정보 업로드</title>

    <!-- 부트스트랩 4 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <!-- jquery -->
    <!-- https://code.jquery.com/jquery-3.4.1.slim.js -->
    <!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->


    <!-- date picker -->
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />

	 <!-- notice -->
	 <script src="../../js/notice.js" charset="utf-8"></script>
	 <!-- post -->
	 <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
	 <script src="../../js/post.js" charset="utf-8"></script>

    <style>
        /* div{
            border: 1px solid black;
        } */
        nav, aside{
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

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- <link href="form-validation.css" rel="stylesheet"> -->

</head>

  <body class="bg-light">
    <div class="container">
      <div class="py-1 text-center">
        <h2>header</h2>
      </div>

      <div class="row">
        <div class="col-md-2 order-md-1 mb-1">
          <nav>nav</nav>
        </div>


        <!-- 세션 내용 본문 -->
        <div class="col-md-8 order-md-2">
          <h4 class="mb-3">배달 정보</h4>
          <hr class="mb-4">
          <form class="needs-validation" novalidate>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">화물 정보</label>
                <input type="text" class="form-control" id="firstName" placeholder="예시) 침대 이사, 소파 배송" value="" required>
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName">가 격</label>
                <input type="text" class="form-control" id="lastName" placeholder="₩" value="" required>
              </div>
            </div>

            <label for="address">출발지 주소</label>
            <div class="input-group mb-1">
              <input type="text" class="start-postcode" name="post-number" placeholder="우 편 번 호" style="text-align: center">
              <input type="text" class="form-control start-addr" placeholder="주소를 검색해주세요" aria-label="" aria-describedby="button-addon2">
              <div class="input-group-append">
                <button class="btn btn-outline-secondary start-btn" type="button" id="button-addon2" onclick="execDaumPostcode(1)">주소 찾기</button>
              </div>
            </div>
            <input type="text" class="form-control start-addr-detail" id="address-2" placeholder="상세 주소를 입력해주세요" required>

            <div class="mb-4"></div>
            <label for="address2">목적지 주소</label>
            <div class="input-group mb-1">
              <input type="text" class="end-postcode" name="post-number" placeholder="우 편 번 호" style="text-align: center">
              <input type="text" class="form-control end-addr" placeholder="주소를 검색해주세요" aria-label="" aria-describedby="">
              <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="execDaumPostcode(2)">주소 찾기</button>
              </div>
            </div>
            
            <input type="text" class="form-control end-addr-detail" id="address2-2" placeholder="상세 주소를 입력해주세요" required>

            <br>
            <div class="mb-3">
              <label for="">설명</label>
              <textarea class="form-control" id="FormControlTextarea" rows="3"></textarea>
            </div>

            <div class="mb-3">
              <label for="truck-size">사이즈 / 규모(선택사항)</label>
              <div class="col-8">
                  <input type="text" class="form-control" id="" placeholder="가로 X 세로  X 높이 (미터로 표시)">
              </div>
            </div>

            <!-- 희망 배송일 -->
            <div class="mb-3">
                <label for="">희망 배송일</label>
                <div class="col-8">
                    <input type="text" class="form-control" id="" placeholder="배송 메모">
                    <div style="height: 4px"></div> 
                    <input class="form-control" id="datepicker" placeholder="일 / 월 / 년"/>
                </div>
            </div>

            
            <hr class="mb-4">

            <!-- 이미지 목록 리스트 -->
            <h3 class="mb-3">이미지 목록</h3>
            <strong>사진은 최소 1개, 최대 5개&nbsp;<span style="font-size: 12px;">(사진당 2.0mb 이하)</span></strong>
            <!-- <strong>사진은 최소 1개, 최대 5개(사진당 2.0mb 이하)</strong> -->
            <hr class="mb-1">

            <!-- 이미지 업로드 버튼 -->
            <div class="input-group mb-3" hidden>
              <div class="custom-file">
                <input type="file" class="custom-file-input file-img-upload" id="input-img-file" multiple>
                <label class="custom-file-label" for="input-img-file">Choose file</label>
              </div>
            </div>

            <div class="mb-2">
              <button class="btn btn-primary btn-sm col-3" type="button" onclick="imgUpload()">사진 올리기</button><small class="text-muted"> &nbsp;최대 5장까지 업로드가 가능</small>
            </div>
            <div class="notice-img-list notice-img">
              <!-- <p>미완성</p>
              <div class="input-group mb-1">
                <input type="text" class="form-control col-md-12" id="cc-name" placeholder="사진경로 / 이름" required>
                <button type="button" class="btn btn-danger img-check0">사진 삭제</button>     -->
            </div>
          </div>
          
          <!-- aside -->
          <div class="col-md-2 order-md-3 mb-1">
              <aside>aside</aside>
          </div>
        </div>
        <hr class="mb-6">
        <!-- 글 업로드시 최소 사진이 1장 이상일때 업로드가능 -->
        <button class="btn btn-primary btn-lg btn-block" type="submit">글 올리기</button>
    </form>
    </div>
    </div>
  </body>

  <footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">footer</p>
  </footer>
</div>


</html>