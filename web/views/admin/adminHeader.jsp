<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="navbar navbar-expand-sm bg-dark navbar-dark"style="margin-top:65px;">
	<a class="navbar-brand" href="<%=request.getContextPath()%>/views/admin/adminMain.jsp" style="width:auto;">관리자</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav">
		
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">유저관리</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/adminClientList">일반유저</a>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/adminDriverList">기사관리</a>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/driverApproval">기사신청관리</a>
					</div>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Q&A</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/adminQnaQList?type=0">질문관리</a>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/adminQnaQList?type=1">건의관리</a>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/adminQnaQList?type=2">신고관리</a>
					</div>
			</li>
				<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">매칭</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/adminMatchingList">매칭관리</a>
						<a class="dropdown-item" href="<%=request.getContextPath()%>/admin/adminMCompleteList">매칭성사관리</a>
					</div>
			</li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminBoardMatchingList">게시글관리</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/admin/adminCarTypeList">운송수단관리</a></li>
		</ul>
		
		&nbsp;&nbsp;
		<form id="searchForm" method="post" class="form-inline">
			<select id="searchType" name="searchType"
				class="custom-select form-control" onchange="searchTypeChange();">
				<option selected>Type</option>
				<option value="typeUser">회원</option>
				<option value="typeBoardMatching">매칭게시판</option>
				<option value="typeQna">건의게시판</option>
				<option value="typeMatching">매칭</option>
			</select> &nbsp; &nbsp; &nbsp; 
			<select id="search" name="search" class="custom-select form-control"></select>
			&nbsp; &nbsp; &nbsp; 
			<input class="form-control" type="text" name="searchKeyword" id="searchKeyword" placeholder="Keyword" onkeypress="if(event.keyCode==13) {searching(); return false;}"/>
			
			<button type="button" id="btn_search" onclick="searching();" class="btn btn-success">검색</button>
		</form>
	</div>
</div>
<script>
	function searchTypeChange(){
		var typeUser = ["휴대폰번호","이름"];
		var typeBoardMatching = ["글번호","제목","작성자"];
		var typeQna = ["글번호","제목","작성자"];
		var typeMatching = ["매칭번호","원글번호","사용자"];
		var selectItem = $("#searchType").val();
		var changeItem;
		
		
		
		if(selectItem == "typeUser"){
			changeItem = typeUser;
		}else if(selectItem == "typeBoardMatching"){
			changeItem = typeBoardMatching;
		}else if(selectItem == "typeQna"){
			changeItem = typeQna;
		}else if(selectItem == "typeMatching"){
			changeItem = typeMatching;
		}
		
		$("#search").empty();
		
		for(var count = 0 ; count <  changeItem.length;count++){
			var option = $("<option>"+changeItem[count]+"</option>");
			console.log(changeItem[count]);
			$("#search").append(option);
		}
	}
	function searching(){
		var searchType = $("#searchType").val();
		var searchKeyword = $("#searchKeyword").val();
		var search = $("#search").val();
		console.log(searchType);	
		var url;
		
	
	switch (searchType) {
		case "typeUser":
			url = "adminUserSearch";
			break;
		case "typeBoardMatching":
			url = "adminBMatchingSearch";
			break;
		case "typeQna":
			url = "adminQnaSearch";
			break;
		case "typeMatching":
			url = "adminMatchingSearch";
			break;
		}
	
	
	var form = document.getElementById("searchForm");
	  form.action = "<%=request.getContextPath()%>/admin/"+url;
	  form.submit();

		<%-- $.ajax({
			url : "<%=request.getContextPath()%>/admin/"+url,
			type:"post",
			dataType:"json",
			data:{
				"search":search,
				"searchKeyword":searchKeyword
			}
		});  --%>
	}
</script>