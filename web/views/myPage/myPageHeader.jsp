<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="<%=request.getContextPath()%>/my/pageTop">My Page</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="#">유저/기사 정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/my/mySchedule.do">운송 정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/my/pageTop">현재 정보</a></li>
			<li class="nav-item"><a class="nav-link" href="#">기사신청 </a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Q&A</a>
				<div class="dropdown-menu">
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/board/boardQnaQList">질문게시판</a>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/board/boardQnaQList">건의게시판</a>
					<a class="dropdown-item" href="#">신고게시판</a>
				</div></li>
		</ul>

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
			<button type="button" class="btn board-upload">
				<a class='boardUpload'href="<%=request.getContextPath()%>/board/pageLoad">글올리기</a>
			</button>
		</form>

	</div>
</div>