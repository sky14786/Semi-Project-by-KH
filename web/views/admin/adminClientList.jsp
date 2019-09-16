<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.truckta.client.model.vo.Client" %>

<%
	List<Client> list = (List) request.getAttribute("list");
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
				<th>ID</th>
				<th>이름</th>
				<th>가입일</th>
				<th>수정일</th>
				<th>유저권한</th>
				<th>상태</th>
				<th>프로필사진</th>
				<th>상세정보</th>
			</tr>
		</thead>
		<tbody>
			<%if(list!=null){ 
				for(Client c : list){
			%>
					<tr style="text-align:center;">
						<td><a href="#" style="color:inherit;"><%=c.getId() %></a></td>
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
						<td>
						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">수정</button>
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
