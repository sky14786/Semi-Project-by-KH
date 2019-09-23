<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.truckta.boardqna.q.model.vo.BoardQnaQ"%>
<%@ include file="/views/common/header.jsp"%>

<%
	BoardQnaQ q = (BoardQnaQ) request.getAttribute("board_qna_q");
%>

<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>




<div class="container">
	<div class="row" style="padding-top: 10%">
		<div class="col-11 border border-light rounded "
			style="flex-align: center">
			<form style="margin: 10px" method="post"
				enctype="multipart/form-data"
				action="<%=request.getContextPath()%>/board/boardQnaFormUpdateEndServlet">
				<table class="table "
					style="text-align: center; border: 1px solid #dddddd">
					<th>제목</th>
					<input type ="hidden" name ="boardNo" value="<%=q.getBoardNo() %>">
					<tr>
						<td><input type="text" name="title" id="title" class="form-control" style=""
							"50" value="<%=q.getTitle()%>" /></td>
					</tr>
					<th>작성자</th>
					<tr>
						<td><input type="text" name="writer" id="writer" class="form-control"
							value="<%=q.getqUser()%>" readonly /></td>
					</tr>
					<th>내용</th>
					<tr>
						<td><input type="text" name="etc" id="etc" class="form-control" maxlength="2048"
							style="height: 350px;" value="<%=q.getEtc()%>" />
					</tr>
					<td><input type="file" name="up_file" /></td>
				</table>
				<input type="submit" value="수정" id="btn-add" />
			</form>
		</div>
	</div>
</div>
<%-- <script>
			function fn_boardUpdateComplete(){
				location.href="<%=request.getContextPath()%>/BoardQnaFormUpdateEndServlet";
		}
	</script> --%>


<%@ include file="/views/common/footer.jsp"%>