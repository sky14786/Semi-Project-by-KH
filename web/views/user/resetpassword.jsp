<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<link href="../../css/resetPassword-Style.css?ver=1.1" rel="stylesheet" />
<script src="../../js/signUpMain-js.js?ver=1.1" charset="utf-8"></script>
<div class="container">
	<br /> <br /> <br /> <br /> <br /> <br />
	<div class="row">
		<div class="col-xl-1"></div>
		<div class="col-xl-5 left-image d-none d-sm-block">
			<img
				src="../../images/project_images/ResetPassword-Thumbnail.jpg"
				alt="" class="img-thumbnail" />
		</div>
		<div class="col-xl-5 right-input">
			<h2>forgot your Password?</h2>
			<br /> <br />
			<form action="" method="post">
				<div class="form-group">
					<label for="userName">Input Your Name</label> <input type="text"
						name="userName" id="userName" class="form-control"
						placeholder="XXX" />
				</div>
				<div class="form-group">
					<label for="phone_number">Input Your Phone Number</label> <input
						type="text" name="phone_number" id="phone_number"
						class="form-control" placeholder="010-XXXX-XXXX" />
				</div>

				<button type="submit" class="btn btn-primary btn-submit">Find
					Password</button>
			</form>
		</div>
	</div>
</div>
<%@ include file="/views/common/footer.jsp"%>
