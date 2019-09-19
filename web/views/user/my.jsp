<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%-- <%@ include file="/views/common/header.jsp" %> --%>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>배달 정보 업로드</title>

    <!-- 부트스트랩 4 -->
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
    
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> -->
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->

    <!-- notice -->
	<script src="../../js/notice.js" charset="utf-8"></script>
	
	<!-- mypage js.css -->
	<link href="<%=request.getContextPath()%>/plugins/mypage/css/font-awsome/css/font-awesome.min.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/plugins/mypage/css/style.css" rel="stylesheet">
	

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
    <link href="form-validation.css" rel="stylesheet">


	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/header.css?var=1.1"
	rel="stylesheet" />
	<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />


</head>
<%@ include file="/views/user/myPageHeader.jsp"%>
<body class="bg-light">
	<div class="container">
		<!-- <div class="py-1 text-center">
			<h2>header</h2>
		</div> -->

		<div class="row">
			<div class="col-md-2 order-md-1 mb-1">
				<nav>
					<div><span>nav</span></div>
				</nav>
			</div>


			<!-- 세션 내용 본문 -->
			<div class="col-md-9 order-md-2">
			<!-- ------f---f-df-d---------------- -->	
				
			
			
			
    <!--================================
    =            Page Title            =
    =================================-->
    
    <section class="page-title bg-title overlay-dark">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <div class="title">
                        <h3>운반 정보</h3>
                    </div>
                    <ol class="breadcrumb p-0 m-0 ">
                        <li class="breadcrumb-item"><a href="index.html">홈으로</a></li>
                        <li class="breadcrumb-item">운송정보</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
    
    <!--====  End of Page Title  ====-->
    
    
    <!--================================
    =            News Posts            =
    =================================-->
    
    <section class="news section">
        <div class="container">
            <div class="row mt-40">
            	<!-- 내부 상세데이 -->
            	
            	<%for(int i=0; i<3; i++){ %>
                <div class="col-lg-4 col-md-6 col-sm-8 col-sx-9 col-10 m-auto">
                    <div class="blog-post">
                        <div class="post-thumb">
    
                            <!-- 상세 운반정보 -->
                            <a href="news-single.html">
                                <img src="<%=request.getContextPath()%>/views/images/038.jpg" alt="post-image" class="img-fluid">
                            </a>
                        </div>
                        <div class="post-content">
                            <div class="date">
                                <h4>4<span>9월</span></h4>
                            </div>
                            <div class="post-title">
                                <!-- 상세 운반정보로 이동 -->
                                <p class="mt-1 mb-0">제목</p>
                                <h2 style="font-size: 0.5rem" class="mb-0 mt-0"><a href="news-single.html">운반 지역 내용</a></h2>
                            </div>
                            <div class="post-meta">
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <i class="fa fa-user-o"></i>
                                        <a href="#">글쓴이</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <i class="fa fa-heart-o"></i>
                                        <a href="#">350</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <i class="fa fa-comments-o"></i>
                                        <a href="#">30</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <%} %>
                
    
            </div>
        </div>
    </section>

    <!--====  End of News Posts  ====-->
    

