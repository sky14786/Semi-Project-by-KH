<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.truckta.boardqna.q.model.vo.BoardQnaQ"%>
<%@ page import="com.truckta.boardqna.a.model.vo.BoardQnaA"%>
<%@ page import="java.util.List"%>
<%@ page import="com.truckta.file.qna.model.vo.FileQna" %>
<%
	BoardQnaQ q = (BoardQnaQ) request.getAttribute("board_qna_q");
	/* BoardQnaA a = (BoardQnaA) request.getAttribute("board_qna_a"); */
	List<BoardQnaA> list = (List) request.getAttribute("list");
	List<FileQna> fileList = (List) request.getAttribute("fileList");
	/* System.out.println(a.getaNo()); */
%>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<%@ include file="/views/common/header.jsp"%>
<style>
section#board-container {
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

section#board-container h2 {
	margin: 10px 0;
}

table#tbl-comment {
	width: 580px;
	margin: 0 auto;
	border-collapse: collapse;
	clear: both;
}

table#tbl-comment tr td {
	border-bottom: 1px solid;
	border-top: 1px solid;
	padding: 5px;
	text-align: left;
	line-height: 120%;
}

table#tbl-comment tr td:first-of-type {
	padding: 5px 5px 5px 50px;
}

table#tbl-comment tr td:last-of-type {
	text-align: right;
	width: 100px;
}

table#tbl-comment button.btn-update2 {
	display: none;
}

table#tbl-comment tr:hover {
	background: lightblue;
}

table#tbl-comment tr:hover button.btn-update2 {
	display: inline;
}

table#tbl-comment sub.comment-writer {
	color: navy;
	font-size: 14px
}

table#tbl-comment sub.comment-date {
	color: tomato;
	font-size: 10px
}
</style>

