<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.truckta.file.matching.model.vo.FileMatching"%>
<%@page import="com.truckta.boardmatching.model.vo.BoardMatching"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int boardTopNull = 0;
	int imgTopNull = 0;
	
	List<BoardMatching> list = new ArrayList<BoardMatching>();
	if((List)request.getAttribute("boardTop") != null){
		list = (List)request.getAttribute("boardTop");
	}else boardTopNull = 1;
	
	List<List> imgTop = new ArrayList<List>();
	if((List)request.getAttribute("imgTop") != null){
		imgTop = (List)request.getAttribute("imgTop");
	}else imgTopNull = 1;
	
%>


<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
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
 -->
<%-- <link
	href="<%=request.getContextPath()%>/plugins/mypage/bootstrap/css/bootstrap.min.css"
	rel="stylesheet"> --%>
<link
	href="<%=request.getContextPath()%>/plugins/mypage/css/font-awsome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/plugins/mypage/css/style.css"
	rel="stylesheet">
<title>mypage test</title>
</head>
<%@ include file="/views/user/myPageHeader.jsp"%>
<body class="body-wrapper">
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
						<%-- <li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/mainPage.jsp">홈으로</a></li>
						<li class="breadcrumb-item">운송정보</li> --%>
					</ol>
				</div>
			</div>
		</div>
	</section>
	<!--====  End of Page Title  ====-->


	<!--================================
    =            Driver Posts            =
    =================================-->
	<section class="news section">
		<div class="container">
			<div class="row mt-40">
				<!-- 내부 상세데이 -->
				<%
					if(boardTopNull == 0 || imgTopNull == 0){
					int size = 1;
					if(list.size() >= 3){
						size = 3;
					}else{
						switch (list.size()) {
						case 2:
							size = 2;
							break;
						default:
							break;
						}
					}
					
				%>
				<%for(int i=0; i<size; i++){ %>
				<%-- <%for(int i=0; i<list.size(); i++){ %> --%>
				<div class="col-lg-4 col-md-6 col-sm-8 col-sx-9 col-10 m-auto">
					<div class="blog-post">
						<div class="post-thumb">

							<!-- 상세 운반정보 -->
							<a href="#"> <img
								src="<%=request.getContextPath()%>/images/boardMatching_images/defaultImg.jpg"
								alt="post-image" class="img-fluid">
							</a>
						</div>
						<div class="post-content">
							<div class="date">
								<h4>
								<%
									//System.out.println(list.get(i).getTkDate());
									Date date = list.get(i).getTkDate();
									String tk = new SimpleDateFormat("yyyy-MM-dd").format(date);
									String tk1= tk.substring(5, 7);
									tk = tk.substring(8, 10);
	 							%>

									<%=tk%><span><%=tk1%>월</span>
								</h4>
							</div>
							<div class="post-title">
								<!-- 상세 운반정보로 이동 -->
								<p class="mt-1 mb-0">
								<%
									String title = list.get(i).getTitle();
									if(list.get(i).getTitle().length() > 9){
										title = title.substring(0, 7);
										title += "..";
									}
								%>
								<%=title%>
								</p>
								<h2 style="font-size: 0.5rem" class="mb-0 mt-0">
									<a href="#">
									<%
										String stAddr = list.get(i).getStartAddr();
										String edAddr = list.get(i).getEndAddr();
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
									</a>
								</h2>
							</div>
							<div class="post-meta">
								<ul class="list-inline">
									<li class="list-inline-item"><i class="fa fa-user-o"></i>
										<a href="#">
										<%
											String writer = list.get(i).getWrtier();
											writer = writer.substring(9, 13);
										%>
										<%=writer %>
										</a></li>
									<li class="list-inline-item"><i class="fa fa-heart-o"></i>
										<a href="#"><%=list.get(i).getCount() %></a></li>
									<li class="list-inline-item"><i class="fa fa-comments-o"></i>
										<a href="#">????</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<%} }else{%>
				<!-- ---------- 빈데이터 ---------- -->
                <div class="col-lg-4 col-md-6 col-sm-8 col-sx-9 col-10 m-auto">
                    <div class="blog-post">
                        <div class="post-thumb">
                            <a href="#">
                                <img src="<%=request.getContextPath()%>/views/images/038.jpg" alt="post-image" class="img-fluid">
                            </a>
                        </div>
                        <div class="post-content">
                            <div class="date">
                                <h4>01<span>1월</span></h4>
                            </div>
                            <div class="post-title">
                                <!-- 상세 운반정보로 이동 -->
                                <p class="mt-1 mb-0">제목</p>
                                <h2 style="font-size: 0.5rem" class="mb-0 mt-0"><a href="#">운반 지역 내용</a></h2>
                            </div>
                            <div class="post-meta">
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <i class="fa fa-user-o"></i>
                                        <a href="#">글쓴이</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <i class="fa fa-heart-o"></i>
                                        <a href="#">조회수</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <i class="fa fa-comments-o"></i>
                                        <a href="#">30???</a>
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
	
			<!-- -- 리스트 --  -->

			<div class="row">
				<div class="col-12">

					<!-- section -->



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