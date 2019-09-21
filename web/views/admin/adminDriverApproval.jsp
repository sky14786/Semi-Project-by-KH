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


<div class="container-fluid" style="margin-top: 3%">
	<table class="table">
		<thead class="thead-light">
			<tr style="text-align:center;">
				<th>ID</th>
				<th>차종</th>
				<th>생년월일</th>
				<th>운전면허</th>
				<th>사업자등록증</th>
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
						<td><%=d.getId() %></td>
						<td>
						<%for(int i = 0 ; i<cList.size();i++){
							if(d.getCarType()==cList.get(i).getTypeNo()){%>
								<%=cList.get(i).getCarType() %>
						<%	break;}
							} %>
						</td>
						<td><%=d.getDateOfBirth()%></td>
						<td><%=d.getdLicense()%></td>
						<td><%=d.getbLicense()%></td>
						<td><%=d.getRegDate()%></td>
						<td><%
							if(d.getStatus() == 0) {
						%> 신청 <%
							}
						%></td>
						
						<td>
						<button type="button" name="btn_right" class="btn btn-sm" style="background-color:#17a2b8;color:white;">승인</button>
						<button type="button" name="btn_detail"class="btn btn-sm" style="background-color:#17a2b8;color:white;">보기</button>
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
	$("button[name=btn_right]").click(function(){
		var btn_del = $(this);
		var tr = btn_del.parent().parent();
		var td = tr.children();
		var id = td.eq(0).text();
		
		var isModify = confirm("["+id+"]사용자의 드라이버 권한을 승인하겠습니까?");
		if(isModify){
			modifyRight(id);
		}
	});
	
	function modifyRight(id){
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/adminDriverRightModify",
			type:"post",
			dataType:"json",
			data:{"id":id},
			success:function(data){
				if(data){
					alert("승인했습니다.");
					location.href="<%=request.getContextPath()%>/admin/driverApproval";
				}else{
					alert("실패! 개발자에게 문의하세요.");
				}
				
			}
		})
	}
	$("button[name=btn_detail]").click(function(){
		var btn_del = $(this);
		var tr = btn_del.parent().parent();
		var td = tr.children();
		var id = td.eq(0).text();
		
		location.href="<%=request.getContextPath()%>/admin/adminUserDetail?isDriverView=true&id="+id;
	});
	
</script>
<%@ include file="/views/common/footer.jsp"%>