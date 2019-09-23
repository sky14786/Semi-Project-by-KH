<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.truckta.client.model.vo.Client" %>
<%
 	Client cl = (Client)request.getAttribute("client");
	
%>
<%@ include file="/views/common/header.jsp"%>
<link href="<%=request.getContextPath()%>/plugins/mypage/css/style.css"
	rel="stylesheet">

<title>기사 신청 페이지</title>
</head>

<style>
	.scrollspy-example{
		height: 500px;
		box-sizing: border-box;
	}
	/* .row{

	} */
</style>
<%-- <%@ include file="/views/myPage/myPageHeader.jsp"%>  --%>
<body class="body-wrapper">
	<section class="section schedule">
		<div class="container">
			<div class="row">
				<!-- 약관 스크롤 -->
				<div class='col-12 text-center'>
					<h2>화물자동차 운수사업법<span>( 약칭: 화물자동차법 )</span></h2>
				</div>
				
				<div>
				<button class="btn btn-primary col-12" onclick="driverCon(); return false;"> 기사 신청 </button>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/views/common/footer.jsp"%>

	<script src="<%=request.getContextPath()%>/plugins/mypage/js/custom.js"></script>
	<script
		src="<%=request.getContextPath()%>/plugins/mypage/popper/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/plugins/mypage/bootstrap/js/bootstrap.min.js"></script>

</body>
<script>
	function driverCon(id) {
		if (confirm("기사 신청하시겠습니까?") == true){
			sessionStorage.setItem("isCertified", true);
			location.href = "<%=request.getContextPath()%>/driver/driverJoinTry?id=<%=cl.getId()%>";
		}else{	//취소
			return false;
		}
	}
</script>