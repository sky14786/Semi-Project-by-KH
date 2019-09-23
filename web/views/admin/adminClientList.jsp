<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.truckta.client.model.vo.Client" %>

<%
	List<Client> list = (List) request.getAttribute("list");
	int cPage = (int) request.getAttribute("cPage");
	/* String searchKeyWord = (String) request.getAttribute("searchKeyword");
	String search = (String) request.getAttribute("search"); */
%>
<style>
.container {
	font-family: "Noto Sans KR", sans-serif;
}
</style>


<div class="container-fluid" style="margin-top: 8%">
	<table class="table">
		<thead class="thead-light">
			<tr style="text-align:center;">
				<th>ID</th>
				<th>이름</th>
				<th>가입일</th>
				<th>수정일</th>
				<th>유저권한</th>
				<th>상태</th>
				<th>프로필사진</th>
				<th>경고횟수</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody>
			<%if(list!=null){ 
				for(Client c : list){
			%>
					<tr style="text-align:center;">
						<td><a href="<%=request.getContextPath() %>/admin/adminUserDetail?isDriverView=false&id=<%=c.getId() %>" style="color:inherit;"><%=c.getId() %></a></td>
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
						<td>
						<%if(c.getStatus()==1){%>
							정상
						<%}else{%>
							탈퇴
						<%}%>
						</td>
						<%if(c.getProfile()!=null){ %>
							<td><img src="<%=request.getContextPath()%>/images/project_images/file.png"></td>
						<%}else { %>
							<td>[등록안함]</td>
						<%} %>
						<td><%=c.getReportCount() %></td>
						<td>
						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">
						<a href="<%=request.getContextPath() %>/admin/adminUserDetail?isDriverView=<%=c.getUserType()==2?true:false %>>&id=<%=c.getId() %>&isUpdateView=true" style="color:inherit;">
							수정
						</a>
						</button>
						<button type="button" name="btn_del" class="btn btn-sm" style="background-color:#17a2b8;color:white;">삭제</button>
						<%if(c.getStatus()==1) {%>
						<button type="button" name="btn_report" class="btn btn-sm" style="background-color:#17a2b8;color:white;">경고</button>
						<%} %>
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
$("button[name=btn_report]").click(function(){
	var btn_report = $(this);
	var tr = btn_report.parent().parent();
	var td = tr.children();
	var user = td.eq(0).text();
	
	var isCheckReport =  confirm(user+" 사용자를 경고처리하겠습니까?");
	if(isCheckReport){
	 	reportUser(user); 
	} 
});

function reportUser(user){
	$.ajax({
		url:"<%=request.getContextPath()%>/admin/adminReportUser",
		type:"post",
		dataType:"json",
		data:{"user":user},
		success:function(data){
			if(data){
				alert("경고처리했습니다.");
				location.href="<%=request.getContextPath()%>/admin/adminClientList";
			}else{
				alert("실패! 개발자에게 문의하세요.");
			}
			
		}
	})
}

$("button[name=btn_del]").click(function(){
	var btn_del = $(this);
	var tr = btn_del.parent().parent();
	var td = tr.children();
	var user = td.eq(0).text();
	
	var isDeleted = confirm(user+" 사용자를 삭제처리하시겠습니까?");
	if(isDeleted){
		deleteUser(user);
	}
});
function deleteUser(user){
	$.ajax({
		url:"<%=request.getContextPath()%>/admin/adminClientDelete",
		type:"post",
		dataType:"json",
		data:{"user":user},
		success:function(data){
			if(data){
				alert("삭제되었습니다.");
				location.href="<%=request.getContextPath()%>/admin/adminClientList";
			}else{
				alert("삭제 실패! 개발자에게 문의하세요.");				
			}
		}
	})
}

</script>
<%@ include file="/views/common/footer.jsp"%>
