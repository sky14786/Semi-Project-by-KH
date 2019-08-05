<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link
	href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap"
	rel="stylesheet" />
<link href="css/sginup_style.css?ver1" rel="stylesheet" />
<link rel="stylesheet" href="css/bootstrap.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	//if (!sessionStorage.getItem("isCertified")) {
	//	alert('비정상적인 접근입니다.');
//	location.href = "signUpMain.html";
//}
</script>
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
			<h2>회원가입</h2>
			<table class="inputTable">
				<tr class="tableTr">
					<td class="tableTd">
						<p class="tablePromptText">아이디</p>

						<form action="driverSignUp.do" method="post" name="sendform"
							enctype="multipart/form-data" onsubmit="return checkData();">
							<input type="text" class="inputBox" maxlength="11" name="id"
								value="<%=id%>" readonly />
					</td>
				</tr>

				<tr class="tableTr">
					<td class="tableTd">
						<p class="tablePromptText">비밀번호 (영문 대소문자, 숫자로 8~14자)</p> <input
						type="password" class="inputBox" maxlength="12" name="pw" />
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
						class="inputBox" maxlength="5" name="name" />
					</td>
				</tr>

				<tr class="tableTr">
					<td class="tableTd">
						<p class="tablePromptText">생년월일</p>
						<p class="inputBox">
							<script language="javascript">
								var today = new Date();
								var toyear = parseInt(today.getYear());
								var start = toyear + 1900;
								var end = toyear - 70 + 1900;

								document.write("<font size=2><select name=birth1>");
								document.write("<option value='' selected>");
								for (i = start; i >= end; i--)
									document.write("<option>" + i);
								document.write("</select>년  ");

								document.write("<select name=birth2>");
								document.write("<option value='' selected>");
								for (i = 1; i <= 12; i++)
									document.write("<option>" + i);
								document.write("</select>월  ");

								document.write("<select name=birth3>");
								document.write("<option value='' selected>");
								for (i = 1; i <= 31; i++)
									document.write("<option>" + i);
								document.write("</select>일  </font>");
							</script>
						</p>
					</td>
				</tr>

				<tr class="tableTr">
					<td class="tableTd">
						<p class="tablePromptText">차종</p> <input type="text"
						class="inputBox" name="carType" />
					</td>
				</tr>

				<tr class="tableTr">
					<td class="tableTd">
						<p class="tablePromptText">면허증</p> <input type="file"
						accept=".jpg, .png, .pdf"
						class="fileBtn btn btn-outline-secondary" id="dLicnese"
						name="dLicense" />
					</td>
				</tr>

				<tr class="tableTr">
					<td class="tableTd">
						<p class="tablePromptText">사업자등록증</p> <input type="file"
						accept=".jpg, .png, .pdf"
						class="fileBtn btn btn-outline-secondary" id="bLicense"
						name="bLicense" />
					</td>
				</tr>

				<tr class="tableTr">
					<td class="tableTd">
						<p class="tablePromptText">차사진</p> <input type="file"
						accept=".jpg, .png, .pdf"
						class="fileBtn btn btn-outline-secondary" id="carPic"
						name="carPic" />
					</td>
				</tr>

				<tr>
					<td class="lastTd"><input type="checkbox" name="isAgree"
						class="radioAgree" />
						<p class="radioText">이용약관에 동의합니다.</p></td>
				</tr>

				<tr>
					<td class="lastTd" colspan="2"><input type="submit"
						class="submit" value="회원가입" />
						</form></td>
				</tr>
			</table>
		</div>
		<!-- <div id="sidebar-right"></div> -->
		<div id="footer">
			<h1>copyright</h1>
		</div>
	</div>

	<script tpye="text/javascript">
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

			if (!($('input[name=birth1]').val()
					|| $('input[name=birth2]').val() || $('input[name=birth3]')
					.val())) {
				alert('생년월일을 입력해 주세요.');
				return false;
			}

			if (!$('input[name=bLicense]').val()) {
				alert('사업자등록증을 등록해 주세요.');
				return false;
			}

			if (!formatChecking.test($('input[name=bLicense]').val()
					.toLowerCase())) {
				alert('사업자등록증의 확장자를 확인해 주세요. [pdf,jpg,jpeg,png]');
				$('input[name=dLicense]').val('');
				return false;
			}

			if ($('input[name=bLicense]').val()) {
				var size = document.getElementById("bLicense").files[0].size;
				if (sizeChecking < size) {
					alert('사업자등록증의 용량을 확인해 주세요. [3MB]');
					$('input[name=bLicense]').val('');
					return false;
				}
			}

			if (!$('input[name=dLicense]').val()) {
				alert('면허증을 등록해 주세요.');
				return false;
			}

			if (!formatChecking.test($('input[name=dLicense]').val()
					.toLowerCase())) {
				alert('면허증의 확장자를 확인해 주세요. [pdf,jpg,jpeg,png]');
				$('input[name=dLicense]').val('');
				return false;
			}

			if ($('input[name=dLicense]').val()) {
				var size = document.getElementById("dLicense").files[0].size;
				if (sizeChecking < size) {
					alert('사업자등록증의 용량을 확인해 주세요. [3MB]');
					$('input[name=dLicense]').val('');
					return false;
				}
			}

			if ($('input[name=carPic]').val()) {
				if (!formatChecking.test($('input[name=carPic]').val()
						.toLowerCase())) {
					alert('차사진의 확장자를 확인해 주세요. [pdf,jpg,jpeg,png]');
					$('input[name=carPic]').val('');
					return false;
				}
			}

			if ($('input[name=carPic]').val()) {
				var size = document.getElementById("carPic").files[0].size;
				if (sizeChecking < size) {
					alert('차사진의 용량을 확인해 주세요. [3MB]');
					$('input[name=carPic]').val('');
					return false;
				}
			}

			if (!$('input:checkbox[name=isAgree]').is(':checked')) {
				alert('이용약관에 동의해 주세요.');
				return false;
			}
			sessionStorage.removeItem("isCertified");
		}
	</script>
</body>
</html>
