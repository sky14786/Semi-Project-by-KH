<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<%
	String room = (String)request.getAttribute("room");
%>



<script>
onload = function(){
	location.replace("<%=request.getContextPath()%>/messages/chat?room=<%=room%>");
}
</script>


