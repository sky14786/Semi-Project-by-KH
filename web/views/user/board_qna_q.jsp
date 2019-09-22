<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.truckta.boardqna.q.model.vo.BoardQnaQ"%>
<%@ page import="java.util.List"%>
<%
	List<BoardQnaQ> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	/* BoardQnaQ qu= (BoardQnaQ) request.getAttribute("board_qna_q");  */

	if (request.getAttribute("type") != null) {
		int type = (int) request.getAttribute("type");
	}
%>







<!DOCTYPE html>
<html>
<%@ include file="/views/common/header.jsp"%>
<head>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<!-- <link  href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css"> -->
<link href="<%=request.getContextPath()%>/css/board_qna.css?var=1.1"
	rel="stylesheet" />
<!-- <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script> -->
<script src="../../js/clientBoardList-js.js?ver=1.1" charset="utf-8"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="container-fluid" style="margin-top: 3%">
		<table class="table">
			<thead class="thead-light">
				<tr style="text-align: center;">

					<%
						/*  if(qu.getType()==0){   */
					%>
					<h2>Q&A 게시판</h2>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">번호</th>
					<th style="background-color: #eeeeee; text-align: center;">게시물</th>
					<th style="background-color: #eeeeee; text-align: center;">제목</th>
					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					<th style="background-color: #eeeeee; text-align: center;">상태</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (BoardQnaQ q : list) {
				%>
				<%
					if (clientLogin != null
								&& (clientLogin.getId().equals(q.getqUser()) || clientLogin.getName().equals("admin"))) {
				%>
				<tr style="text-align: center;">
					<td><%=q.getBoardNo()%></td>
					<td>
						<%
							if (q.getType() == 0) {
						%> 질문 <%
							} else if (q.getType() == 1) {
						%> 건의 <%
							} else if (q.getType() == 2) {
						%> 신고 <%
							}
						%>

					</td>
					<td><a
						href="<%=request.getContextPath()%>/board/boardView?boardNo=<%=q.getBoardNo()%>">
							<%=q.getTitle()%>
					</a></td>
					<td><%=q.getqUser()%></td>
					<td><%=q.getHireDate()%></td>

					<td>
						<%
							if (q.getStatus() == 0) {
						%> 답변전 <%
							} else if (q.getStatus() == 1) {
						%> 답변후 <%
							} else if (q.getStatus() == 2) {
						%> 완료 <%
							}
						%>
					</td>
				</tr>
				<%
					} else {
				%>
				<tr style="text-align: center;">
					<td><%=q.getBoardNo()%></td>
					<td>비밀글입니다</td>
					<td></td>
					<td></td>

					<td></td>
				</tr>
				<%
					}
				%>
				<%
					}
				%>
			</tbody>
		</table>
		<div id="pageBar" style="text-align: center; color: black;">
			<%=request.getAttribute("pageBar")%>
		</div>
	</div>






	<%
		if (clientLogin != null) {
	%>
	<input type="button" class="btn btn-primary" value="글쓰기" id="btn-add" onclick="fn_boardAdd()" />
	<%
		}
	%>
	<script>
			function fn_boardAdd(){
				location.href="<%=request.getContextPath()%>/board/boardQnaForm";
		}
	</script>
	<style>
#pageBar>a {
	color: black !important;
	margin: 4px !important;
	font-size: 20px;
}

#pageBar>.cPage {
	margin: 4px !important;
	color: grey !important;
	font-size: 22px;
}

.list-padding {
	padding: 10px 5px;
}

</style>
</body>
</html>