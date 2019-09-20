<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<link href="../../css/clientUpdate-Style.css?ver=1.1" rel="stylesheet" />
<script src="../../js/clientUpdate-js.js?ver=1.1" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/js/signUpDriver-js.js?ver=1.1" charset="utf-8"></script>
<%@ page import="com.truckta.client.model.vo.Client,com.truckta.driver.model.vo.Driver,java.util.List"%>
<%
	request.setCharacterEncoding("UTF-8");
	Client client = (Client) request.getAttribute("client");
	Driver driver = (Driver) request.getAttribute("driver");
	List<String> fileList = (List) request.getAttribute("fileList");
	boolean isDriverView = (boolean) request.getAttribute("isDriverView");
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
					<label for="pw">Pw</label> <input type="password" name="pw" id="pw"
						class="form-control" placeholder="Password" />
				</div>
				<div class="form-group">
					<label for="pwCheck">Pw Check</label> <input type="password"
						name="pwCheck" id="pwCheck" class="form-control"
						placeholder="Password Check" />
				</div>

				<div class="form-group">
					<label for="name">Name</label> <input type="text" name="name"
						id="name" class="form-control" value="<%=client.getName()%>"
						/>
				</div>
				<div class="form-group">
					<label for="name">Email</label> <input type="text" name="email"
						id="email" class="form-control"
						value="<%=client.getEmail()%>" placeholder="EMAIL" />
				</div>
				<div class="form-group">
					<label for="profile">Profile Picture</label> 
					<img src="<%=request.getContextPath() %>/images/profile_images/<%=client.getProfile() %>" width="100px" height="100px">
					<label for="profile">프로필 사진 수정</label> 
					<input type="file"
						name="profile" id="profile"
						class="form-control btn btn-outline-secondary inputFile"
						accept=".jpg, .png, .pdf" />
				</div>
				<div class="form-group form-group-1">
					<%
						if (driver != null && (isDriverView || client.getUserType() == 2)) {
					%>

					<label>Date of Birth</label><br />

					<script>
						createInputDate();
					</script>
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
					<label for="carPic">Truck Picture</label>
					<%
						if (fileList != null) {
								for (int i = 0; i < fileList.size(); i++) {
					%>
					<img src="<%=request.getContextPath() %>/images/profile_images/<%=fileList.get(i) %>" width="100px" height="100px">
					<%
						}
							}
					%>
					<input type="file" name="carPic1" id="carPic1" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<input type="file" name="carPic2" id="carPic2" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<input type="file" name="carPic3" id="carPic3" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<input type="file" name="carPic4" id="carPic4" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<input type="file" name="carPic5" id="carPic5" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />		
				</div>
				<%
					}
				%>
				<div style="text-align: center;">
					<button type="submit" class="btn  btn-primary">Send</button>
				</div>
			</form>
		</div>
		<div class="col-1"></div>
		<div class="col-2"></div>

	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>
