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
<%@ include file="/views/admin/adminHeader.jsp"%>

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
