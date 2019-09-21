<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<!-- <link href="../../css/clientUpdate-Style.css?ver=1.1" rel="stylesheet" />
<script src="../../js/clientUpdate-js.js?ver=1.1" charset="utf-8"></script> -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/signUpDriver-Style.css?ver=1.1" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/js/signUpDriver-js.js?ver=1.1" charset="utf-8"></script>
<%@ page import="com.truckta.client.model.vo.Client,com.truckta.driver.model.vo.Driver,java.util.List,com.truckta.cartype.model.vo.CarType,com.truckta.file.driver.model.vo.FileDriver"%>
<%
	request.setCharacterEncoding("UTF-8");
	Client client = (Client) request.getAttribute("client");
	Driver driver = (Driver) request.getAttribute("driver");
	List<FileDriver> fileList = (List) request.getAttribute("fileList");
	boolean isDriverView = (boolean) request.getAttribute("isDriverView");
	List<CarType> carTypeList = (List) request.getAttribute("carType");
%>
<%-- <div class="container"> --%>
<!-- <br /> <br /> <br /> -->

<script>
	//certifiedCheck();
</script>

<div class="container">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-1"></div>
		<div class="col-6">
			<br>
			<br>
			<br>
			<br>
			<h2>Modify information</h2>
			<hr>
			<form
				action="<%=request.getContextPath()%>/ClientUpdateEndServlet.do"
				method="post" name="sendform" enctype="multipart/form-data">
				<!-- onsubmit="return checkData();" -->
				<div class="form-group">
					<label for="id">ID</label> <input type="text" name="id" id="id"
						class="form-control" value="<%=client.getId()%>" readonly />
				</div>
				<div class="form-group">
					<label for="name">Name</label> <input type="text" name="name"
						id="name" class="form-control" value="<%=client.getName()%>"
						readonly/>
				</div>
				<div class="form-group">
					<label for="name">Email</label> <input type="text" name="email"
						id="email" class="form-control"
						value="<%=client.getEmail()%>" placeholder="EMAIL" readonly />
				</div>
				<div class="form-group">
					<%
						if (client.getProfile() != null) {
					%>
						<label for="profile">Profile Picture</label><hr>
						<img src="<%=request.getContextPath() %>/images/profile_images/<%=client.getProfile() %>" width="500px" height="300px">
						<hr>
					<%
						}
					%>
					<div class='bigPictureWrapper'>
						<div class='bigPicture'>
						</div>
					</div>
				</div>
				<div class="form-group form-group-1">
					<%
						if (driver != null && (isDriverView || client.getUserType() == 2)) {
					%>

					<label>Date of Birth</label><br />

					<input type="text" name="dateOfBirth" id="dateOfBirth"
						class="form-control"  value="<%=driver.getDateOfBirth()%>" readonly/>
				</div>
				<div class="form-group">
					<label for="dLicense">Driver License</label>
					<%
						for (int i = 0; i < carTypeList.size(); i++) {
								if (carTypeList.get(i).getTypeNo() == driver.getCarType()) {
					%>
					<input type="text" name="dLicense" id="dLicense"
						class="form-control" placeholder="ex.??-??-??????-??" value="<%=carTypeList.get(i).getCarType()%>"readonly/>
					<%
						}
							}
					%>
				</div>
				
				
				<div class="form-group">
					<label for="dLicense">Driver License</label> <input type="text" name="dLicense" id="dLicense"
						class="form-control" placeholder="ex.??-??-??????-??" value="<%=driver.getdLicense()%>"readonly/>
				</div>
				<div class="form-group">
					<label for="bLicense">Business License</label> <input type="text" name="bLicense" id="bLicense"
						class="form-control" placeholder="ex.???-??-?????" value="<%=driver.getbLicense()%>"readonly/>
				</div>
				<div class="form-group">
					<label for="carPic">Truck Picture</label><hr>
					<%
						if (fileList != null) { 
								for (int i = 0; i < fileList.size(); i++) {
					%>
				
					<img src="<%=request.getContextPath() %>/images/profile_images/<%=fileList.get(i).getFileName() %>" width="100px" height="100px">
					<%
								}
							}
					%>
					<hr>
				</div>
				<%
					}
				%>
				<div style="text-align: center;">
					<button type="button" onclick="history.back();" class="btn btn-primary">Back</button>
				</div>
			</form>
		</div>
		<div class="col-1"></div>
		<div class="col-2"></div>

	</div>
</div>
<script>

$(document).ready(function (e){
	
	$(document).on("click","img",function(){
		var path = $(this).attr('src')
		showImage(path);
	});//end click event
	
	function showImage(fileCallPath){
	    
	    $(".bigPictureWrapper").css("display","flex").show();
	    
	    $(".bigPicture")
	    .html("<img src='"+fileCallPath+"' >")
	    .animate({width:'100%', height: '100%'}, 1000);
	    
	  }//end fileCallPath
	  
	$(".bigPictureWrapper").on("click", function(e){
	    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
	    setTimeout(function(){
	      $('.bigPictureWrapper').hide();
	    }, 1000);
	  });//end bigWrapperClick event
});
</script>
<style>
		.bigPictureWrapper {
			position: absolute;
			display: none;
			justify-content: center;
			align-items: center;
			top:0%;
			width:100%;
			height:100%;
			background-color: gray; 
			z-index: 100;
			background:rgba(255,255,255,0.5);
		}
		.bigPicture {
			position: relative;
			display:flex;
			justify-content: center;
			align-items: center;
		}
		
		.bigPicture img {
			width:600px;
		}
</style>

<%@ include file="/views/common/footer.jsp"%>
