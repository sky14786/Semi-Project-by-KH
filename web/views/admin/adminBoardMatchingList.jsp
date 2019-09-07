<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.truckta.boardmatching.model.vo.BoardMatching" %>

<%
	List<BoardMatching> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>
<style>
.container-fluid {
	font-family: "Noto Sans KR", sans-serif;
}
tr>td{
	vertical-align:middle!important;
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

<div class="container-fluid" style=" margin-top: 3%">
	<table class="table">
		<thead class="thead-light">
			<tr style="text-align:center;">
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>출발지</th>
				<th>도착지</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>글상태</th>
				<th>메모</th>
				<th>기타</th>
			</tr>
		</thead>
		<tbody>
			<%if(list!=null){ 
				for(BoardMatching bm : list){
			%>
					<tr style="text-align:center;">
						<td><%=bm.getBoardNo() %></td>
						<td><a href="#" style="color:inherit;"><%=bm.getTitle() %></a></td>
						<td><%=bm.getWrtier() %></td>
						<td><%=bm.getStartAddr() %></td>
						<td><%=bm.getEndAddr() %></td>
						<td><%=bm.getHireDate() %></td>
						<td><%=bm.getCount() %></td>
						<td><%=bm.getBoardState() == 1?"정상":"삭제" %></td>
						<td><%=bm.getMemo()!=null?bm.getMemo():"X" %></td>
						<td>

						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">수정</button>
						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">삭제</button>
						</td>
						
				</tr>
			<%	}
			}%>
			
					
			
		</tbody>
	</table>
	<div id="pageBar" style="text-align:center;color:black!important;font-size:18px;"> 
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
