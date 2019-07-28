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
			<br />
			<br />
			<h2>회원가입</h2>
			<form action="ClientJoin.do" method="post" name="frm">
				<table class="inputTable">
					<tr class="tableTr">
						<td class="tableTd">
							<p class="tablePromptText">아이디</p> <input type="text"
							class="inputBox" name="id" maxlength="11" value="<%=id%>" READONLY/>
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
							class="inputBox" maxlength="12" />
						</td>
					</tr>

					<tr class="tableTr">
						<td class="tableTd">
							<p class="tablePromptText">이름</p> <input type="text"
							class="inputBox" name="name" maxlength="5" />
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
</body>
</html>
