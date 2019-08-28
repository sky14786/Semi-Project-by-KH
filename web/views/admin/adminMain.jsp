<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<style>
.container {
	font-family: "Noto Sans KR", sans-serif;
}
</style>
<div class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="#">관리자</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#">유저관리</a></li>
			<li class="nav-item"><a class="nav-link" href="#">게시글관리</a></li>
			<li class="nav-item"><a class="nav-link" href="#">건의사항</a></li>
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

<div class="container" style="border: 1px solid black; margin-top: 3%">
	<table class="table">
		<thead class="thead-light">
			<th>ID</th>
			<th>NAME</th>
			<th>REGDATE</th>
			<th>MODDATE</th>
			<th>USER_LEVEL</th>
			<th>DETAIL CHECK</th>
		</thead>
		<tbody></tbody>
	</table>
</div>
<style>
.list-padding {
	padding: 10px 5px;
}
</style>
<%@ include file="/views/common/footer.jsp"%>
