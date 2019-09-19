<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="#">My Page</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">

			<li class="nav-item"><a class="nav-link" href="#">유저/기사
					정보</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/my/mySchedule.do">운송
					정보</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/my/pageTop">현재
					정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="#">기사신청
			</a></li>
		</ul>

		&nbsp;&nbsp;

	</div>
</div>