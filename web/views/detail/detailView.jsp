<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%@ page import = "com.truckta.detail.model.vo.Detail" %>

<%
	Detail d = (Detail)request.getAttribute("d");
	String boardNo = (String)request.getAttribute("boardNo");
%>


<!-- This Page's Include and import Files -->

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<%-- <link href="<%=request.getContextPath()%>/css/detailView-Style.css?ver=1.2" rel="stylesheet"> --%>

<!-- ----------------End----------------- -->



	<!-- uploader info -->




	<div class="card-body">
		<table class="table table-striped">
			<thead>
				<th class="py-1">
					<img src="https://www.scripturaengage.com/wp-content/uploads/2018/01/Profile-Picture-Lee-Sneyers-Circle.png"
						alt="image" width="50" height="50" /> </th>
				<th> 권무관 </th>
				<th> 울산 </th>
			</thead>
		</table>
		<h4 class="card-title">서울에서 인천까지</h4>
		<p class="card-description"> 여기는 썹타이틀. </p>
	</div>



	<!-- images carousel -->
	<style>
			#img-carousel {
				width: 200px;
				/* You can set the dimensions to whatever you want */
				height: 300px;
				object-fit: cover;
			}
		</style>
		<!-- please work -->
		<!--Carousel Wrapper-->
		<div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails" data-ride="carousel">
			<!--Slides-->
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active">
					<img class="d-block w-100"
						src="https://upload.wikimedia.org/wikipedia/commons/f/f2/2008-04-13_Expandable_table_expanding.jpg"
						alt="First slide" id = "img-carousel">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="https://content3.jdmagicbox.com/comp/salem/46/0427p427std1300746/catalogue/sri-jayam-lakshmi-hayagreevar-furnitures-salem-1owngizfx8.jpg"
						alt="Second slide" id = "img-carousel">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100"
						src="https://cb2.scene7.com/is/image/CB2/062719_cat_m_furniture_bestsellers?wid=670&qlt=65"
						alt="Third slide" id = "img-carousel">
				</div>
			</div>
			<!--/.Slides-->
			<!--Controls-->
			<a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
			<!--/.Controls-->
			<ol class="carousel-indicators">
				<li data-target="#carousel-thumb" data-slide-to="0" class="active">
					<img src="https://mdbootstrap.com/img/Photos/Others/Carousel-thumbs/img%20(88).jpg" width="100">
				</li>
				<li data-target="#carousel-thumb" data-slide-to="1">
					<img src="https://mdbootstrap.com/img/Photos/Others/Carousel-thumbs/img%20(121).jpg"
						width="100">
				</li>
				<li data-target="#carousel-thumb" data-slide-to="2">
					<img src="https://mdbootstrap.com/img/Photos/Others/Carousel-thumbs/img%20(31).jpg" width="100">
				</li>
			</ol>
		</div>
		<!--/.Carousel Wrapper-->



	<!--- Two Column Section -->
	<br>
	<div class="container padding">
		<div class="row padding">

			<!-- <div class="col-lg-6">
                <img src="img/desk.png" class="img-fluid">
            </div> -->
			<div class="col-md-12 col-lg-6">
				<h2>여기는 제목</h2>
				<p>래이에서 준비한 모바일 펫매거진
					「펫메이트」 9월호를
					보호자님께 보내 드립니다.


					휘영청 밝은 보름달처럼
					환한 웃음 가득한 한가위 맞으세요!


					래이에서 준비한 모바일 펫매거진
					「펫메이트」 9월호를
					보호자님께 보내 드립니다.


					휘영청 밝은 보름달처럼
					환한 웃음 가득한 한가위 맞으세요!
				</p>


				<a href="#" class="btn btn-primary">Learn More</a>
			</div>
		</div>
	</div>
	<hr class="my-4">
	
	<script>
	var d = <%=d%>;
	console.log(d);
	
	</script>












	


<%@ include file="/views/common/footer.jsp"%>