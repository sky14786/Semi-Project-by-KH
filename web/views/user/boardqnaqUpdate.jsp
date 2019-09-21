<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>
<!-- <link href="../../css/clientUpdate-Style.css?ver=1.1" rel="stylesheet" />
<script src="../../js/clientUpdate-js.js?ver=1.1" charset="utf-8"></script> -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/css/signUpDriver-Style.css?ver=1.1" rel="stylesheet" />
<script src="<%=request.getContextPath()%>/js/adminUpdateUser-js.js?ver=1.3" charset="utf-8"></script>
<%@ page import="java.util.List,com.truckta.boardqna.q.model.vo.BoardQnaQ,com.truckta.file.qna.model.vo.FileQna"%>
<%
	request.setCharacterEncoding("UTF-8");
	BoardQnaQ board = (BoardQnaQ) request.getAttribute("boardQnaQ");
	List<FileQna> fileList = (List) request.getAttribute("fileList");
	/* if(request.getAttribute("fileList")!=null){
		fileList = (List) request.getAttribute("fileList");
	} */
	
%>
<%-- <div class="container"> --%>
<!-- <br /> <br /> <br /> -->

<script>
	//certifiedCheck();
</script>

<div class="container">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-1"></div>
		<div class="col-6">
			<br>
			<br>
			<br>
			<br>
			<h2>QnA게시글 수정</h2>
			<hr>
			<form
				action="<%=request.getContextPath()%>/admin/adminBoardQnaQUpdate"
				method="post" name="sendform" enctype="multipart/form-data">
				<!-- onsubmit="return checkData();" -->
				<div class="form-group">
					유형 : <%=board.getType()==0?"질문":(board.getType()==1?"건의":"신고")%>&nbsp;&nbsp;
					<br>상태 : <%=board.getStatus()==0?"답변전":(board.getStatus()==1?"답변완료":"해결")%><br><hr>
					<label for="id">제목</label> <input type="text" name="id" id="id"
						class="form-control" value="<%=board.getTitle()%>"/>
				</div>
				<div class="form-group">
					<label for="name">내용</label> <textarea rows="15"class="form-control" id="etc" name ="etc"><%=board.getEtc() %></textarea>
				</div>
					<div class='bigPictureWrapper'>
						<div class='bigPicture'>
						</div>
					</div>
				<div class="form-group">
					<label for="carPic">Truck Picture</label><hr>
					<%
						if (fileList != null) {
								for (int i = 0;i < 5; i++) {
									if(fileList.get(i)!=null){
					%>
					<img src="<%=request.getContextPath() %>/images/profile_images/<%=fileList.get(i).getFileName() %>" width="100px" height="100px">
					<input type="hidden" name="org_qnaPic<%=i+1 %>" id="org_qnaPic<%=i+1 %>"  value="<%=fileList.get(i).getFileName() %>" />
					<%			
									} 
					
					%>	
					<input type="file" name="qnaPic<%=i+1 %>" id="qnaPic<%=i+1 %>" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<br/><hr>
					<%
								}
						}else {
					%>
						<input type="file" name="qnaPic1" id="qnaPic1" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
						<input type="file" name="qnaPic2" id="qnaPic2" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
						<input type="file" name="qnaPic3" id="qnaPic3" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
						<input type="file" name="qnaPic4" id="qnaPic4" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
						<input type="file" name="qnaPic5" id="qnaPic5" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<br/><hr>
					<%
						} 
					%>
					
				
				</div>
				<div style="text-align: center;">
					<button type="submit" onclick="checkData();" class="btn btn-primary">수정</button>
					<button type="button" onclick="history.back();" class="btn btn-primary">뒤로</button>
				</div>
			</form>
		</div>
		
		<div class="col-1"></div>
		<div class="col-2"></div>
	</div>
	</div>
<script>

$(document).ready(function (e){
	
	$(document).on("click","img",function(){
		var path = $(this).attr('src')
		showImage(path);
	});//end click event
	
	function showImage(fileCallPath){
	    
	    $(".bigPictureWrapper").css("display","flex").show();
	    
	    $(".bigPicture")
	    .html("<img src='"+fileCallPath+"' >")
	    .animate({width:'100%', height: '100%'}, 1000);
	    
	  }//end fileCallPath
	  
	$(".bigPictureWrapper").on("click", function(e){
	    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
	    setTimeout(function(){
	      $('.bigPictureWrapper').hide();
	    }, 1000);
	  });//end bigWrapperClick event
});
</script>


<style>
		.bigPictureWrapper {
			position: absolute;
			display: none;
			justify-content: center;
			align-items: center;
			top:0%;
			width:100%;
			height:100%;
			background-color: gray; 
			z-index: 100;
			background:rgba(255,255,255,0.5);
		}
		.bigPicture {
			position: relative;
			display:flex;
			justify-content: center;
			align-items: center;
		}
		
		.bigPicture img {
			width:600px;
		}
</style>

<%@ include file="/views/common/footer.jsp"%>
