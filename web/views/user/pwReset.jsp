<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
<link href="../../css/resetPassword-Style.css?ver=1.1" rel="stylesheet" />
<script src="../../js/signUpMain-js.js?ver=1.1" charset="utf-8"></script>
<div class="container">
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="row">
		<div class="col-xl-1"></div>
		<div class="col-xl-5 left-image d-none d-sm-block">
			<img src="../../images/project_images/ResetPassword-Thumbnail.jpg" alt=""
				class="img-thumbnail" />
		</div>
		<div class="col-xl-5 right-input">
			<h2>You can reset your password</h2>
			<br />
			<br />
			<form action="<%=request.getContextPath()%>/pwreset.do"
				method="post">
				<div class="form-group">
					<label for="password">Please enter a password to reset</label> <input
						type="password" name="password" id="password" class="form-control"
						placeholder="********" />
				</div>
				<div class="form-group">
					<label for="password_check">Password Check</label> <input
						type="password" name="password_check" id="password_check"
						class="form-control" placeholder="********" />
				</div>

				<br />
				<button type="submit" class="btn btn-primary btn-submit">Reset
					Password</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="/views/common/footer.jsp"%>