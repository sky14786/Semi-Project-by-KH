<%@page import="java.util.ArrayList"%>
<%@page import="com.truckta.boardmatching.model.vo.BoardMatching"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int bmNull = 0;
	int matNull = 0;
	int comNull = 0;
	
	List<BoardMatching> list = new ArrayList<BoardMatching>();
	if((List)request.getAttribute("boardMatching") != null){
		list = (List)request.getAttribute("boardMatching");
	}else bmNull = 1;
	
	List<List> matList = new ArrayList<List>();
	if((List)request.getAttribute("matList") != null){
		matList = (List)request.getAttribute("matList");
	}else matNull = 1;
	
	List<List> matCompleList = new ArrayList<List>();
	if((List)request.getAttribute("matCompleList") != null){ 
		//System.out.println("null");
		matCompleList = (List)request.getAttribute("matCompleList");
	}else comNull = 1;
	
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- 부트스트랩 4 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link
	href="<%=request.getContextPath()%>/plugins/mypage/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/plugins/mypage/css/font-awsome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/plugins/mypage/css/style.css"
	rel="stylesheet">

<!-- FAVICON -->
<!-- <link href="images/favicon.png" rel="shortcut icon"> -->

<title>mypage test</title>
</head>
<body class="body-wrapper">



	<section class="section schedule">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h3>
							운송 요청 <span class="alternate">Schedule</span>
						</h3>
						<p>화물 운송정보 리스목록</p>
						<hr>
					</div>
				</div>
			</div>

			<!-- -- 리스트 --  -->

			<div class="row">
				<div class="col-12">

					<!-- 타이틀 (제목) -->
					<div class="schedule-tab">
						<ul class="nav nav-pills text-center">
							<li class="nav-item"><a class="nav-link active"
								href="#nov20" data-toggle="pill"> 전 체 <span>게시글 요청목록</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#nov21"
								data-toggle="pill"> 운송현황 <span>진행중인 운송목록</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#nov22"
								data-toggle="pill"> 운송완료 <span>완료 된 운송목록</span>
							</a></li>
						</ul>
					</div>
					<!-- 스케쥴 리스트 -->
					<div class="schedule-contents bg-schedule">
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active schedule-item" id="nov20">
								<!-- Headings -->
								<ul class="m-0 p-0">
									<li class="headings">
										<div class="time">화물정보</div>
										<div class="speaker">도착지</div>
										<div class="subject">메모</div>
										<div class="venue">요청만료날짜</div>
									</li>

