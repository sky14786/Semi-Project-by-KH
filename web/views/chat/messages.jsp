<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.truckta.client.model.vo.Client"%>
<%@ page import="java.util.List"%>
<%@ page import="com.truckta.chat.model.vo.MessageList"%>

<%
	Client c = (Client) request.getAttribute("loggedInClient");
	List<MessageList> list = (List) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<!-- style.css -->
<link href="<%=request.getContextPath()%>/css/messagebox.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/chat.css" rel="stylesheet">
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<style>
form {
	background: none;
}

form:active {
	background: rgb(240, 240, 240);
}
</style>

	<div id="chat-container" class="container-fluid ">

		<div class="navbar">
			<a href="<%=request.getContextPath()%>/views/common/header.jsp"
				class="p-2 "> <i class="fas fa-chevron-left fa-3x"></i></a>
			<div class="p-2 chat-container-title ">
				<i class="far fa-envelope fa-2x"></i>
			</div>
			<div></div>
		</div>


		<%
			if (list != null && !list.isEmpty()) {
				for (MessageList ml : list) {
		%>
		<a href="<%=request.getContextPath()%>/messages/chat?room=<%=ml.getRoomNo()%>">
			<div class="d-flex mt-3 py-2 border-bottom">
				<img class="img-sm rounded-circle"
					src="<%=request.getContextPath()%>/images/avatars/User 01a.png"
					alt="profile image">
				<div class="wrapper ml-2">
					<p class="mb-n1 font-weight-semibold"><%=ml.getUserA() %></p>
					<small><%=ml.getRoomNo() %></small>
				</div>
				<small class="text-muted ml-auto"><%=ml.getCreatedDate() %></small>
			</div>
		</a>
		<%
				}
			}
		%>



	<script>
		function aa() {
			console.log("aaaa")
		}
	</script>



</body>
</html>