<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/* 	Client cl = new Client();
	if((Client)request.getAttribute("client") != null){
		cl = (Client)request.getAttribute("client");
	}else{
		response.sendRedirect("/");
	} */
	
	
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
<%@ include file="/views/myPage/myPageHeader.jsp"%>
<body class="body-wrapper">
	<section class="section schedule">
		<div class="container">
			<div class="row">
				<!-- 약관 스크롤 -->
				<div class='col-12 text-center'>
					<h2>화물자동차 운수사업법<span>( 약칭: 화물자동차법 )</span></h2>
				</div>
				<div class='col-12 text-center'>
					<span>[시행 2018. 11. 29.] [법률 제15743호, 2018. 8. 14., 일부개정]</span>
				</div>
				<div class='input-group'>
					<div id="list-example" class="list-group col-2">
						<a class="list-group-item list-group-item-action" href="#list-item-1">Item 1</a>
						<a class="list-group-item list-group-item-action" href="#list-item-2">Item 2</a>
						<a class="list-group-item list-group-item-action" href="#list-item-3">Item 3</a>
						<a class="list-group-item list-group-item-action" href="#list-item-4">Item 4</a>
						</div>
					<div data-spy="scroll" data-target="#list-example" data-offset="0" class="scrollspy-example col-10">
					<h4 id="list-item-1">제1장</h4>
					<p> 총칙
						조문체계도버튼
						제1조(목적) 이 법은 화물자동차 운수사업을 효율적으로 관리하고 건전하게 육성하여 화물의 원활한 운송을 도모함으로써 공공복리의 증진에 기여함을 목적으로 한다.</p>
					<h4 id="list-item-2">Item 2</h4>
					<p>제2조(정의) 이 법에서 사용하는 용어의 뜻은 다음과 같다.  <개정 2011. 6. 15., 2012. 6. 1., 2013. 3. 23., 2014. 3. 18., 2018. 4. 17.>

						1. "화물자동차"란 「자동차관리법」 제3조에 따른 화물자동차 및 특수자동차로서 국토교통부령으로 정하는 자동차를 말한다.
						
						2. "화물자동차 운수사업"이란 화물자동차 운송사업, 화물자동차 운송주선사업 및 화물자동차 운송가맹사업을 말한다.
						
						3. "화물자동차 운송사업"이란 다른 사람의 요구에 응하여 화물자동차를 사용하여 화물을 유상으로 운송하는 사업을 말한다. 이 경우 화주(貨主)가 화물자동차에 함께 탈 때의 화물은 중량, 용적, 형상 등이 여객자동차 운송사업용 자동차에 싣기 부적합한 것으로서 그 기준과 대상차량 등은 국토교통부령으로 정한다.
						
						4. "화물자동차 운송주선사업"이란 다른 사람의 요구에 응하여 유상으로 화물운송계약을 중개ㆍ대리하거나 화물자동차 운송사업 또는 화물자동차 운송가맹사업을 경영하는 자의 화물 운송수단을 이용하여 자기 명의와 계산으로 화물을 운송하는 사업(화물이 이사화물인 경우에는 포장 및 보관 등 부대서비스를 함께 제공하는 사업을 포함한다)을 말한다.
						
						5. "화물자동차 운송가맹사업"이란 다른 사람의 요구에 응하여 자기 화물자동차를 사용하여 유상으로 화물을 운송하거나 화물정보망(인터넷 홈페이지 및 이동통신단말장치에서 사용되는 응용프로그램을 포함한다. 이하 같다)을 통하여 소속 화물자동차 운송가맹점(제3조제3항에 따른 운송사업자 및 제40조제1항에 따라 화물자동차 운송사업의 경영의 일부를 위탁받은 사람인 운송가맹점만을 말한다)에 의뢰하여 화물을 운송하게 하는 사업을 말한다.
						
						6. "화물자동차 운송가맹사업자"란 제29조제1항에 따라 화물자동차 운송가맹사업의 허가를 받은 자를 말한다.
						
						7. "화물자동차 운송가맹점"이란 화물자동차 운송가맹사업자(이하 "운송가맹사업자"라 한다)의 운송가맹점으로 가입한 자로서 다음 각 목의 어느 하나에 해당하는 자를 말한다.
						
						가. 운송가맹사업자의 화물정보망을 이용하여 운송 화물을 배정받아 화물을 운송하는 제3조제3항에 따른 운송사업자
						
						나. 운송가맹사업자의 화물운송계약을 중개ㆍ대리하는 제24조제2항에 따른 운송주선사업자
						
						다. 운송가맹사업자의 화물정보망을 이용하여 운송 화물을 배정받아 화물을 운송하는 자로서 제40조제1항에 따라 화물자동차 운송사업의 경영의 일부를 위탁받은 사람. 다만, 경영의 일부를 위탁한 운송사업자가 화물자동차 운송가맹점으로 가입한 경우는 제외한다.
						
						7의2. "영업소"란 주사무소 외의 장소에서 다음 각 목의 어느 하나에 해당하는 사업을 영위하는 곳을 말한다.
						
						가. 제3조제1항에 따라 화물자동차 운송사업의 허가를 받은 자 또는 화물자동차 운송가맹사업자가 화물자동차를 배치하여 그 지역의 화물을 운송하는 사업
						
						나. 제24조제1항에 따라 화물자동차 운송주선사업의 허가를 받은 자가 화물 운송을 주선하는 사업
						
						8. "운수종사자"란 화물자동차의 운전자, 화물의 운송 또는 운송주선에 관한 사무를 취급하는 사무원 및 이를 보조하는 보조원, 그 밖에 화물자동차 운수사업에 종사하는 자를 말한다.
						
						9. "공영차고지"란 화물자동차 운수사업에 제공되는 차고지로서 다음 각 목의 어느 하나에 해당하는 자가 설치한 것을 말한다.
						
						가. 특별시장ㆍ광역시장ㆍ특별자치시장ㆍ도지사ㆍ특별자치도지사(이하 "시ㆍ도지사"라 한다)
						
						나. 시장ㆍ군수ㆍ구청장(자치구의 구청장을 말한다. 이하 같다)
						
						다. 「공공기관의 운영에 관한 법률」에 따른 공공기관 중 대통령령으로 정하는 공공기관
						
						라. 「지방공기업법」에 따른 지방공사
						
						10. "화물자동차 휴게소"란 화물자동차의 운전자가 화물의 운송 중 휴식을 취하거나 화물의 하역(荷役)을 위하여 대기할 수 있도록 「도로법」에 따른 도로 등 화물의 운송경로나 「물류시설의 개발 및 운영에 관한 법률」에 따른 물류시설 등 물류거점에 휴게시설과 차량의 주차ㆍ정비ㆍ주유(注油) 등 화물운송에 필요한 기능을 제공하기 위하여 건설하는 시설물을 말한다.
						
						11. "화물차주"란 화물을 직접 운송하는 자로서 다음 각 목의 어느 하나에 해당하는 자를 말한다.
						
						가. 제3조제1항제2호에 따라 개인화물자동차 운송사업의 허가를 받은 자(이하 "개인 운송사업자"라 한다)
						
						나. 제40조제1항에 따라 경영의 일부를 위탁받은 사람(이하 "위ㆍ수탁차주"라 한다)
						
						12. "화물자동차 안전운송</p>
					<h4 id="list-item-3">Item 3</h4>
					<p>...</p>
					<h4 id="list-item-4">Item 4</h4>
					<p>...</p>
					</div>
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
	function driverCon() {
		if (confirm("기사 신청하시겠습니까?") == true){
			location.href = '<%=request.getContextPath()%>     ?driverId=<%=cl.getId()%>';
		}else{	//취소
			return false;
		}
	}
</script>
</html>