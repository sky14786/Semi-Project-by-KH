<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link href="../../css/signUpClient-Style.css?ver=1.1" rel="stylesheet" />
<script src="../../js/signUpClient-js.js?ver=1.1" charset="utf-8"></script>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("phone_number");
%>
<div class="container">
	<br /> <br /> <br />
	<div class="row">
		<div class="col-xl-2"></div>
		<div class="col-xl-8">
			<h2>Client Sign Up</h2>
			<form action="/clientSignUp.do" method="post" name="sendform"
				enctype="multipart/form-data">
				<!-- onsubmit="return checkData();" -->
				<div class="form-group">
					<label for="id">Id</label> <input type="text" name="id" id="id"
						class="form-control" placeholder="Phone Number" <%--   value="<%=id%>"
                readonly --%>
              />
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
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
		<div class="col-xl-2"></div>
	</div>
</div>
<%@ include file="/views/common/footer.jsp"%>
