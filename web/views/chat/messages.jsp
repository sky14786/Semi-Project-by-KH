<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.truckta.client.model.vo.Client"%>
<%@ page import="java.util.List"%>
<%@ page import="com.truckta.chat.model.vo.MessageList"%>

<%
	Client c = (Client) request.getAttribute("loggedInClient");
	List<MessageList> list = (List) request.getAttribute("list");
	List<String> profileList = (List) request.getAttribute("profileList");
%>

<script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
     rel="stylesheet">
<script   src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<link   href="<%=request.getContextPath()%>/css/conversation.css"
     rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/chat.css"   rel="stylesheet">
</head>

<div></div>
<br/><br/><br/>


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


		<%int i = 0 ;
			if (list != null && !list.isEmpty()) {
				for (MessageList ml : list) {
		%>
		<a href="<%=request.getContextPath()%>/messages/chat?room=<%=ml.getRoomNo()%>">
			<div class="d-flex mt-3 py-2 border-bottom">
			<%if(profileList.get(i)!=null){ %>
				<img class="img-sm rounded-circle"
					src="<%=request.getContextPath()%>/images/profile_images/<%=profileList.get(i) %>"
					alt="profile image">
				<%i++;
				}else{ %>
				<img class="img-sm rounded-circle"
					src="<%=request.getContextPath()%>/images/avatars/User 01a.png"
					alt="profile image">
				<%
				i++;} %>
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