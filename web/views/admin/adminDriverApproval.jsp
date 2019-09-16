<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.truckta.driver.model.vo.Driver, com.truckta.cartype.model.vo.CarType" %>

<%
	List<Driver> dList = (List) request.getAttribute("dList");
	List<CarType> cList = (List) request.getAttribute("cList");
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
				<th>차종</th>
				<th>생년월일</th>
				<th>운전면허</th>
				<th>사업자등록증</th>
				<th>차사진</th>
				<th>신청일자</th>
				<th>상태</th>
				<th>기타</th>
			</tr>
		</thead>
		<tbody>
			<%if(dList!=null){ 
				for(Driver d : dList){
			%>
					<tr style="text-align:center;">
						<td><a href="#" style="color:inherit;"><%=d.getId() %></a></td>
						<td>
						<%for(int i = 0 ; i<cList.size();i++){
							if(d.getCarType()==cList.get(i).getTypeNo()){%>
								<%=cList.get(i).getCarType() %>
						<%	break;}
							} %>
						</td>
						<td><%=d.getDateOfBirth()%></td>
						
						<%if(d.getdLicense()!=null){ %>
							<td><img src="<%=request.getContextPath()%>/images/profile_images/file.png"></td>
						<%}else { %>
							<td>[등록안함]</td>
						<%} %>
						
						<%if(d.getbLicense()!=null){ %>
							<td><img src="<%=request.getContextPath()%>/images/profile_images/file.png"></td>
						<%}else { %>
							<td>[등록안함]</td>
						<%} %>
						
					<%-- 	<%if(d.getCarPic()!=null){ %>
							<td><img src="<%=request.getContextPath()%>/images/profile_images/file.png"></td>
						<%}else { %>
							<td>[등록안함]</td>
						<%} %> --%>
						<td><%=d.getRegDate() %></td>
						<td>
						<%if(d.getStatus()==0){%>
							신청
						<%}%>
						</td>
						
						<td>
						<button type="button" class="btn btn-sm" style="background-color:#17a2b8;color:white;">승인</button>
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