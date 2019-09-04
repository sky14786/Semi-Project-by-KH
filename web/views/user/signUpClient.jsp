<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<!--[Start Import ] This Page Import Script and External Library -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet" />
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/header.css?var=1.1"
	rel="stylesheet" />
<!-- [End Import] -->
<link href="../../css/signUpClient-Style.css?ver=1.1" rel="stylesheet" />
<script src="../../js/signUpClient-js.js?ver=1.1" charset="utf-8"></script>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("phone_number");
%>
<%-- <div class="container"> --%>
	<!-- <br /> <br /> <br /> -->

<title>Truck ~ ta</title>
<script>
	//certifiedCheck();
</script>
</head>

<body>
	<div class="container">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-1"></div>
		<div class="col-6"><br><br><br><br>
			<h2>Sign Up</h2><hr>
			<form action="/clientSignUp.do" method="post" name="sendform"
				enctype="multipart/form-data">
				<!-- onsubmit="return checkData();" -->
				<div class="form-group">
					<label for="id">ID</label> <input type="text" name="id" id="id"
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
				<div style="text-align:center;">
					<button type="submit" class="btn  btn-primary">Submit</button>
				</div>
			</form>
		</div>
		<div class="col-1"></div>
		<div class="col-2"></div>
		
	</div>
</div>
</div>
<%@ include file="/views/common/footer.jsp"%>
