<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.truckta.matching.model.vo.Matching" %>

<%
	List<Matching> list = (List) request.getAttribute("list");
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
	<table class="table" >
		<thead class="thead-light">
			<tr style="text-align:center;">
				<th>매칭번호</th>
				<th>원글번호</th>
				<th>고객</th>
				<th>기사</th>
				<th>금액</th>
				<th>코맨트</th>
				<th>신청날자</th>
				<th>기타</th>
			</tr>
		</thead>
		<tbody>
			<%if(list!=null){ 
				for(Matching m : list){
			%>
					<tr style="text-align:center;">
						<td><%=m.getMatNo() %></td>
						<td><a href="<%=request.getContextPath() %>/detail?boardNo=<%=m.getBoardNo() %>"  style="color:inherit;"><%=m.getBoardNo() %></a></td>
						<td><%=m.getRequestor() %></td>
						<td><%=m.getResponser() %></td>
						<td><%=m.getPay() %></td>
						<td><%=m.getMemo()==null?"없음":m.getMemo() %></td>
						<td><%=m.getTryDate() %></td>
						<td>

						
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
	function deleteBoardMatching(no){
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
