<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="java.util.List,com.truckta.cartype.model.vo.CarType" %>

<%
	List<CarType> list = (List) request.getAttribute("list");
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

<div class="container" style=" margin-top: 3%">
	<%-- <table class="table">
		<thead class="thead-light">
		<tr style="text-align:center;">
			<th>번호</th>
			<th>종ㄹ --%>
	<table class="table">
		<thead class="thead-light">
			<tr style="text-align:center;">
				<th>번호</th>
				<th>트럭종류</th>
				<th>기타</th>
			</tr>
		</thead>
		<tbody>
			<tr style="text-align:center;">
				<td>차종명 :</td>
				<td><input type="text" name="car_type" placeholder="차종명을 적어주세요."></td>
				<td><button type="button" onclick="insertCarType();" class="btn btn-sm" style="background-color:#17a2b8;color:white;">추가</button></td>
			</tr>


			<%if(list!=null){ 
				for(CarType ct : list){
			%>
					<tr style="text-align:center;">
						<td><%=ct.getTypeNo() %></td>
						<td><%=ct.getCarType() %></td>
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
<script>
	function insertCarType(){
		car_type = $("input[name=car_type]").val();
		$.ajax({
			url:"<%=request.getContextPath()%>/admin/insertCarType",
			type:"post",
			dataType:"json",
			data:{
				"car_type" : car_type
			},
			success:function(data){  
				console.log(data);
				console.log(typeof(data));
				if(data){
					alert('성공');
					location.href="<%=request.getContextPath()%>/admin/adminCarTypeList";
				}else{
					alert('실패');
				}
			},
			complete:function(data){
				$("input[name=car_type]").val("");
			}
		});
	}


</script>
<%@ include file="/views/common/footer.jsp"%>
