<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.truckta.client.model.vo.Client" %>

<%
	List<Client> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>
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
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminClientList">유저관리</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminBoardMatchingList">게시글관리</a></li>
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

<div class="container-fluid" style="margin-top: 3%">
	<table class="table">
		<thead class="thead-light">
			<tr style="text-align:center;">
				<th>ID</th>
				<th>이름</th>
				<th>가입일</th>
				<th>수정일</th>
				<th>유저권한</th>
				<th>프로필사진</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody>
			<%if(list!=null){ 
				for(Client c : list){
			%>
					<tr style="text-align:center;">
						<td><%=c.getId() %></td>
						<td><%=c.getName() %></td>
						<td><%=c.getRegDate() %></td>
						<td><%=c.getModDate() %></td>
						<td><%if(c.getUserType()==1){%>
								일반회원
							<%}else if(c.getUserType()==2) {%>
								기사회원
							<%}else if(c.getUserType()==3) {%>
								관리자
							<%} %>						
						</td>
						<%if(c.getProfile()!=null){ %>
							<td><img src="<%=request.getContextPath()%>/images/project_images/file.png"></td>
						<%}else { %>
							<td>[등록안함]</td>
						<%} %>
						<td>
						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">보기</button>
						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">수정</button>
						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">삭제</button>
						</td>
						
				</tr>
			<%	}
			}%>
		</tbody>
	</table>
	<div id="pageBar" style="text-align:center;color:black;">
			<%=request.getAttribute("pageBar")%>
	</div>
</div>
<style>
#pageBar>a{
	color:black!important;
	margin:4px!important;
}
.list-padding {
	padding: 10px 5px;
}
</style>
<%@ include file="/views/common/footer.jsp"%>
