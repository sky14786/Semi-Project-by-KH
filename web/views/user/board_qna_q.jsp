<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.truckta.boardqna.q.model.vo.BoardQnaQ" %>
<%@ page import="java.util.List" %> 
<%
	List<BoardQnaQ> list=(List)request.getAttribute("list");
%>

    
<!DOCTYPE html>
<html>
<%@ include file="/views/common/header.jsp"%>
<head>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.js"></script>
<!-- <link  href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css"> -->
<link href="<%=request.getContextPath()%>/css/board_qna.css?var=1.1" rel="stylesheet" />
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<title>Insert title here</title>
</head>
<body>

<table id="myTable" class="display table-striped" style="text-align :center; border: 1px">
<h2>Q&A 게시판</h2>
    <thead>
        <tr>
            <th style="background-color: #eeeeee; text-align :center;">번호</th>
            <th style="background-color: #eeeeee; text-align :center;">제목</th>
            <th style="background-color: #eeeeee; text-align :center;">작성자</th>
            <th style="background-color: #eeeeee; text-align :center;">작성일</th>
        </tr>
    </thead>
    <tbody>
           <%for(BoardQnaQ q : list) {%>
				<tr>
					<td><%=q.getBoardNo() %></td>
					<td><%=q.getTitle() %></td>
					<td><%=q.getqUser() %></td>
					<td><%=q.getHireDate() %></td>
				</tr>
			<%} %>   
    </tbody>
    </table>
 
  <a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
<script>
$(document).ready( function () {
    $('#myTable').DataTable();
} );
</script>
</body>
</html>