<!-- ------------------------------------------------------------------------------------------------------------- -->
									<!-- Schedule Details -->
									<%if(bmNull != 1){ %>
									<%for(int i=0; i<list.size(); i++){ %>
									<li class="schedule-details">
										<div class="block">
											<!-- time -->
											<div class="time">
												<i class="fa fa-clock-o"></i> <span class="time">
												<%=list.get(i).getTitle() %>
												</span>
											</div>
											<!-- Speaker -->
											<div class="speaker">
												<img src="images/speakers/speaker-thumb-one.jpg"
													> <span class="name">
													<%
														String edAddr = list.get(i).getEndAddr();
														String edTmp[] = edAddr.split(",");
														for(int j=1; j<edTmp.length-1; j++){
															edAddr = edTmp[j];
														}
														edAddr = edAddr.substring(0, 6);
													%>
													<%=edAddr %>
													</span>
											</div>
											<!-- Subject -->
											<div class="subject"><%=list.get(i).getMemo() %></div>
											<!-- Venue -->
											<div class="venue"><%=list.get(i).getTkDate() %></div>
										</div>
									</li>
									<%} %>
									<%} %>
									<!-- Schedule Details -->
								</ul>
							</div>
							
							
							<div class="tab-pane fade schedule-item" id="nov21">
								<!-- Headings -->
								<ul class="m-0 p-0">
									<li class="headings">
										<div class="time">배송날짜</div>
										<div class="speaker">목적지-도착지</div>
										<div class="subject">연락처</div>
										<div class="venue">가격</div>
									</li>
									
									<%if(matNull != 1){ %>
									<%for(int i=0; i<matList.size(); i++){ %>
									
<!-- 									for (int j = 0; j < list.get(0).size(); j++) {
					System.out.print(list.get(0).get(j) + " "); -->
									<!-- Schedule Details -->
									<li class="schedule-details">
										<div class="block">
											<!-- time -->
											<div class="time">
												<i class="fa fa-clock-o"></i> <span class="time">
												<%=matList.get(i).get(0) %>
												</span>
											</div>
											<!-- Speaker -->
											<div class="speaker">
												<img src="images/speakers/speaker-thumb-one.jpg"
													> <span class="name">
													<%
													String stAddr = (String)(matList.get(i)).get(1);
													String edAddr = (String)(matList.get(i)).get(2);
													String stTmp[] = stAddr.split(",");
													String edTmp[] = edAddr.split(",");
													for(int j=1; j<stTmp.length-1; j++){
														stAddr = stTmp[j];
													}
													stAddr = stAddr.substring(0, 6);
													stAddr += " - ";
													
													for(int j=1; j<edTmp.length-1; j++){
														edAddr = edTmp[j];
													}
													edAddr = edAddr.substring(0, 6);
													stAddr += edAddr;

													%>
													<%=stAddr %>
													</span>
											</div>
											<!-- Subject -->
											<div class="subject"><%=matList.get(i).get(3) %></div>
											<!-- Venue -->
											<div class="venue"><%=matList.get(i).get(4) %></div>
										</div>
									</li>
									<%} %>
									<%} %>
								</ul>
							</div>
							<div class="tab-pane fade schedule-item" id="nov22">
								<!-- Headings -->
								<ul class="m-0 p-0">
									<li class="headings">
										<div class="time">거래완료 일자</div>
										<div class="speaker">운송자</div>
										<div class="subject">도착지</div>
										<div class="venue">금액</div>
									</li>

									<%if(comNull != 1){ %>
									<%for(int i=0; i<matCompleList.size(); i++){ %>
									<!-- Schedule Details -->
									<li class="schedule-details">
										<div class="block">
											<!-- time -->
											<div class="time">
												<i class="fa fa-clock-o"></i> <span class="time">
												<%=matCompleList.get(i).get(0) %>
											</span>
											</div>
											<!-- Speaker -->
											<div class="speaker">
												<img src="images/speakers/speaker-thumb-four.jpg"
													> <span class="name">
													<%=matCompleList.get(i).get(1) %>
													</span>
											</div>
											<!-- Subject -->
											<div class="subject">
												<%
													String edAddr = (String)(matCompleList.get(i)).get(2);
													String edTmp[] = edAddr.split(",");
													for(int j=0; j<edTmp.length-1; j++){
														edAddr = edTmp[j];
													}
													%>
													<%=edAddr %>
											</div>
											<!-- Venue -->
											<div class="venue"><%=matCompleList.get(i).get(3) %></div>
										</div>
									</li>

									<%} %>
									<%} %>
								</ul>
							</div>
						</div>
					</div>



					<!-- Pagination -->
					<div class="col-12 text-center ">
						<nav class="d-flex justify-content-center">
							<ul class="pagination">
								<li class="page-item"><a class="page-link" href="#"
									aria-label="prev"> <span aria-hidden="true"><i
											class="fa fa-angle-left"></i></span> <span class="sr-only">prev</span>
								</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#"
									aria-label="Next"> <span aria-hidden="true"><i
											class="fa fa-angle-right"></i></span> <span class="sr-only">Next</span>
								</a></li>
							</ul>
						</nav>
					</div>
					<!-- Pagination -->




				</div>
			</div>
		</div>
	</section>

	<!--============================
    =            Footer            =
    =============================-->
	<!-- Subfooter -->
	<footer class="subfooter">
		<div class="container">
			<div class="row">
				<div class="col-md-6 align-self-center">
					<div class="copyright-text">
						<p>
							<a href="#">TruckTa</a> &#169; 2019 All Right Reserved
						</p>
					</div>
				</div>
				<div class="col-md-6">
					<a href="#" class="to-top"><i class="fa fa-angle-up"></i></a>
				</div>
			</div>
		</div>
	</footer>



	<!-- JAVASCRIPTS -->
	<!-- jQuey -->
	<!-- <script src="plugins/jquery/jquery.js"></script> -->
	<!-- Popper js -->
	<!-- <script src="plugins/popper/popper.min.js"></script> -->
	<!-- Bootstrap 4 -->
	<!-- <script src="plugins/bootstrap/js/bootstrap.min.js"></script> -->
	<!-- Smooth Scroll -->
	<!-- <script src="plugins/mypage/smoothscroll/SmoothScroll.min.js"></script>   -->
	<!-- Isotope -->
	<!-- <script src="plugins/isotope/mixitup.min.js"></script>   -->
	<!-- Magnific Popup -->
	<!-- <script src="plugins/magnific-popup/jquery.magnific-popup.min.js"></script> -->
	<!-- Slick Carousel -->
	<!-- <script src="plugins/slick/slick.min.js"></script>   -->
	<!-- Custom Script -->
	<script src="<%=request.getContextPath()%>/plugins/mypage/js/custom.js"></script>

	<script>
            $(function(){
                $('.schedule-details').click(function () {
                    console.log('스케쥴 상세페이지로 전환');
                    
                });
            });
        </script>
</body>
</html>