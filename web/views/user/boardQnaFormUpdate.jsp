<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.truckta.boardqna.q.model.vo.BoardQnaQ" %>

<%@ include file="/views/common/header.jsp"%>
<%
BoardQnaQ q=(BoardQnaQ)request.getAttribute("q");
%>

<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<%-- <div class="container">
	<div class="row" style="padding-top: 20%">
		<div class="col-ㅣg-4 "></div>
		<div class="col-lg-4 border border-light rounded "style="flex-align: center"
		 action="<%=request.getContextPath()%>/board/boardFormEnd"
		method="post" enctype="multipart/form-data">
			<form style="margin: 10px">
					<h2>게시판 입력</h2>
					<div class="form-group">
					<label for="InputId">제목</label>
					<input type="text" name="title" required>
					</div>
					<div class="form-group">
					<label for="InputId">사용자</label>
					<input type="text" name="writer" value="<%=clientLogin.getId()%>"
						readonly> <input type="file" name="up_file"/>
                    </div>
                    <div class="form-group">
					<textarea rows="5" cols="20" name="content"></textarea>
                     </div>
					<input type="submit" value="등록하기"> <input type="reset"
						value="취소하기">
				           </div>
			</form>
		</div>
	</div>
</div>
</div>  --%>



<div class="container">
	<div class="row" style="padding-top: 10%">
		<div class="col-11 border border-light rounded "
			style="flex-align: center">
			<form style="margin: 10px" action="<%=request.getContextPath()%>/board/boardFormEnd"
				method="post" enctype="multipart/form-data">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">

					
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
							name="title" maxlength="50" value="<%%>" /></td>
						</tr>
						<tr>
							<td><input type="text" class="form-control" name="writer"
								value="<%=clientLogin.getId()%>" readonly></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="etc" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
						<td><input type="file" name="up_file" /></td>
					</tbody>
				</table>


				<input type="submit" value="등록하기"> 
				<input type="reset" value="취소하기">
			</form>
		</div>
	</div>
</div>


<%@ include file="/views/common/footer.jsp"%>