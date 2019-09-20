<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Client cl = new Client();
	if((Client)request.getAttribute("client") != null){
		cl = (Client)request.getAttribute("client");
	}else{
		response.sendRedirect("/");
	}
	
	
%>
<%@ include file="/views/common/header.jsp"%>
<link href="<%=request.getContextPath()%>/plugins/mypage/css/style.css"
	rel="stylesheet">

<title>기사 신청 페이지</title>
</head>

<%@ include file="/views/myPage/myPageHeader.jsp"%>
<body class="body-wrapper">
	<section class="section schedule">
		<div class="container">
			<div class="row">
				<div>
					<button> 기사 신청 </button>
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
</html>