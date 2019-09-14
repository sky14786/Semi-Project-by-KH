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
<div class="navbar navbar-expand-sm bg-dark navbar-dark">
	<a class="navbar-brand" href="#">관리자</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
	<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminClientList">유저관리</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminBoardMatchingList">게시글관리</a></li>
			<li class="nav-item"><a class="nav-link" href="#">건의사항</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminCarTypeList">운송수단추가</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/driverApproval">기사신청관리</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminDriverList">기사관리</a></li>
		</ul>
		&nbsp;&nbsp;
		<form action="" method="post" class="form-inline">
			<select id="searchType" name="searchType"
				class="custom-select form-control">
				<option selected>Type</option>
				<option value="id">아이디</option>
				<option value="name">이름</option>
				<option value="level">권한</option>
			</select> &nbsp; &nbsp; &nbsp; <input class="form-control" type="text" name=""
				id="" placeholder="Keyword" />
			<button type="submit" class="btn btn-success">검색</button>
		</form>
	</div>
</div>

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
