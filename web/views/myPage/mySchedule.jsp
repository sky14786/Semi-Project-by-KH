<%@page import="java.util.ArrayList"%>
<%@page import="com.truckta.boardmatching.model.vo.BoardMatching"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int bmNull = 0;
	int matNull = 0;
	int comNull = 0;
	
	List<BoardMatching> list = new ArrayList<BoardMatching>();
	if((List)request.getAttribute("boardMatching") != null){
		list = (List)request.getAttribute("boardMatching");
	}else bmNull = 1;
	
	List<List> matList = new ArrayList<List>();
	if((List)request.getAttribute("matList") != null){
		matList = (List)request.getAttribute("matList");
	}else matNull = 1;
	
	List<List> matCompleList = new ArrayList<List>();
	if((List)request.getAttribute("matCompleList") != null){ 
		//System.out.println("null");
		matCompleList = (List)request.getAttribute("matCompleList");
	}else comNull = 1;
	
	String pageBar = (String)request.getAttribute("pageBar");
	
%>
<%@ include file="/views/common/header.jsp"%>
<!-- <!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
 -->
<!-- 부트스트랩 4 -->
<%-- <link href="<%=request.getContextPath()%>/plugins/mypage/css/font-awsome/css/font-awesome.min.css" rel="stylesheet"> --%>
<link href="<%=request.getContextPath()%>/plugins/mypage/css/style.css" rel="stylesheet">
<!-- FAVICON -->
<!-- <link href="images/favicon.png" rel="shortcut icon"> -->
<title>MY PAGE</title>
</head>
<style>
.myAddrImg {
	width: 18px;
	height: 18px;
}

.myAddrImg {
	width: 18px;
	height: 18px;
}

.bg-schedule {
	background: url(<%=request.getContextPath()%>/images/common/schedule-bg.png)
		no-repeat;
	background-size: cover;
}
</style>

<%@ include file="/views/myPage/myPageHeader.jsp"%>
<body class="body-wrapper">
	<section class="section schedule">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h3>
							운송 요청 <span class="alternate">Schedule</span>
						</h3>
						<p>화물 운송정보 리스목록</p>
						<hr>
					</div>
				</div>
			</div>

			<!-- -- 리스트 --  -->

			<div class="row">
				<div class="col-12">

					<!-- 타이틀 (제목) -->
					<div class="schedule-tab">
						<ul class="nav nav-pills text-center">
							<li class="nav-item" value='0'><a class="nav-link active navC"
								href="#nov20" data-toggle="pill"> 전 체 <span>게시글 요청목록</span>
							</a></li>
							<li class="nav-item" value='1'><a class="nav-link navC" href="#nov21"
								data-toggle="pill"> 운송현황 <span>진행중인 운송목록</span>
							</a></li>
							<li class="nav-item" value='2'><a class="nav-link navC" href="#nov22"
								data-toggle="pill"> 운송완료 <span>완료 된 운송목록</span>
							</a></li>
						</ul>
					</div>
					<!-- 스케쥴 리스트 -->
					<div class="schedule-contents bg-schedule">
						<div class="tab-content" id="pills-tabContent">
							<div class="tab-pane fade show active schedule-item" id="nov20">
								<!-- Headings -->
								<ul class="m-0 p-0">
									<li class="headings">
										<div class="time">화물정보</div>
										<div class="speaker">도착지</div>
										<div class="subject">메모</div>
										<div class="venue">요청만료날짜</div>
									</li>
<!-- ------------------------------------------------------------------------- -->
<!-- --------------------------      data      ------------------------------- -->
<!-- ------------------------------------------------------------------------- -->
									<!-- Schedule Details -->
									<%if(bmNull != 1){ %>
									<%for(int i=0; i<list.size(); i++){ %>
									<li class="schedule-details" value="<%=list.get(i).getBoardNo() %>">
										<div class="block">
											
											<!-- 화물정보 -->
											<div class="time">
												<i class="fa fa-clock-o"></i> <span class="time">
												<%-- <%=list.get(i).getTitle() %> --%>
												<%
													String title = list.get(i).getTitle();
													if(list.get(i).getTitle().length() > 8){
														title = title.substring(0, 6);
														title += "..";
													}
												%>
												<%=title%>
												</span>
											</div>
											<!-- 도착지 -->
											<div class="speaker">
												<img class='myAddrImg' src="<%=request.getContextPath()%>/images/common/ico-truck.png"
													> <span class="name">
													<%
														String edAddr = list.get(i).getEndAddr();
														String edTmp[] = edAddr.split(",");
														for(int j=1; j<edTmp.length-1; j++){
															edAddr = edTmp[j];
														}
														edAddr = edAddr.substring(0, 6);
													%>
													<%=edAddr %>
													</span>
											</div>
											<!-- 메모 -->
											<div class="subject">
												<a href="<%=request.getContextPath()%>/detail?boardNo=<%=list.get(i).getBoardNo() %>" >
													
												<%=list.get(i).getMemo() %>
												</a>
											</div>
											<!-- 요청만료날짜 -->
											<div class="venue"><%=list.get(i).getTkDate() %></div>
										</div>
									</li>
									<%} %>
									<%} %>
									<!-- Schedule Details -->
								</ul>
							</div>
							
