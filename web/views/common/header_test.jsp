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

<title>Truck ~ ta</title>


</head>

<body>
<%-- class="navbar sticky-top container-fluid d-flex justify-content-center" --%>
<nav class="navbar navbar-expand-sm bg-nav sticky-top">

		<div class="row" style="height: 50; padding: 2 50;">

			<div class="col-xl-1 .d-none .d-sm-block">
				<img
					src="<%=request.getContextPath()%>/images/project_images/t-logo.png"
					alt="logo.png" class="nav-bar" />
			</div>
			<div class="col-xl-2 .d-none .d-sm-block" >


				<p style="font-size: 28px; color: #ffffff;">This is Truckta</p>

			</div>
			<div class="col-xl-6">
				<form>
					<div class="input-group">
						<input type="text" class="form-control header-search-bar"
							placeholder="Input your search_keyword" size="120"
							style="height: 45px;" />
						<div class="input-group-append">
							<button type="button" class="btn btn-bg-color ">검색</button>
						</div>
					</div>
				</form>
			</div>
     
			<div class="col-xl-2" style="display:inline-flex;margin-left:60px;">
      		<button type="button" class="btn btn-bg-color " style="
    width: 100px;
    height: 40px;
    margin-top: 2px;
    margin-right: 10px;">Login</button>
          <button type="button" class="btn btn-bg-color "style="
    width: 100px;
    height: 40px;
    margin-top: 2px;
    margin-right: 10px;">Sign Up</button>
      </div>
      <div class="col-xl-1"></div>
			
		</div>
</nav>
<!-- 
<div class="container">



<div class="jumbotron">
  <h1>Welcome to Truckta</h1>
  <p>Truck-Ta [DEV MODE] uses Account Kit, a Facebook
				technology, to help you sign in. You don't need a Facebook account.
				An SMS or text confirmation may be sent to verify your number.
				Message and data rates may apply. Learn how Facebook uses your info</p>
</div> -->
<%-- </div> --%>