<section id="board-container">
	<div class="container">
		<div class="row" style="padding-top: 10%">
			<div class="col-11 border border-light rounded "
				style="flex-align: center">
				<form style="margin: 10px"
					action="<%=request.getContextPath()%>/board/boardFormEnd?id=<%=clientLogin.getId()%>">
					<table class="table "
						style="text-align: center; border: 1px solid #dddddd">
						<th>제목</th>
						<tr>

							<td><input type="text" class="form-control" style=""
								"50" value="<%=q.getTitle()%>" readonly /></td>
						</tr>
						<th>작성자</th>
						<tr>
							<td><input type="text" class="form-control"
								value="<%=q.getqUser()%>" readonly /></td>
						</tr>
						<th>내용</th>
						<tr>
							<td><input type="text" class="form-control" maxlength="2048"
								style="height: 350px;" value="<%=q.getEtc()%>" readonly />
						</tr>
						<tr>
						<%
						if (fileList != null) { 
								for (int i = 0; i < fileList.size(); i++) {
						%>
				
						<img src="<%=request.getContextPath() %>/images/profile_images/<%=fileList.get(i).getFileName() %>" width="100px" height="100px">
						<%
									}
								}
						%>
						<hr>
						</tr>
						
					</table>

				</form>
			</div>
		</div>
	</div>
	<%
		if (clientLogin != null
				&& (clientLogin.getId().equals(q.getqUser()) || clientLogin.getId().equals("admin"))) {
	%>
	<tr>
		<td colspan='2' style="text-align: center;">
			<button class="btn-update btn btn-outline-primary" value="<%=q.getType()%>"/>수정하기</button>
		</td>
		<button class="btn-delete btn btn-outline-primary" onclick="" value="<%=q.getType()%>" />삭제하기</button>
		</td>
	</tr>
	<%
		}
	%>

	<%--  <section id="board-container">
		<h2>게 시 판</h2>
		<table id="tbl-board">
			<tr>
				<th>제 목</th>
				<td><%=q.getTitle() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><td><%=q.getqUser() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=q.getEtc() %></td>
			</tr>
			<%if(clientLogin!=null&&
				(clientLogin.getId().equals(q.getqUser())
					|| clientLogin.getId().equals("admin"))) {%>
			<tr>
				<td colspan='2' style="text-align:center;">
					<input type="button" value="수정하기" onclick=""/>
					<input type="button" value="삭제하기" onclick=""/>
				</td>
			</tr>
			<%} %>									
		 </table>  --%>


	<!-- 댓글화면 구현 -->
	<div id="comment-container" style="padding-top: 10%">
		<div class="comment-editor">
			<form
				action="<%=request.getContextPath()%>/boardqnacomment/commentInsert"
				method="post">
				<input type="hidden" name="qNo" value="<%=q.getBoardNo()%>" /> <input
					type="hidden" name="writer"
					value="<%=clientLogin != null ? clientLogin.getId() : ""%>" /> <input
					type="hidden" name="aNo" value="0" />
				<textarea name="etc" rows="3" cols="60"></textarea>
				<button type="submit" id="btn-insert " class="btn btn-primary">등록</button>
			</form>
		</div>
	</div>
	<script>
			$(function(){
				$("textarea[name=boardCommentContent]").focus(function(){
					if(<%=clientLogin == null%>){
						alert("로그인 후 등록할 수 있습니다.!");
						$("#userId").focus();
					}
				});
				
				
			});
		</script>

	<table id="tbl-comment">

		<%
			if (list != null && !list.isEmpty()) {
				/* for (BoardQnaA a : list) { */
				for (int i = 0; i < list.size(); i++) {
		%>

		<tr class="level1">
<%-- 			<td><input type="hidden" name="org<%=i%>"
				value="<%=list.get(i).getaNo()%>"> <sub
				class="comment-writer"> <%=list.get(i).getWriter()%>
			</sub> <sub class="comment-date"> <%=list.get(i).getHireDate()%>
			</sub> <br /> <%=list.get(i).getEtc()%></td>
			<td>
				<button class="btn-update2 btn btn-outline-primary">수정</button> <%
 	if (clientLogin != null && ("admin".equals(clientLogin.getName())
 					|| list.get(i).getWriter().equals(clientLogin.getId()))) {
 %>
				<button class="btn-delete2 btn btn-outline-primary"
					value="<%=list.get(i).getaNo()%>">삭제</button> <%
 	}
 %>
			</td> --%>
			<td><input type="hidden" name ="org_aNo" value="<%=list.get(i).getaNo()%>"></td>
			<td>
				<sub class="comment-writer">글쓴이 : <%=list.get(i).getWriter() %></sub>&nbsp;
				<sub class="comment-date">작성일 : <%=list.get(i).getHireDate() %></sub><br><br>
				<%=list.get(i).getEtc() %>
			</td>
			<td>
				<button class="btn-update2 btn btn-outline-primary">수정</button><br>
				<%if(clientLogin!=null && (clientLogin.getName().equals("관리자")||clientLogin.getId().equals(list.get(i).getWriter()))) {%>
				<button class="btn-delete2 btn btn-outline-primary">삭제</button>
			<%} %>
			</td>
			
		</tr>
		<%
			}
			}
		%>


	</table>
	<script>
	
	   
				 
	 
		 $(function(){
			$('.btn-delete').click(function(){
				if(<%=clientLogin == null%>){
					alert("로그인 후 사용이 가능합니다.");
					return
				}
				if(confirm("정말로 삭제하시겠습니까?")){
					location.href="<%=request.getContextPath()%>/BoardQnaFormDeleteServlet?no=<%=q.getBoardNo()%>&type="+$(this).val();
				}
			}) ;
			
			
				$('.btn-delete2').click(function(){
					if(<%=clientLogin == null%>){
						alert("로그인 후 사용이 가능합니다.");
						return
					}
					if(confirm("정말로 삭제하시겠습니까?")){
					location.href="<%=request.getContextPath()%>/board/boardCommentDelete?no=<%=q.getBoardNo()%>&aNo="+$(this).val();
					}
				}) ;
				
				
			
			$('.btn-update').click(function(){
			location.href="<%=request.getContextPath()%>/board/boardFormUpdate?no=<%=q.getBoardNo()%>";
			});
			
			$('.btn-update2').click(function(){
				var btn_update2 = $(this);
				var thisTr = btn_update2.parent().parent();
				var thisTd = thisTr.children();
				var chamsu = thisTd.eq(0).children().eq(0).val();
				/* console.log(thisTr);
				console.log(thisTd); */
				/* console.log(chamsu);  */
				
			 	 if(<%=clientLogin != null%>){
					var tr=$('<tr>');
					var td=$("<td>").css({"display":"none","text-align":"left"}).attr("colspan",2);
					var form=$("<form>").attr({
								"action":"<%=request.getContextPath()%>/board/boardCommentUpdate",
								"method":"post"
							});
					var aNo=$("<input>").attr({
							"type":"hidden","name":"aNo",
							"value":$("input[name=org_aNo]").val()
						});
					var writer=$("<input>").attr({
							"type":"hidden","name":"writer",
							"value":"<%=clientLogin != null ? clientLogin.getId() : ""%>"
						});
					
					var etc=$("<textarea>").attr({
							"name":"etc","cols":"60","rows":"2"
						});
					var btn=$("<button>").attr({
							"type":"submit","class":"btn-insert2"
						}).html("등록");
					
					form.append(aNo).append(writer).append(etc).append(btn);
					td.append(form);
					tr.html(td);
					tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
																					
					$(this).off("click"); 

	
					tr.find("form").submit(function(e){
						if(<%=clientLogin == null%>){
							alert("로그인 후에 이용해주세요!");
							e.preventDefault();
						}
						var len=$(this).children("textarea").val().trim().length;
						if(len==0){
							alert("내용을 입력하세요");
							e.preventDefault();
						} 
					});				
				}else{
					alert("로그인후 이용할 수 있습니다.");
					$("#id").focus();
				}
				
			});
			$('.btn-reply').click(function(){
				
				if(<%=clientLogin != null%>){
					var tr=$('<tr>');
					var td=$("<td>").css({"display":"none","text-align":"left"}).attr("colspan",2);
					var form=$("<form>").attr({
								"action":"<%=request.getContextPath()%>/board/boardCommentUpdate",
								"method":"post"
							});
					var aNo=$("<input>").attr({
							"type":"hidden","name":"aNo",
							"value":$("input[name=org_aNo]").val()
						});
					var writer=$("<input>").attr({
							"type":"hidden","name":"writer",
							"value":"<%=clientLogin != null ? clientLogin.getId() : ""%>"
						});
					
					var etc=$("<textarea>").attr({
							"name":"etc","cols":"60","rows":"2"
						});
					var btn=$("<button>").attr({
							"type":"submit","class":"btn-insert2"
						}).html("등록");
					
					form.append(aNo).append(writer).append(etc).append(btn);
					td.append(form);
					tr.html(td);
					tr.insertAfter($(this).parent().parent()).children("td").slideDown(800);
																					
					$(this).off("click"); 

	 //자료저장 이벤트등록
					tr.find("form").submit(function(e){
						if(<%=clientLogin == null%>){
							alert("로그인 후에 이용해주세요!");
							e.preventDefault();
						}
						var len=$(this).children("textarea").val().trim().length;
						if(len==0){
							alert("내용을 입력하세요");
							e.preventDefault();
						}
					});
					
					
				}else{
					alert("로그인후 이용할 수 있습니다.");
					$("#id").focus();
				}
			})
		 }); 
		 
		 
	</script>
</section>
<%@ include file="/views/common/footer.jsp"%>
</html>