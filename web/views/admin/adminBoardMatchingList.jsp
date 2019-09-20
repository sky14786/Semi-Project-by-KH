<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.truckta.boardmatching.model.vo.BoardMatching" %>

<%
	List<BoardMatching> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	String search = (String) request.getAttribute("search");
	String searchKeyword = (String) request.getAttribute("searchKeyword");
%>
<style>
.container-fluid {
	font-family: "Noto Sans KR", sans-serif;
}
tr>td{
	vertical-align:middle!important;
}
</style>


<div class="container-fluid" style=" margin-top: 3%">
	<table class="table" style="font-size:10px">
		<thead class="thead-light">
			<tr style="text-align:center;">
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>출발지</th>
				<th>도착지</th>
				<th>희망도착일</th>
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
						<td><a href="<%=request.getContextPath() %>/detail?boardNo=<%=bm.getBoardNo() %>" style="color:inherit;"><%=bm.getTitle() %></a></td>
						<td><%=bm.getWrtier() %></td>
						<td><%=bm.getStartAddr() %></td>
						<td><%=bm.getEndAddr() %></td>
						<td><%=bm.getTkDate() %></td>
						<td><%=bm.getHireDate() %></td>
						<td><%=bm.getCount() %></td>
						<td><%=bm.getBoardState() == 1?"정상":"삭제" %></td>
						<td><%=bm.getMemo()!=null?bm.getMemo():"X" %></td>
						<td>

						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">
						<a href="<%=request.getContextPath()%>/board/updateLoad?boardNo=<%=bm.getBoardNo()%>&writer=<%=bm.getWrtier()%>" style="color:inherit;">수정</a>
						</button>
						<button type="button" name="btn_del" class="btn btn-sm" style="background-color:#17a2b8;color:white;">삭제</button>
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

<script>
	$("button[name=btn_del]").click(function(){
		var btn_del = $(this);
		var tr = btn_del.parent().parent();
		var td = tr.children();
		var no = td.eq(0).text();
		
		var isDeleted = confirm(no+"번 글을 삭제처리하시겠습니까?");
		if(isDeleted){
			deleteBoardMatching(no);
		}
	});
	function deleteUser(no){
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/adminDeleteBoardMatching",
			type:"post",
			dataType:"json",
			data:{"user":no},
			success:function(data){
				if(data){
					alert("삭제되었습니다.");
					location.href="<%=request.getContextPath()%>/admin/adminBoardMatchingList";
				}else{
					alert("삭제 실패! 개발자에게 문의하세요.");				
				}
			}
		})
	}
</script>
<%@ include file="/views/common/footer.jsp"%>
