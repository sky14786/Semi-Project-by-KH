<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>	

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("phone_number");
%>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/signUpDriver-Style.css?ver=1.1" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/js/signUpDriver-js.js?ver=1.1" charset="utf-8"></script>


<script>
	//certifiedCheck();
</script>



<div class="container">
	
	<div class="row">
		<div class="col-2"></div>
		<div class="col-1"></div>
		<div class="col-6">
		<br><br><br><br>
			<h2>Driver Sign Up</h2><hr>
			<form action="/driverSignUp.do" method="post" name="sendform"
				enctype="multipart/form-data" onsubmit="return checkData();">
				<div class="form-group">
					<label for="id">Id</label> <input type="text" name="id" id="id"
						class="form-control" placeholder="Phone Number" value="<%=id%>"
						readonly />
				</div>
				<div class="form-group form-group-1">
					<label>Date of Birth</label><br />

					<script>
						createInputDate();
					</script>
				</div>
				<div class="form-group">
					<label for="carType">Truck Category</label><br /> <select
						name="carType" class="custom-select-sm select-cartype-input">
						<option value="1" selected>~1t</option>
						<option value="2" selected>1~1.5t</option>
						<option value="3" selected>1.5~3t</option>
						<option value="4" selected>3t~</option>
					</select>
				</div>

				<div class="form-group">
					<label for="dLicense">Driver License</label> <input type="file"
						name="dLicense" id="dLicense"
						class="form-control btn btn-outline-secondary inputFile"
						accept=".jpg, .png, .pdf" />
				</div>
				<div class="form-group">
					<label for="bLicense">Business License</label> <input type="file"
						name="bLicense" id="bLicense"
						class="form-control btn btn-outline-secondary inputFile"
						accept=".jpg, .png, .pdf" />
				</div>
				<div class="form-group">
					<label for="carPic">Truck Picture</label> <input type="file"
						name="carPic" id="carPic"
						class="form-control btn btn-outline-secondary inputFile"
						accept=".jpg, .png, .pdf" />
				</div>
				<div class="form-group form-check">
					<label for="isAgree" class="form-check-label"> <input
						type="checkbox" name="isAgree" id="isAgree" />&nbsp;&nbsp;Agree
					</label>
				</div>
				<div style="text-align:center;">
				<button type="submit" class="btn btn-primary">Send</button>
				</div>
			</form>
		</div>
		<div class="col-1"></div>
		<div class="col-2"></div>
	</div>
</div>
<%@ include file="/views/common/footer.jsp"%>
