<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message=(String)request.getAttribute("message");
	String location=(String)request.getAttribute("location");
	String script=(String)request.getAttribute("script");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지창</title>
</head>
<body>
	<script>
		alert('<%=message%>');
		<%=script!=null?script:""%>
		location.href='<%=request.getContextPath()%><%=location%>';
	</script>
</body>
</html>




