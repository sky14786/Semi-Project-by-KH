
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.truckta.file.matching.model.vo.FileMatching"%>
<%@page import="com.truckta.boardmatching.model.vo.BoardMatching"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int boardTopNull = 0;
	int imgTopNull = 0;
	
	List<BoardMatching> list = null;
	if((List)request.getAttribute("boardTop") != null){
		list = (List)request.getAttribute("boardTop");
	}else boardTopNull = 1;
	
	List<List> imgTop = null;
	if((List)request.getAttribute("imgTop") != null){
		imgTop = (List)request.getAttribute("imgTop");
	}else imgTopNull = 1;
	
%>

<%@ include file="/views/common/header.jsp"%>
<link
	href="<%=request.getContextPath()%>/plugins/mypage/css/font-awsome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/plugins/mypage/css/style.css"
	rel="stylesheet">
<%@ include file="/views/myPage/myPageHeader.jsp"%>
<body class="body-wrapper">
	<section class="page-title bg-title overlay-dark">
		<div class="container">
			<div class="row">
				<div class="col-12 text-center">
					<div class="title">
						<h3>운반 정보</h3>
					</div>
					<ol class="breadcrumb p-0 m-0 ">

					</ol>
				</div>
			</div>
		</div>
	</section>

	<!--================================
    =            Driver Posts          =
    =================================-->
    <style>
    	.img-fluid {
			height: 200px;
    	}
		.post-thumb{
			background-color: black;
			text-align: center;
		}
	</style>
	<section class="news section">
		<div class="container">
			<div class="row mt-40">
				<!-- 내부 상세데이 -->
				<%
					int size=0;
					if(boardTopNull == 0 && imgTopNull == 0){
					size = 1;
					if(list.size() >= 3){
						size = 3;
					}else{
						switch (list.size()) {
						case 2:
							size = 2;
							break;
						default:
							break;
						}
					}
					
				%>
				<%
				if(list!=null){
					for(int i=0; i<size; i++){ %>
				<%-- <%for(int i=0; i<list.size(); i++){ %> --%>
				<div class="col-lg-4 col-md-6 col-sm-8 col-sx-9 col-10 m-auto">
					<div class="blog-post">
						<div class="post-thumb">

							<!-- 상세 운반정보 -->
							<%-- "<%=request.getContextPath()%>/views/images/038.jpg" --%>
							<a href="<%=request.getContextPath()%>/detail?boardNo=<%=list.get(i).getBoardNo() %>"> <img
								src="<%=request.getContextPath()%>/images/boardMatching_images/
								<%=((FileMatching)imgTop.get(i).get(0)).getFileName() %>"
								alt="post-image" class="img-fluid">
							</a>
						</div>
						<div class="post-content">
							<div class="date">
								<h4>
								<%
									//System.out.println(list.get(i).getTkDate());
									Date date = list.get(i).getTkDate();
									String tk = new SimpleDateFormat("yyyy-MM-dd").format(date);
									String tk1= tk.substring(5, 7);
									tk = tk.substring(8, 10);
	 							%>

									<%=tk%><span><%=tk1%>월</span>
								</h4>
							</div>
							<div class="post-title">
								<!-- 상세 운반정보로 이동 -->
								<p class="mt-1 mb-0">
								<%
									String title = list.get(i).getTitle();
									if(list.get(i).getTitle().length() > 9){
										title = title.substring(0, 7);
										title += "..";
									}
								%>
								<%=title%>
								</p>
								<h2 style="font-size: 0.5rem" class="mb-0 mt-0">
									<a href="<%=request.getContextPath()%>/detail?boardNo=<%=list.get(i).getBoardNo() %>">
									<%
										String stAddr = list.get(i).getStartAddr();
										String edAddr = list.get(i).getEndAddr();
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
									</a>
								</h2>
							</div>
							<div class="post-meta">
								<ul class="list-inline">
									<li class="list-inline-item"><i class="fa fa-user-o"></i>
										<a href="#">
										<%
											String writer = list.get(i).getWrtier();
											writer = writer.substring(9, 13);
										%>
										<%=writer %>
										</a></li>
									<li class="list-inline-item"><i class="fa fa-heart-o"></i>
										<a href="#"><%=list.get(i).getCount() %></a></li>
									<!-- <li class="list-inline-item">
										<i class="fa fa-comments-o"></i>
										<a href="#">????</a>
									</li> -->
								</ul>
							</div>
						</div>
					</div>
				</div>
				<%} }
				}else{%>
				<!-- ---------- 빈데이터 ---------- -->
                <div class="col-lg-4 col-md-6 col-sm-8 col-sx-9 col-10 m-auto">
                    <div class="blog-post">
                        <div class="post-thumb">
                            <a href="#">
                                <img src="<%=request.getContextPath()%>/images/boardMatching_images/defaultImg.jpg" alt="post-image" class="img-fluid">
                            </a>
                        </div>
                        <div class="post-content">
                            <div class="date">
                                <h4>01<span>1월</span></h4>
                            </div>
                            <div class="post-title">
                                <!-- 상세 운반정보로 이동 -->
                                <p class="mt-1 mb-0">제목</p>
                                <h2 style="font-size: 0.5rem" class="mb-0 mt-0"><a href="#">운반 지역 내용</a></h2>
                            </div>
                            <div class="post-meta">
                                <ul class="list-inline">
                                    <li class="list-inline-item">
                                        <i class="fa fa-user-o"></i>
                                        <a href="#">글쓴이</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <i class="fa fa-heart-o"></i>
                                        <a href="#">조회수</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <i class="fa fa-comments-o"></i>
                                        <a href="#">메모 : 내용없음</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
        		<%} %>
				

			</div>
		</div>
	</section>

	<section class="section schedule">
		<div class="container">
			<!-- -- 리스트 --  -->
			<div class="row">
				<div class="col-12">
					<!-- Pagination -->
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/views/common/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/plugins/mypage/js/custom.js"></script>

	<script>
            $(function(){
                $('.schedule-details').click(function () {
                    console.log('스케쥴 상세페이지로 전환');
                    
                });
            });
     </script>

</html>