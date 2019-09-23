<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.truckta.client.model.vo.Client"%>
<%
	Client cl = (Client) request.getAttribute("client");
%>
<%@ include file="/views/common/header.jsp"%>
<link href="<%=request.getContextPath()%>/plugins/mypage/css/style.css"
	rel="stylesheet">

<title>기사 신청 페이지</title>
</head>

<style>
.scrollspy-example {
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
					<h2>
						화물자동차 운수사업법<span>( 약칭: 화물자동차법 )</span>
					</h2>
					
					
					<nav id="navbar-example2" class="navbar navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <ul class="nav nav-pills">
    <li class="nav-item">
      <a class="nav-link" href="#fat">@fat</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#mdo">@mdo</a>
    </li>
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#one">one</a>
        <a class="dropdown-item" href="#two">two</a>
        <div role="separator" class="dropdown-divider"></div>
        <a class="dropdown-item" href="#three">three</a>
      </div>
    </li>
  </ul>
</nav>
<div data-spy="scroll" data-target="#navbar-example2" data-offset="0">
  <h4 id="fat">@fat</h4>
  <p>...</p>
  <h4 id="mdo">@mdo</h4>
  <p>...</p>
  <h4 id="one">one</h4>
  <p>...</p>
  <h4 id="two">two</h4>
  <p>...</p>
  <h4 id="three">three</h4>
  <p>...</p>
</div>
					
					
					
					
					
					
				</div>

				<div>
					<button class="btn btn-primary col-12"
						onclick="driverCon(); return false;">기사 신청</button>
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
			location.href = "<%=request.getContextPath()%>/driver/driverJoinTry?id=<%=cl.getId()%>
	";
		} else { //취소
			return false;
		}
	}
</script>