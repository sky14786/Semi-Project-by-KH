<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 	//String searchType=(String)request.getAttribute("searchType");
 	//String searchKey=(String)request.getAttribute("searchKeyword");
 %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<!-- [Start Import]This Page import Script and external library -->
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>

	<link href="css/nav_style.css" rel="stylesheet">

	<script src="https://use.fonta

	wesome.com/releases/v5.0.8/js/all.js"></script>
		<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
		integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />


<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<title>Truckta Sign Up</title>
</head>
<style>
	.container {
		font-family: "Noto Sans KR", sans-serif;
	}

	.container>h1 {
		margin-top: 10px;
		margin-left: 50px;
		text-align: left;
	}

	.row>.col-xl-10>div {
		text-align: center;
		color: #333;
		margin-bottom: 60px;
		font-size: 18px;

	}

	.content_margin {
		margin-top: 30px;
	}

	.form-style {
		text-align: center;
	}

	.form-style>.form-group>label {
		font-size: 30px;
	}

	.div_resize {
		width: 10%;
		height: 10%;
		float: left;
		margin: 2em;
	}

	.footer {
		text-align: center;
		background-color: #4340c3;
	}

	.but_1:hover {
		box-shadow: 3px 3px 3px 3px gray;
		background-color: #D3D3D3;
	}

	img {
		max-width: 100%;
		/* 이미지의 최대사이즈 */
		width
		/***/
		: auto;
		/* only IE8 */
		height: auto;
		vertical-align: bottom;
	}

	.but_1 {
		background-color: #D3D3D3;
	}

	footer>div>p {
		margin: 0em;

	}

	#other {
		text-align: center;
	}

	.loginbtn {
		float: right;
	}

	.search_1 {
		padding: 0px 12px 0px 12px;
	}
	/* 달력 */
	a#calendar, a.calendar {
	overflow: hidden;
    display: inline-block;
	background: url(https://farm4.staticflickr.com/3854/14472313019_867d34c90c_s.jpg) no-repeat;
    background-size: 32px;
	text-indent: -2000em;
	}
	.ui-datepicker-trigger{display: none;}
</style>

<body>

	<nav class="navbar sticky-top container-fluid d-flex justify-content-center" name="top-nav" id="top-nav">
		<div class="input-group">
			<img src="./t-logo-png-twitter-logo-18.png" alt="logo.png" class="front-logo" id="logo" />
			<p>&nbsp&nbsp</p>
			<!-- search bar -->
			<form action="<%=request.getContextPath() %>/main/mainFinder">
			<input type="text" class="form-control rounded search-bar" placeholder="Search" name="searchKeyword" aria-label="Small"
				aria-describedby="inputGroup-sizing-sm" id="search-bar" value="search">
				<button class="btn btn-warning btn-lg" type="submit">
					<i class="fas fa-search"></i></button>
				<button class="btn btn-light btn-lg" onclick="redirect();">
					<i class="fas fa-envelope"></i></button>
				</form>
			<p>&nbsp&nbsp</p>
			<div class="navbar-right btn btn-xs">
			<!--  버튼원래위치-->
				<a href="#" class="btn btn-secondary btn-lg active loginbtn" role="button" aria-pressed="true">회원가입</a>
				<a href="#" class="btn btn-secondary btn-lg active loginbtn" role="button" aria-pressed="true">로그인</a>
			</div>
		</div>
	</nav>
	
		<script>

		var count = 0;
		$(function () {
			$('.trg').on('bt', function () {
				count++;
				$('#sp_1').html(count);
			})
			$(".but_1").click(function () {

				$('.trg').trigger("bt");
			});
		});

		
	</script>