<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	String id = (String) request.getParameter("id");
%>
<link href="../../css/resetPassword-Style.css?ver=1.1" rel="stylesheet" />
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
			<img style ="height:525px;" src="<%=request.getContextPath() %>/images/project_images/ResetPassword-Thumbnail.jpg" alt=""
				class="img-thumbnail" width="435px" height="525px" />
		</div>
		<div class="col-xl-5 right-input">
			<h2>You can reset your password</h2>
			<br />
			<br />
			<form action="<%=request.getContextPath()%>/user/resetPassword"
				method="post" onsubmit="checkDate(); return false;">
				<input type="hidden" name="id" id="id" value="<%=id%>">
				<div class="form-group">
					<label for="key">Enter your Key</label> <input
						type="text" name="key" id="key" class="form-control"
						/>
				</div>
				<div class="form-group">
					<label for="password">Please enter a password to reset</label> <input
						type="password" name="pw" id="pw" class="form-control"
						placeholder="********" />
				</div>
				<div class="form-group">
					<label for="password_check">Password Check</label> <input
						type="password" name="pwCheck" id="pwCheck"
						class="form-control" placeholder="********" />
				</div>

				<br />
				<button type="submit" class="btn btn-primary btn-submit">Reset
					Password</button>
			</form>
		</div>
	</div>
</div>
<script>

function checkDate(){
	var pwChecking = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,14}$/;

	if(!($("input[name=[key]]").va())){
		alert("인증번호를 입력해 주세요.");
		return false;
	}

	if(!($("input[name=pw]").va())){
		alert("비밀번호를 입력해 주세요.");
		return false;
	}

	if(!($("input[name=pwCheck]").va())){
		alert("비밀번호 확인란을 입력해 주세요.");
		return false;
	}

	if (!pwChecking.test($("input[name=pw]").val())) {
		alert("비밀번호는 8~14자 영소문자,대문자로 이루어져 있습니다.");
		return false;
	}

	if (!pwChecking.test($("input[name=pwCheck]").val())) {
		alert("비밀번호는 8~14자 영소문자,대문자로 이루어져 있습니다.");
		return false;
	}

	if ($("input[name=pw]").val() != $("input[name=pwCheck]").val()) {
		alert("비밀번호가 일치하지 않습니다.");
		$("input[name=pwCheck]").val("");
		return false;
	}
	
	return true;
}


</script>
<%@ include file="/views/common/footer.jsp"%>