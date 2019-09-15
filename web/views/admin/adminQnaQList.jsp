<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.truckta.boardqna.q.model.vo.BoardQnaQ" %>

<%
	List<BoardQnaQ> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
%>
<style>
.container {
	font-family: "Noto Sans KR", sans-serif;
}
</style>
<%@ include file="/views/admin/adminHeader.jsp"%>

<div class="container-fluid" style="margin-top: 3%">
	<table class="table">
		<thead class="thead-light">
			<tr style="text-align:center;">
				<th>번호</th>
				<th>사용자</th>
				<th>제목</th>
				<th>일자</th>
				<th>상태</th>
				<th>기타</th>
			</tr>
		</thead>
		<tbody>
			<%if(list!=null){ 
				for(BoardQnaQ b : list){
			%>
					<tr style="text-align:center;">
						<td><%=b.getBoardNo() %></td>
						<td><%=b.getqUser() %></td>
						<td><a href="#" style="color:inherit;"><%=b.getTitle() %></a></td>
						<td><%=b.getHireDate() %></td>
						<td><%if(b.getStatus()==0){%>
								답변전
							<%}else if(b.getStatus()==1) {%>
								답변후
							<%}else if(b.getStatus()==2) {%>
								완료
							<%} %>						
						</td>
						<td>
						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">답변</button>
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
	font-size:20px;
	
}
#pageBar> .cPage{
	margin:4px!important;
	color:grey!important;
	font-size:22px;
}
.list-padding {
	padding: 10px 5px;
}
</style>
<%@ include file="/views/common/footer.jsp"%>
