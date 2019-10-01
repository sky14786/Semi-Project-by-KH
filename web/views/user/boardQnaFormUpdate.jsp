<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.truckta.boardqna.q.model.vo.BoardQnaQ"%>
<%@ page import="java.util.List" %>
<%@ page import="com.truckta.file.qna.model.vo.FileQna" %>
<%@ include file="/views/common/header.jsp"%>

<%
	BoardQnaQ q = (BoardQnaQ) request.getAttribute("board_qna_q");
	List<FileQna> fileList = (List) request.getAttribute("fileList");
%>

<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>




<div class="container">
	<div class="row" style="padding-top: 10%">
		<div class="col-11 border border-light rounded "
			style="flex-align: center">
			<form style="margin: 10px" method="post"
				enctype="multipart/form-data"
				action="<%=request.getContextPath()%>/qnaupdate">
				<table class="table "
					style="text-align: center; border: 1px solid #dddddd">
					<input type="hidden"  name="boardNo" id="boardNo" value="<%=q.getBoardNo() %>"/>
					<th>제목</th>
					<tr>
						<td><input type="text" class="form-control" style="" name="title"
							"50" value="<%=q.getTitle()%>" /></td>
					</tr>
					<th>작성자</th>
					<tr>
						<td><input type="text" class="form-control" 
							value="<%=clientLogin.getId()%>" readonly /></td>
					</tr>
					<th>내용</th>
					<tr>
						<td><input type="text" class="form-control" name="etc" maxlength="2048"
							style="height: 350px;" value="<%=q.getEtc()%>" />
					</tr>
					
					<%
						if (fileList != null) {
								for (int i = 0;i < 5; i++) {%>
									<tr>
									<td>
									<%if(i<fileList.size()&&fileList.get(i)!=null){
					%>
				
					
					<img name="img_org_qnaPic<%=i+1 %>" src="<%=request.getContextPath() %>/images/qna_images/<%=fileList.get(i).getFileName() %>" width="100px" height="100px">
					<input type="hidden" name="org_qnaPic<%=i+1 %>" id="org_qnaPic<%=i+1 %>"  value="<%=fileList.get(i).getFileName() %>" />
					<button type="button" onclick="deleteImg('org_qnaPic<%=i+1 %>');" class="btn btn-primary">삭제</button>
					<button type="button" onclick="cancelImg('org_qnaPic<%=i+1 %>','<%=request.getContextPath() %>/images/qna_images/<%=fileList.get(i).getFileName() %>','<%=fileList.get(i).getFileName() %>');" class="btn btn-primary">취소</button>
				
					<%
									} 
					%>
					<input type="file" name="qnaPic<%=i+1 %>" id="qnaPic<%=i+1 %>" class="form-control btn btn-outline-secondary inputFile" 
							accept=".jpg, .png, .pdf" style="margin-top: 5px;" />
					<br/>
					</td>
					</tr>
					<%
								}
						}else {
					%>
					<tr>
					<td>
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
					<br/>
					</td>
					</tr>
					<%
						}
					%>
					
				</table>
				<input type="submit" value="수정" id="btn-add" />
			</form>
		</div>
	</div>
</div>
<%-- <script>
			function fn_boardUpdateComplete(){
				location.href="<%=request.getContextPath()%>/BoardQnaFormUpdateEndServlet";
		}
	</script> --%>
	
	
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

function deleteImg(img){
	$("img[name=img_"+img+"]").attr("src","");
	$("input[name="+img+"]").val("null");
	
}
function cancelImg(img,src,name){
	$("img[name=img_"+img+"]").attr("src",src);
	$("input[name="+img+"]").val(name);
}

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