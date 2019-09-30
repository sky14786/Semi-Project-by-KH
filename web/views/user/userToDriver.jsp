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

.ft {
	top: 65px;
}
</style>
<%-- <%@ include file="/views/myPage/myPageHeader.jsp"%>  --%>
<body class="body-wrapper">
	<section class="section schedule">
		<div class="container">
			<div class="row">
				<!-- 약관 스크롤 -->
				<div class='col-12 text-center'>
					<div class="col-12" style="padding-bottom: 145px;"></div>
					<div class="col-12" style="height: 80%; width: 100%;">
						<nav
							class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top ft">
							<a class="navbar-brand" href="<%=request.getContextPath()%>/my/pageTop">My Page</a>
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link" href="#section1">제
										1장 </a></li>
								<li class="nav-item"><a class="nav-link" href="#section2">제
										2장 </a></li>
								<li class="nav-item"><a class="nav-link" href="#section3">제
										3장 </a></li>
								<li class="nav-item"><a class="nav-link" href="#section4">제
										4장 </a></li>
								<li class="nav-item"><a class="nav-link" href="#section5">제
										5장 </a></li>
								<li class="nav-item"><a class="nav-link" href="#section6">제
										6장 </a></li>
								<li class="nav-item"><a class="nav-link" href="#section7">제
										7장 </a></li>
								<li class="nav-item"><a class="nav-link" href="#section8">제
										8장 </a></li>
								<li class="nav-item dropdown">
							</ul>
						</nav>



						<div id="section1" class="container-fluid "
							style="padding-top: 5px; padding-bottom: 5px">
							<h3>제 1 장 총 칙</h3>
							<p>제 1조 (목적 및 소개)</p>
							본 약관은 ‘트럭타’의 약관이며 트럭타의 별도의 회원가입 서비스를 제공하는데 있어, 필요한 제반사항을 규정하는데
							있습니다. <br>1.‘트럭타’은 상용차 전문 업체 정보 서비스를 주목적으로 하는 홈페이지입니다. 따라서
							상용차 정보 업체와 관련된 분쟁 및 소송, 손해배상 또는 이의제기는 본 사이트와 아무 관련 및 책임이 없음을
							알려드립니다.<br> 2.회원은 무료회원이며, 모든 서비스를 제공받을 수 있습니다.<br> <br>
							<p>제 2조 (가입약관의 효력 및 변경)</p>
							1. 이 약관은 ‘트럭타’ 사이트 및 각 서비스 메뉴에 공시함으로써 효력을 발생합니다.<br> 2.
							‘트럭타’은 별도의 통보 없이 본 약관을 변경할 수 있으며, 약관이 변경된 경우에 지체 없이 이를 공시합니다.<br>
							<br>
							<p>
								제 3조 (약관의 준용)<br> 이 약관에 명시되지 아니한 사항에 대해서는 관계법령 및 서비스별 약관의
								취지에 따라 적용할 수 있습니다.
							</p>
							<hr>
						</div>
						<div id="section2" class="container-fluid"
							style="padding-top: 54px; padding-bottom: 0px">
							<h3>제 2 장 용어의 정의</h3>
							<p>
								제 4조 (용어의 정의)<br> <br> 1.이용자 : 본 사이트의 회원가입 없는 불특정 다수의
								사용자로써 인터넷 네트워크를 통해 상용자 전문 업체들의 컨텐츠 서비스를 이용한 자를 말합니다.<br> <br>제
								5조 (기타 용어의 정의)<br> <br>이 약관에서 사용하는 용어의 정의는 제 4조에서 정하는
								것을 제외하고는 관계법령 및 서비스별 약관에서 정하는 바에 의합니다.
							</p>
							<hr>
						</div>
						<div id="section3" class="container-fluid"
							style="padding-top: 54px; padding-bottom: 5px">
							<h3>제 3 장 서비스 이용.제한.정지</h3>
							<p>
								제 6조 (서비스 이용시간)<br> <br> 서비스의 이용은 연중무휴 1일 24시간으로 운영함을
								원칙으로 합니다. 단, ‘트럭타’이 업무 또는 기술상의 사유로 서비스가 일시 중단 되거나 운영상 목적으 로 일시
								중단할 수 있습니다.
							</p>
							<hr>
						</div>
						<div id="section4" class="container-fluid"
							style="padding-top: 54px; padding-bottom: 5px">
							<h3>제 4 장 계약당사자의 의무</h3>
							<p>
								제 7조 (회사의 의무)<br> <br> ‘트럭타’은 ‘트럭타’이 별도의 회원가입을 받지 있어
								이용고객의 신상정보를 알수 없으며 혹여 수집 되었다 하여도 본인의 승낙 없이 제 3자에게 양도 또는 누설하지
								않습니다.<br> 단, 정보 통신 윤리 위원회 또는 정부관계기관의 수사 목적 등 관계 법령에서 정한 바에
								따라 요청이 있을 경우에는 그러하지 않습니다.<br> ‘트럭타’은 계속적이고 안정적인 서비스의 제공을
								위하여 설비에 장애가 생기거나 멸실된 때에는 지체 없이 이를 수리 또는 복구합니다.<br> 다만,
								천재지변, 비상사태 또는 그 밖에 부득이한 경우에는 그 서비스를 일시 중단하거나 중지할 수 있습니다.<br>
								‘트럭타’은 회원의 서비스 이용 중 필요가 있다고 인정되는 다양한 정보에 대해서는 팝업창 또는 공지사항, 이벤트
								사항 등의 게시판으로 전달할 수 있습니다.<br> 본 사이트의 업체를 광고, 홍보해주는 역할일 뿐, 업체
								개인 간 거래로 인한 ‘트럭타’과의 문제는 제기를 할 수 없습니다. 다만 문제가 야기된 업체나 그런 업체에 대해
								‘트럭타’으로 통보 시 검토, 수정, 보완, 업체 삭제 등의 합당한 조치를 취할 것입니다. <br> <br>제
								8조 ( 이용 고객의 의무 )<br> <br> 1. ‘트럭타’의 이용고객은 이 약관 및 관계법령을
								준수하여야 합니다.<br> 2. ‘트럭타’의 이용자는 ‘트럭타’이 제공하는 서비스의 문제가 있다고
								생각되거나 다른 의견에 대해 전화, 이메일, 질문과 답변 등으로 의견을 제시할 수 있습니다.
							</p>
							<hr>

						</div>
						<div id="section5" class="container-fluid"
							style="padding-top: 54px; padding-bottom: 5px">
							<h3>제 5 장 서비스의 이용</h3>
							<p>
								제 9조 (게시물의 관리)<br> <br> ‘트럭타’은 해당하는 게시물이나 자료는 임의로 삭제,
								자료 이동을 임의적으로 변동 할 수 있습니다.<br> 하지만 광고 계약서의 의한 배너의 위치나 자료 등은
								계약자와 상의, 합의하에 변경 하도록 합니다.<br> <br> 제 10조 (서비스 내용의 추가
								또는 변경) <br> <br>‘트럭타’은 서비스 내용이 추가, 변경됨으로써 이용에 필요한 사항이
								변경될 경우 ‘트럭타’이 정하여 서비스 안내에 게시하거나 또는 별도로 공지하는 내용에 따릅니다.<br> <br>
								제 11조<br> <br> (서비스 이용 책임) 온라인 서비스 이용고객은 ‘트럭타’에서 허용한
								경우를 제외하고는 서비스를 이용하여 상품의 직접 판매 등 영업 활동을 할 수 없으며, 특히 해킹, 임의 광고,
								음란사이트를 통한 상업행위, 상용 S/W 불법 배포 등을 할 수 없습니다.<br> 이를 어기고 발생한 영업
								활동의 결과 및 손실, 관계기관에 의한 구속 등의 ‘트럭타’과의 계약서 작성을 통하지 않은 이외에 영업 활동에
								대하여 책임을 지지 않습니다.
							</p>
							<hr>
						</div>


						<div id="section6" class="container-fluid"
							style="padding-top: 54px; padding-bottom: 5px">
							<h3>제 6 장 계약해지 및 이용제한</h3>
							<p>
								제 12조 (계약해지) <br> <br> 1. 광고업체가 이용계약을 해지하고자 하는 때에는
								계약자가 온라인 또는 오프라인을 통해 ‘트럭타’에 반드시 해지 신청을 하여야 합니다.
							</p>
							<hr>
						</div>

						<div id="section7" class="container-fluid"
							style="padding-top: 54px; padding-bottom: 5px">
							<h3>제 7 장 손해배상 등</h3>
							<p>
								제 13 조 (손해배상)<br> <br> 1. ‘트럭타’은 서비스 이용과 관련하여 회원에게 발생한
								어떠한 손해에 관하여도 책임을 지지 않습니다.<br> 2. ‘트럭타’의 컨텐츠 중 ‘트럭타’의 자체
								컨텐츠가 아닌 별도의 제공처가 표기된 컨텐츠에 대해서는 모든 법적 책임이 내용을 제공한 제공처에 있으며 ‘트럭타’의
								해당 컨텐츠에 대한 법적 책임이 없습니다. <br> <br>제 14 조 (면책조항)<br>
								<br> 1. ‘트럭타’은 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는
								서비스 제공에 관한 책임이 면제되며 이를 계약자에게 개별 통보 합니다. <br>2. ‘트럭타’은 계약자의
								귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.<br> 3. ‘트럭타’은 광고 계약자가
								서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그 밖에 서비스를 통하여 얻은 자료로 인한
								손해에 관하여 책임을 지지 않습니다. <br>4. ‘트럭타’은 회원에게 제공하는 서비스에 게재한 정보,
								자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.<br> <br> 제
								15조 (관할법원)<br> <br> 요금 등 서비스 이용으로 발생한 분쟁에 대해 소송이 제기될
								경우 회사의 본사 소재지를 관할하는 법원을 전속 관할법원으로 합니다.
							</p>

							<hr>
						</div>
						<div id="section8" class="container-fluid"
							style="padding-top: 24px; padding-bottom: 45px">
							<h3>부 칙</h3>
							<p>제 1 조 (시행일) 이 약관은 2019년 9월 23일 00시부터 시행합니다.</p>

						</div>
					</div>
				</div>




			</div>
		</div>

	</section>
	<div class="col-12" style="text-align: center">

		<div class="col-12 " style="text-align: center">
			<input type="checkbox" name="diverConfirmCks"
				aria-label="Checkbox for following text input"> <input
				type="text" name="" id="" value="위 사항에 동의합니다" style="border: 0px;"
				readonly>
		</div>
		<button class="btn btn-primary col-8"
			onclick="driverCon(); return false;">기사 신청</button>
	</div>
	<%@ include file="/views/common/footer.jsp"%>

	<script src="<%=request.getContextPath()%>/plugins/mypage/js/custom.js"></script>
	<script
		src="<%=request.getContextPath()%>/plugins/mypage/popper/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/plugins/mypage/bootstrap/js/bootstrap.min.js"></script>

</body>
<script>
	function driverCon() {
			sessionStorage.setItem("isCertified", true);
			location.href = "<%=request.getContextPath()%>/driver/driverJoinTry?id=<%=cl.getId()%>";
	}
</script>