<section class="section schedule">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h3>운송 요청 <span class="alternate">Schedule</span></h3>
                        <p>화물 운송정보 리스목록</p>
                        <hr>
                    </div>
                </div>
            </div>
            <!-- -- 리스트 --  -->
    
            <div class="row">
                <div class="col-12">
                    
                    <!-- 날짜별 스케쥴 리스트 -->
                    <div class="schedule-tab">
                        <ul class="nav nav-pills text-center">
                          <li class="nav-item">
                            <a class="nav-link active" href="#nov20" data-toggle="pill">
                                전 체
                                <span>모든 거래 운송목록</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#nov21" data-toggle="pill">
                                운송현황
                                <span>진행중인 운송목록</span>
                            </a>
                          </li>
                          <li class="nav-item">
                            <a class="nav-link" href="#nov22" data-toggle="pill">
                                운송완료
                                <span>완료 된 운송목록</span>
                            </a>
                          </li>
                        </ul>
                    </div>
                    <!-- 스케쥴 리스트 -->
                    
                    <div class="schedule-contents bg-schedule">
                        <div class="tab-content" id="pills-tabContent">
                          <div class="tab-pane fade show active schedule-item" id="nov20">
                              <!-- Headings -->
                              <ul class="m-0 p-0">
                                  <li class="headings">
                                      <div class="time">시간</div>
                                      <div class="speaker">화물정보</div>
                                      <div class="subject">목적지</div>
                                      <div class="venue">운송상황</div>
                                </li>
                                  
    
                                  <!-- Schedule Details -->
                                  <li class="schedule-details">
                                      <div class="block">
                                          <!-- time -->
                                          <div class="time">
                                              <i class="fa fa-clock-o"></i>
                                              <span class="time">9.00 AM</span>
                                          </div>
                                          <!-- Speaker -->
                                          <div class="speaker">
                                              <img src="images/speakers/speaker-thumb-one.jpg" alt="speaker-thumb-one">
                                            <span class="name">Samanta Doe</span>
                                          </div>
                                          <!-- Subject -->
                                          <div class="subject">서울 -> 부산</div>
                                          <!-- Venue -->
                                          <div class="venue">진행중</div>
                                      </div>
                                  </li>
                                  <!-- Schedule Details -->
                                  <li class="schedule-details">
                                      <div class="block">
                                          <!-- time -->
                                          <div class="time">
                                              <i class="fa fa-clock-o"></i>
                                              <span class="time">10.00 AM</span>
                                          </div>
                                          <!-- Speaker -->
                                          <div class="speaker">
                                              <img src="images/speakers/speaker-thumb-two.jpg" alt="speaker-thumb-two">
                                            <span class="name">Zerad Pawel</span>
                                          </div>
                                          <!-- Subject -->
                                          <div class="subject">서울 -> 강원도</div>
                                          <!-- Venue -->
                                          <div class="venue">준비중</div>
                                      </div>
                                  </li>
                                  
                                
                              </ul>
                          </div>
                          <div class="tab-pane fade schedule-item" id="nov21">
                              <!-- Headings -->
                              <ul class="m-0 p-0">
                                  <li class="headings">
                                      <div class="time">Time</div>
                                      <div class="speaker">Speaker</div>
                                      <div class="subject">Subject</div>
                                      <div class="venue">Venue</div>
                                  </li>
                                  <!-- Schedule Details -->
                                  <li class="schedule-details">
                                      <div class="block">
                                          <!-- time -->
                                          <div class="time">
                                              <i class="fa fa-clock-o"></i>
                                              <span class="time">9.00 AM</span>
                                          </div>
                                          <!-- Speaker -->
                                          <div class="speaker">
                                              <img src="images/speakers/speaker-thumb-one.jpg" alt="speaker-thumb-one">
                                            <span class="name">Samanta Doe</span>
                                          </div>
                                          <!-- Subject -->
                                          <div class="subject">Introduction to Wp</div>
                                          <!-- Venue -->
                                          <div class="venue">Auditorium A</div>
                                      </div>
                                  </li>
                                  <!-- Schedule Details -->
                                  <li class="schedule-details">
                                      <div class="block">
                                          <!-- time -->
                                          <div class="time">
                                              <i class="fa fa-clock-o"></i>
                                              <span class="time">10.00 AM</span>
                                          </div>
                                          <!-- Speaker -->
                                          <div class="speaker">
                                              <img src="images/speakers/speaker-thumb-two.jpg" alt="speaker-thumb-two">
                                            <span class="name">Zerad Pawel</span>
                                          </div>
                                          <!-- Subject -->
                                          <div class="subject">Principle of Wp</div>
                                          <!-- Venue -->
                                          <div class="venue">Auditorium B</div>
                                      </div>
                                  </li>
                                  <!-- Schedule Details -->
                                  <li class="schedule-details">
                                      <div class="block">
                                          <!-- time -->
                                          <div class="time">
                                              <i class="fa fa-clock-o"></i>
                                              <span class="time">12.00 AM</span>
                                          </div>
                                          <!-- Speaker -->
                                          <div class="speaker">
                                              <img src="images/speakers/speaker-thumb-three.jpg" alt="speaker-thumb-three">
                                            <span class="name">Henry Mong</span>
                                          </div>
                                          <!-- Subject -->
                                          <div class="subject">Wp Requirements</div>
                                          <!-- Venue -->
                                          <div class="venue">Auditorium C</div>
                                      </div>
                                  </li>
                                  
                                  
                              </ul>
                          </div>
                          <div class="tab-pane fade schedule-item" id="nov22">
                              <!-- Headings -->
                              <ul class="m-0 p-0">
                                  <li class="headings">
                                      <div class="time">Time</div>
                                      <div class="speaker">Speaker</div>
                                      <div class="subject">Subject</div>
                                      <div class="venue">Venue</div>
                                  </li>
                                  
                                  <!-- Schedule Details -->
                                  <li class="schedule-details">
                                      <div class="block">
                                          <!-- time -->
                                          <div class="time">
                                              <i class="fa fa-clock-o"></i>
                                              <span class="time">2.00 PM</span>
                                          </div>
                                          <!-- Speaker -->
                                          <div class="speaker">
                                              <img src="images/speakers/speaker-thumb-four.jpg" alt="speaker-thumb-four">
                                            <span class="name">Baily Leo</span>
                                          </div>
                                          <!-- Subject -->
                                          <div class="subject">Introduction to Wp</div>
                                          <!-- Venue -->
                                          <div class="venue">Auditorium D</div>
                                      </div>
                                  </li>
                                  
                                  <!-- Schedule Details -->
                                  <li class="schedule-details">
                                      <div class="block">
                                          <!-- time -->
                                          <div class="time">
                                              <i class="fa fa-clock-o"></i>
                                              <span class="time">3.00 PM</span>
                                          </div>
                                          <!-- Speaker -->
                                          <div class="speaker">
                                              <img src="images/speakers/speaker-thumb-six.jpg" alt="speaker-thumb-six">
                                            <span class="name">Lee Mun</span>
                                          </div>
                                          <!-- Subject -->
                                          <div class="subject">Useful tips for Wp</div>
                                          <!-- Venue -->
                                          <div class="venue">Auditorium E</div>
                                      </div>
                                  </li>
                              </ul>
                          </div>
                        </div>
                    </div>
                    


                    <!-- Pagination -->
                <div class="col-12 text-center ">
                        <nav class="d-flex justify-content-center">
                            <ul class="pagination">
                                <li class="page-item">
                                <a class="page-link" href="#" aria-label="prev">
                                <span aria-hidden="true"><i class="fa fa-angle-left"></i></span>
                                <span class="sr-only">prev</span>
                                </a>
                            </li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">4</a></li>
                            <li class="page-item"><a class="page-link" href="#">5</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true"><i class="fa fa-angle-right"></i></span>
                                <span class="sr-only">Next</span>
                                </a>
                            </li>
                            </ul>
                        </nav>
                    </div>
                    <!-- Pagination -->



    
                </div>
            </div>
        </div>
    </section>
    
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/plugins/mypage/js/custom.js"></script>

        <script>
            $(function(){
                $('.schedule-details').click(function () {
                    console.log('스케쥴 상세페이지로 전환');
                    
                });
            });
        </script>
<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">footer</p>
</footer>

</body>



</html>
