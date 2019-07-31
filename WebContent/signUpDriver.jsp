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
<link href="css/sginup_style.css" rel="stylesheet" />
<link rel="stylesheet" href="css/bootstrap.css" />
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
			<table class="inputTable">
				<tr class="tableTr">
					<td class="tableTd">
						<p class="tablePromptText">아이디</p>
						<form action="driverSignUp.do" method="post" name="sendform"
							enctype="multipart/form-data">
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

								document
										.write("<font size=2><select name=birth1>");
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
						class="fileBtn btn btn-outline-secondary" name="dLicense" />
					</td>
				</tr>

				<tr class="tableTr">
					<td class="tableTd">
						<p class="tablePromptText">사업자등록증</p> <input type="file"
						accept=".jpg, .png, .pdf"
						class="fileBtn btn btn-outline-secondary" name="bLicense" />
					</td>
				</tr>

				<tr class="tableTr">
					<td class="tableTd">
						<p class="tablePromptText">차사진</p> <input type="file"
						accept=".jpg, .png, .pdf"
						class="fileBtn btn btn-outline-secondary" name="carPic" />
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
</body>
</html>
