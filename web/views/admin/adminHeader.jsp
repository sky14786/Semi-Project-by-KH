<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="#">관리자</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
		
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">유저관리</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/adminClientList">일반유저</a>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/adminDriverList">기사관리</a>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/driverApproval">기사신청관리</a>
					</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Q&A</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/adminQnaQList">질문관리</a>
						<a class="dropdown-item" href="#">건의관리</a>
						<a class="dropdown-item" href="#">신고관리</a>
					</div>
			</li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminBoardMatchingList">게시글관리</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminCarTypeList">운송수단관리</a></li>
		</ul>
		
		&nbsp;&nbsp;
		<form action="" method="post" class="form-inline">
			<select id="searchType" name="searchType"
				class="custom-select form-control">
				<option selected>Type</option>
				<option value="id">아이디</option>
				<option value="name">이름</option>
				<option value="level">권한</option>
			</select> &nbsp; &nbsp; &nbsp; <input class="form-control" type="text" name=""
				id="" placeholder="Keyword" />
			<button type="submit" class="btn btn-success">검색</button>
		</form>
	</div>
</div>
