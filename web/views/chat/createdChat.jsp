<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%@ page import = "com.truckta.detail.model.vo.Detail" %>
<%@ page import = "com.truckta.client.model.vo.Client" %>


<%
	String room = (String)request.getAttribute("room");
%>

<p> hello world </p>

<script>
onload = function(){
	location.replace("<%=request.getContextPath()%>/messages/chat?room=<%=room%>");
}
</script>


