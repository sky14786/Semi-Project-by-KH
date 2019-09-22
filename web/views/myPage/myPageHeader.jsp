<%@page import="com.truckta.client.model.vo.Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	Client cl = new Client();
	if((Client)session.getAttribute("loginClient")!=null){
		cl = (Client)session.getAttribute("loginClient");
	}
	
	/* Client cl = new Client();
	if((Client)request.getAttribute("client") != null){
		cl = (Client)request.getAttribute("client");
	}else{
		response.sendRedirect("/");
	} */
%>
<!-- <!DOCTYPE html> -->
<div class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="<%=request.getContextPath()%>/my/pageTop">My Page</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
			<!-- 유저 메뉴 -->
			<% if(cl.getUserType()==1){ %>
			<li class="nav-item"><a class="nav-link" href="#">유저 정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/my/mySchedule.do">운송 정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/my/pageTop">현재 정보</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/userToDriver">기사신청 </a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Q&A</a>
				<div class="dropdown-menu">
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/board/boardQnaQList">질문게시판</a>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/board/boardQnaQList">건의게시판</a>
					<a class="dropdown-item" href="#">신고게시판</a>
				</div>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/board/pageLoad">배송 요청하기</a></li>
			<%} %>
			<!-- 기사 메뉴 -->
			<% if(cl.getUserType()==2){ %>
			<li class="nav-item"><a class="nav-link" href="#">기사 정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/my/pageScheduleDriver.do">운송 정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/my/pageTopDriver">현재 정보</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Q&A</a>
				<div class="dropdown-menu">
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/board/boardQnaQList">질문게시판</a>
					<a class="dropdown-item"
						href="<%=request.getContextPath()%>/board/boardQnaQList">건의게시판</a>
					<a class="dropdown-item" href="#">신고게시판</a>
				</div>
			</li>
			<%} %>
		</ul>

	</div>
</div>