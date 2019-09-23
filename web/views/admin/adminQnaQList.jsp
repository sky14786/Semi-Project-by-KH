<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.truckta.boardqna.q.model.vo.BoardQnaQ" %>

<%
	List<BoardQnaQ> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	String search = (String) request.getAttribute("search");
	String searchKeyword = (String) request.getAttribute("searchKeyword");

	if(request.getAttribute("type")!=null){
		int type = (int) request.getAttribute("type");
	}
%>
<style>
.container {
	font-family: "Noto Sans KR", sans-serif;
}
</style>


<div class="container-fluid" style="margin-top: 3%">
	<table class="table">
		<thead class="thead-light">
			<tr style="text-align:center;">
				<th>번호</th>
				<th>분류</th>
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
						<td><%if(b.getType()==0) {%>
							질문
							<%}else if(b.getType()==1){ %>
							건의
							<%}else if(b.getType()==2){ %>
							신고
							<%} %>
						</td>
						<td><%=b.getqUser() %></td>
						<td><a href="<%=request.getContextPath() %>/board/boardView?boardNo=<%=b.getBoardNo() %>" style="color:inherit;"><%=b.getTitle() %></a></td>
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
						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">
						<a href="<%=request.getContextPath() %>/board/boardView?boardNo=<%=b.getBoardNo() %>" style="color:inherit;">
						답변
						</a>
						</button>
						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">
						<a href="<%=request.getContextPath() %>/admin/adminBoardQnaQUpdateTry?boardNo=<%=b.getBoardNo() %>" style="color:inherit;">
						수정</a></button>
						<button type="button" name="btn_del" class="btn btn-sm" style="background-color:#17a2b8;color:white;">삭제</button>
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
<script>
	$("button[name=btn_del]").click(function(){
		var btn_del = $(this);
		var tr = btn_del.parent().parent();
		var td = tr.children();
		var no = td.eq(0).text();
		var question = td.eq(2).text();
		
		var isCheckDelete =  confirm(no+"번 질문 "+question+"을 삭제하시겠습니까?");
		if(isCheckDelete){
		 	deleteQuestion(no); 
		} 
	});
	function deleteQuestion(no){
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/adminDeleteQnaQ",
			type:"post",
			dataType:"json",
			data:{
				"no":no
			},
			success:function(data){
				if(data){
					alert("삭제에 성공했습니다.");
					location.href="<%=request.getContextPath()%>/admin/adminQnaQList";
				}else{
					alert("삭제에 실패했습니다. 개발자에게 문의하세요.");
				}
			}
		});  
	}
	
</script>
<%@ include file="/views/common/footer.jsp"%>
