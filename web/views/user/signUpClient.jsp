<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<link href="../../css/signUpClient-Style.css?ver=1.1" rel="stylesheet" />
<script src="../../js/signUpClient-js.js?ver=1.5" charset="utf-8"></script>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("phone_number");
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
		<div class="col-6"><br><br><br><br>
			<h2>Sign Up</h2><hr>
			<form action="<%=request.getContextPath() %>/clientSignUp" method="post" name="sendform"
				onsubmit= "return checkData();"enctype="multipart/form-data">
				<!-- onsubmit="return checkData();" -->
				<div class="form-group">
					<label for="id">ID</label> <input type="text" name="id" id="id"
						class="form-control" placeholder="Phone Number" <%-- value="<%=id%>"
						readonly --%>  />
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
						id="name" class="form-control" placeholder="NAME" />
				</div>
				<div class="form-group">
					<label for="name">Email</label> <input type="text" name="email"
						id="email" class="form-control" placeholder="EMAIL" />
				</div>
				<div class="form-group">
					<label for="profile">Profile Picture</label> <input type="file"
						name="profile" id="profile"
						class="form-control btn btn-outline-secondary inputFile"
						accept=".jpg, .png, .pdf" />
				</div>
				<div class="form-group form-check">
					<label for="isAgree" class="form-check-label"> <input
						type="checkbox" name="isAgree" id="isAgree" />&nbsp;&nbsp;Agree
					</label>
				</div>
				<div style="text-align:center;">
					<button type="submit" class="btn  btn-primary">Send</button>
				</div>
			</form>
		</div>
		<div class="col-1"></div>
		<div class="col-2"></div>
		
	</div>
</div>
</div>
<%@ include file="/views/common/footer.jsp"%>
