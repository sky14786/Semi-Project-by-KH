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

<!-- uploader's info -->

<style>
.img-sm{
    width: 40px;
    height: 40px;

}
</style>

<div class="d-flex py-2 border-bottom">
			<img class="img-sm rounded-circle ml-4"
				src="<%=request.getContextPath()%>/images/avatars/User 01b.png"
				alt="profile image">
			<div class="wrapper mal-2 ml-4">
				<p class="mb-n1 font-weight-semibold"><%=d.getName() %></p>
				<small><%=d.getCarType() %> 희망</small>
			</div>
			<small class="text-muted ml-auto mr-4">조회수 : <%=d.getCount() %></small>
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
					<img src="https://upload.wikimedia.org/wikipedia/commons/f/f2/2008-04-13_Expandable_table_expanding.jpg" width="100">
				</li>
				<li data-target="#carousel-thumb" data-slide-to="1">
					<img src="https://content3.jdmagicbox.com/comp/salem/46/0427p427std1300746/catalogue/sri-jayam-lakshmi-hayagreevar-furnitures-salem-1owngizfx8.jpg"
						width="100">
				</li>
				<li data-target="#carousel-thumb" data-slide-to="2">
					<img src="https://cb2.scene7.com/is/image/CB2/062719_cat_m_furniture_bestsellers?wid=670&qlt=65" width="100">
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
				<!-- start to destination -->
				<h3><%=d.getStartAddr() %> ==> <%=d.getEndAddr() %></h3>
				<!-- title -->
				<h2><%=d.getTitle() %></h2>
				<!-- description -->
				<p><%=d.getEtc() %></p>
				<!-- 메모 null 이면 숨기기 -->
				<%if(d.getMemo()!=null) {%>
				<p><%=d.getMemo() %></p>
				<%} %>
			<a href="#" class="btn btn-primary">Learn More</a>
			</div>
			
		</div>
	</div>
	<hr class="my-4">
	

	
	


<%-- <%@ include file="/views/common/footer.jsp"%> --%>