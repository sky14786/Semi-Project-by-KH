<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<!-- <link href="../../css/clientUpdate-Style.css?ver=1.1" rel="stylesheet" />
<script src="../../js/clientUpdate-js.js?ver=1.1" charset="utf-8"></script> -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/signUpDriver-Style.css?ver=1.1" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/js/adminUpdateUser-js.js?ver=1.3" charset="utf-8"></script>
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
			<input type="hidden" name = "isChecking" value = "<%=isDriverView %>" readonly/>
			<input type="hidden" name = "isDriver" value = "<%=client.getUserType() %>" readonly/>
			<form
				action="<%=request.getContextPath()%>/admin/adminUserUpdate"
				method="post" name="sendform" enctype="multipart/form-data">
				<!-- onsubmit="return checkData();" -->
				<div class="form-group">
					<label for="id">ID</label> <input type="text" name="id" id="id"
						class="form-control" value="<%=client.getId()%>" readonly/>
				</div>
				<div class="form-group">
					<label for="name">Name</label> <input type="text" name="name"
						id="name" class="form-control" value="<%=client.getName()%>"
						/>
				</div>
				<div class="form-group">
					<label for="name">Email</label> <input type="text" name="email"
						id="email" class="form-control"
						value="<%=client.getEmail()%>" placeholder="EMAIL"  />
				</div>
				<div class="form-group">
					<%
						if (client.getProfile() != null) {
					%>
						<label for="profile">Profile Picture</label><hr>
						<img name="img_org_profile" src="<%=request.getContextPath() %>/images/profile_images/<%=client.getProfile() %>" width="400px" height="300px">
						<br><br>
						<button type="button" onclick="deleteProfileImg();" class="btn btn-primary">삭제</button>
						<button type="button" onclick="cancelProfileImg('<%=request.getContextPath() %>/images/profile_images/<%=client.getProfile() %>','<%=client.getProfile() %>');" class="btn btn-primary">취소</button>
						<hr>
						<input type="hidden" name ="org_profile" id="org_profile" value="<%=client.getProfile() %>">
						<input type="file" name="profile" id="profile" class="form-control btn btn-outline-secondary inputFile" 
								accept=".jpg, .png, .pdf" style="margin-top: 5px; "/>
						
						<hr>
					<%
						} else {
					%>
							<input type="file" name="profile" id="profile" class="form-control btn btn-outline-secondary inputFile" 
								accept=".jpg, .png, .pdf" style="margin-top: 5px;"/>
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
						if (driver != null && client.getUserType() == 2) {
					%>

					<label>Date of Birth</label><br />

					<input type="text" name="dateOfBirth" id="dateOfBirth"
						class="form-control"  value="<%=driver.getDateOfBirth()%>"/>
				</div>
					<div class="form-group">
					<label for="carType">Truck Category</label><br /> <select
						name="carType" id="carType"class="custom-select-sm select-cartype-input">
						<%
							for (CarType ct : carTypeList) {
									if (ct.getTypeNo() == driver.getCarType()) {
						%>
						<option value="<%=ct.getTypeNo() %>" selected><%=ct.getCarType() %></option>
						<%
							} else {
						%>
						<option value="<%=ct.getTypeNo() %>"><%=ct.getCarType() %></option>

						<%
							}
								}
						%>
					</select>
				</div>
				
				<div class="form-group">
					<label for="dLicense">Driver License</label> <input type="text" name="dLicense" id="dLicense"
						class="form-control" placeholder="ex.??-??-??????-??" value="<%=driver.getdLicense()%>"/>
				</div>
				<div class="form-group">
					<label for="bLicense">Business License</label> <input type="text" name="bLicense" id="bLicense"
						class="form-control" placeholder="ex.???-??-?????" value="<%=driver.getbLicense()%>"/>
				</div>
				<div class="form-group">
					<label for="carPic">Truck Picture</label><hr>
					<%
						if (fileList != null) {
								for (int i = 0;i < 5; i++) {
									if(i<fileList.size()&&fileList.get(i)!=null){
					%>
				
					<img name="img_org_carPic<%=i+1 %>" src="<%=request.getContextPath() %>/images/profile_images/<%=fileList.get(i).getFileName() %>" width="100px" height="100px">
					<input type="hidden" name="org_carPic<%=i+1 %>" id="org_carPic<%=i+1 %>"  value="<%=fileList.get(i).getFileName() %>" />
					<button type="button" onclick="deleteImg('org_carPic<%=i+1 %>');" class="btn btn-primary">삭제</button>
					<button type="button" onclick="cancelImg('org_carPic<%=i+1 %>','<%=request.getContextPath() %>/images/profile_images/<%=fileList.get(i).getFileName() %>','<%=fileList.get(i).getFileName() %>');" class="btn btn-primary">취소</button>
					<%
									} 
					%>	
					<input type="file" name="carPic<%=i+1 %>" id="carPic<%=i+1 %>" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<br/><hr>
					<%
								}
						}else {
					%>
						<input type="file" name="carPic1" id="carPic1" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
						<input type="file" name="carPic2" id="carPic2" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
						<input type="file" name="carPic3" id="carPic3" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
						<input type="file" name="carPic4" id="carPic4" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
						<input type="file" name="carPic5" id="CarPic5" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<br/><hr>
					<%
						}
					%>
					
				
				</div>
				<%
					}
				%>
				<div style="text-align: center;">
					<button type="submit" onclick="checkData();" class="btn btn-primary">수정</button>
					<button type="button" onclick="history.back();" class="btn btn-primary">뒤로</button>
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

function deleteImg(img){
	$("img[name=img_"+img+"]").attr("src","");
	$("input[name="+img+"]").val("null");
	
}
function cancelImg(img,src,name){
	$("img[name=img_"+img+"]").attr("src",src);
	$("input[name="+img+"]").val(name);
}

function deleteProfileImg(){
	$("img[name=img_org_profile]").attr("src","");
	$("input[name=org_profile]").val("null");
	
}
function cancelProfileImg(src,name){
	$("img[name=img_org_profile]").attr("src",src);
	$("input[name=org_profile]").val(name);
}
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
