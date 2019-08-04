<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />

<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet" />
<link href="css/sginup_style.css" rel="stylesheet" />
<link rel="stylesheet" href="css/bootstrap.css" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<title>Truck~ta Sign up Page</title>
</head>

<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("phone_number");
	%>
	<div id="container">
		<div id="header">
			<h1>Truck~ta</h1>
		</div>
		<!-- <div id="sidebar-left"></div> -->
		<div id="content">
			<br /> <br />
			<h2>회원가입</h2>
			<form action="clientJoin.do" method="post" name="frm"
				enctype="multipart/form-data" onsubmit="return checkData();">
				<table class="inputTable">
					<tr class="tableTr">
						<td class="tableTd">
							<p class="tablePromptText">아이디</p> <input type="text"
							class="inputBox" name="id" maxlength="11" value="<%=id%>"
							readonly />
						</td>
					</tr>

					<tr class="tableTr">
						<td class="tableTd">
							<p class="tablePromptText">비밀번호 (영문 대소문자,숫자 8~14자)</p> <input
							type="password" class="inputBox" name="pw" maxlength="12" />
						</td>
					</tr>

					<tr class="tableTr">
						<td class="tableTd">
							<p class="tablePromptText">비밀번호확인</p> <input type="password"
							class="inputBox" maxlength="12" name="pwCheck" />
						</td>
					</tr>

					<tr class="tableTr">
						<td class="tableTd">
							<p class="tablePromptText">이름</p> <input type="text"
							class="inputBox" name="name" maxlength="5" />
						</td>
					</tr>

					<tr class="tableTr">
						<td class="tableTd">
							<p class="tablePromptText">프로필사진</p> <input type="file"
							accept=".jpg, .png, .pdf"
							class="fileBtn btn btn-outline-secondary" name="profile"
							id="profile" />
						</td>
					</tr>

					<tr>
						<td class="lastTd"><input type="checkbox" name="isAgree"
							class="radioAgree" />
							<p class="radioText">이용약관에 동의합니다.</p></td>
					</tr>

					<tr>
						<td class="lastTd" colspan="2"><input type="submit"
							class="submit" value="회원가입" /></td>
					</tr>
				</table>
			</form>
		</div>
		<!-- <div id="sidebar-right"></div> -->
		<div id="footer">
			<h1>copyright</h1>
		</div>
	</div>

	<script type="text/javascript">
		function checkData() {
			//조건1. 8~14 영문 대소문자
			//조건2. 최소 1개의 숫자 혹은 특수 문자를 포함해야 함
			var pwChecking = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,14}$/;
			var idChecking = /[^0-9]/g;
			var formatChecking = /\.(jpg|pdf|jpeg|png)$/i;
			var sizeChecking = 1024 * 1024 * 3;

			if (idChecking.test($('input[name=id]').val())
					|| !$('input[name=id]').val()) {
				alert('아이디가 정상적이지 못합니다.');
				return false;
			}

			if (!pwChecking.test($('input[name=pw]').val())) {
				alert('비밀번호는 8~14자 영소문자,대문자로 이루어져 있습니다.');
				return false;
			}

			if ($('input[name=pw]').val() != $("input[name=pwCheck]").val()) {
				alert('비밀번호가 일치하지 않습니다.');
				$("input[name=pwCheck]").val('');
				return false;
			}

			if (!$('input[name=name]').val()) {
				alert('이름을 입력해 주세요.');
				return false;
			}

			if ($('input[name=profile]').val()) {
				if (!formatChecking.test($('input[name=profile]').val()
						.toLowerCase())) {
					alert('프로필사진의 확장자를 확인해 주세요. [pdf,jpg,jpeg,png]');
					$('input[name=profile]').val('');
					return false;
				}
			}

			if ($('input[name=profile]').val()) {
				var size = document.getElementById("profile").files[0].size;
				if (sizeChecking < size) {
					alert('프로필사진의 용량을 확인해 주세요. [3MB]');
					$('input[name=profile]').val('');
					return false;
				}
			}

			if (!$('input:checkbox[name=isAgree]').is(':checked')) {
				alert('이용약관에 동의해 주세요.');
				return false;
			}

		}
	</script>
</body>
</html>