<!-- ------------------------------------------------------------------------------------------------------------- -->							
							<div class="tab-pane fade schedule-item" id="nov21">
								<!-- Headings -->
								<ul class="m-0 p-0">
									<li class="headings">
										<div class="time">배송날짜</div>
										<div class="speaker">목적지-도착지</div>
										<div class="subject">연락처</div>
										<div class="venue">협상가격</div>
										
									</li>
									
									<%if(matNull != 1){ %>
									<%for(int i=0; i<matList.size(); i++){ %>
									
									<!-- Schedule Details -->
									<li class="schedule-details" value="<%=matList.get(i).get(5) %>">
										<div class="block">
											
											<!-- 배송날 -->
											<div class="time">
												<i class="fa fa-clock-o"></i> <span class="time">
												<%=matList.get(i).get(0) %>
												</span>
											</div>
											<!-- 목적지-도착지 -->
											<div class="speaker">
												<img class='myAddrImg' src="<%=request.getContextPath()%>/images/common/ico-truck.png"
													> <span class="name">
													<%
													String stAddr = (String)(matList.get(i)).get(1);
													String edAddr = (String)(matList.get(i)).get(2);
													String stTmp[] = stAddr.split(",");
													String edTmp[] = edAddr.split(",");
													for(int j=1; j<stTmp.length-1; j++){
														stAddr = stTmp[j];
													}
													stAddr = stAddr.substring(0, 6);
													stAddr += " - ";
													
													for(int j=1; j<edTmp.length-1; j++){
														edAddr = edTmp[j];
													}
													edAddr = edAddr.substring(0, 6);
													stAddr += edAddr;

													%>
													<%=stAddr %>
													</span>
											</div>
											<!-- 연락처 -->
											<div class="subject">
												<a href="<%=request.getContextPath()%>/detail?boardNo=<%=matList.get(i).get(5) %>" >
												<%=matList.get(i).get(3) %>
												</a>
											</div>
											<!-- 가격 -->
											<div class="venue">
												<%=matList.get(i).get(4) %>
												<a href="#" onClick="matConfirm(); return false;">수락</a>
											</div>
											
										</div>
									</li>
									<%} %>
									<%} %>
								</ul>
							</div>
<!-- ------------------------------------------------------------------------------------------------------------- -->
							<div class="tab-pane fade schedule-item" id="nov22">
								<!-- Headings -->
								<ul class="m-0 p-0">
									<li class="headings">
										<div class="time">거래완료 일자</div>
										<div class="speaker">운송자</div>
										<div class="subject">도착지</div>
										<div class="venue">금액</div>
									</li>

									<%if(comNull != 1){ %>
									<%for(int i=0; i<matCompleList.size(); i++){ %>
									<!-- Schedule Details -->
									<li class="schedule-details" value="matCompleList.get(i).get(4)">
										<div class="block">
					
											<!-- 거래완료 일자 -->
											<div class="time">
												<i class="fa fa-clock-o"></i> <span class="time">
												<%=matCompleList.get(i).get(0) %>
											</span>
											</div>
											<!-- 운송자 -->
											<div class="speaker">
												<img class='myAddrImg' src="<%=request.getContextPath()%>/images/common/ico-driver.png"
													> <span class="name">
													<%=matCompleList.get(i).get(1) %>
													</span>
											</div>
											<!-- 도착지 -->
											<div class="subject">
												<a href="<%=request.getContextPath()%>/detail?boardNo=<%=matCompleList.get(i).get(4) %>" >
														
														
												<%
													String edAddr = (String)(matCompleList.get(i)).get(2);
													String edTmp[] = edAddr.split(",");
													for(int j=0; j<edTmp.length-1; j++){
														edAddr = edTmp[j];
													}
													%>
												<%=edAddr %>
												</a>
											</div>
											<!-- 가격 -->
											<div class="venue"><%=matCompleList.get(i).get(3) %></div>
										</div>
									</li>

									<%} %>
									<%} %>
								</ul>
							</div>
							<div>
								<p>* <small>상위 10가지만 표시됩니다</small></p>
							</div>
						</div>
					</div>

					<!-- Pagination -->
					<div class="col-12 text-center ">
						<nav class="d-flex justify-content-center">
							<ul class="pagination">
								<%=pageBar %>
							</ul>
						</nav>
					</div>
					<!-- Pagination -->

				</div>
			</div>
		</div>
		<script type="text/javascript">
			function matConfirm() {
				var cf = confirm("수락하시겠습니까?");
				if(cf == true){
				  //document.write("확인");
				  location.href="<%=request.getContextPath()%>/confirm";
				}else
					return false;
			}

			$(function () {
				$('.navC').click(function () {
					var ckp = $(this).parent().attr('value');
					var myPage = $('.pagination');
					if(ckp == 0){
						$('.pagination').show();
					}else{
						$('.pagination').hide();
					}
				});

				$('.schedule-details').click(function () {
					//console.log($(this).attr('value'));
					var mybNum= $(this).attr('value');
					location.href = '<%=request.getContextPath()%>/detail?boardNo='+mybNum;
				});
			});
		</script>
	
	</section>
	<%@ include file="/views/common/footer.jsp"%>

	<script src="<%=request.getContextPath()%>/plugins/mypage/js/custom.js"></script>
	<script src="<%=request.getContextPath()%>/plugins/mypage/popper/popper.min.js"></script>
  	<script src="<%=request.getContextPath()%>/plugins/mypage/bootstrap/js/bootstrap.min.js"></script>

</body>
>>>>>>> 003ec45379dd266d5eec29ca7b51042110b1ffd8:web/views/myPage/mySchedule.jsp
</html>