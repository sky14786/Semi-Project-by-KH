
<%@page import="com.truckta.client.model.vo.Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	Client cl = new Client();
	if((Client)session.getAttribute("loginClient")!=null){
		cl = (Client)session.getAttribute("loginClient");
	}
	System.out.println("userType : "+cl.getUserType());
%>
<style>
.myheader {
	margin-top: 60px;
}

.navbar-brand {
	padding: 0px;
	width: 67px !important;
}
</style>
<!-- <!DOCTYPE html> -->
<div class="navbar navbar-expand-sm bg-dark navbar-dark myheader ">

	<% if(cl.getUserType()==1){ %>
	<a class="navbar-brand" href="<%=request.getContextPath()%>/my/pageTop">My
		Page</a>
	<%}else{ %>
	<a class="navbar-brand"
		href="<%=request.getContextPath()%>/my/pageTopDriver">My Page</a>
	<%} %>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
			<!-- 유저 메뉴 -->
			<% if(cl.getUserType()==1){ %>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/mypageUserLoad">유저 정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/my/mySchedule.do">운송 정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/my/pageTop">현재 정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/userToDriver">기사신청 </a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/board/boardQnaQList?id=<%=cl.getId()%>">Q&A
			</a></li>

			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/board/pageLoad">배송 요청하기</a></li>
			<%} %>
			<!-- 기사 메뉴 -->
			<% if(cl.getUserType()==2){ %>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/mypageUserLoad">기사 정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/my/pageScheduleDriver">운송 정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/my/pageTopDriver">현재 정보</a></li>
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/board/boardQnaQList?id=<%=cl.getId()%>">Q&A
			</a></li>

			<%} %>
		</ul>

	</div>
</div>