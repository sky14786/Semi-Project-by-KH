<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>chat</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
<link href="<%=request.getContextPath()%>/css/conversation.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/chat.css" rel="stylesheet">
</head>

<header>
	<div id="chat-container" class="container-fluid ">
		<br>
		<div class="navbar">
			<a href="<%=request.getContextPath()%>/messages" class="p-2 "> <i
				class="fas fa-chevron-left fa-3x"></i></a>
			<div class="p-2 chat-container-title ">
				<i class="far fa-envelope-open fa-2x"></i>
			</div>
			<div></div>
		</div>
		<br> <br>
</header>


<body>

	<div class="text-history" name="text-history" id="text-history">
		<div class="message-feed feed" id="msg" name="msg">
			<div class="pull-left">
				<img src="<%=request.getContextPath()%>/images/avatars/User 01a.png"
					alt="" class="mr-2 img-avatar">
			</div>
			<div class="media-body">
				<div class="mf-content bg-secondary text-dark">Quisque
					consequat arcu eget odio cursus, ut tempor arcu vestibulum. Etiam
					ex arcu, porta a urna non, lacinia pellentesque orci. Proin semper
					sagittis erat, eget condimentum sapien viverra et. Mauris volutpat
					magna nibh, et condimentum est rutrum a. Nunc sed turpis mi. In eu
					massa a sem pulvinar lobortis.</div>
				<small class="mf-date"><i class="far fa-clock"></i>
					20/02/2015 09:00 AM</small>
			</div>
		</div>

		<div class="message-feed right" id="msg" name="msg">
			<div class="media-body">
				<div class="mf-content bg-primary text-white">Mauris volutpat
					magna nibh, et condimentum est rutrum a. Nunc sed turpis mi. In eu
					massa a sem pulvinar lobortis.</div>
				<small class="mf-date"><i class="far fa-clock"></i>
					20/02/2015 09:30 AM</small>
			</div>
		</div>

		<div class="message-feed media" id="msg" name="msg">
			<div class="pull-left">
				<img src="<%=request.getContextPath()%>/images/avatars/User 01a.png"
					alt="" class="mr-2 img-avatar">
			</div>
			<div class="media-body">
				<div class="mf-content bg-secondary text-dark">Etiam ex
					arcumentum</div>
				<small class="mf-date"><i class="far fa-clock"></i>
					20/02/2015 09:33 AM</small>
			</div>
		</div>

		<div class="media-body message-feed right" id="msg" name="msg">
			<div class="mf-content bg-primary text-white">Etiam nec
				facilisis lacus. Nulla imperdiet augue ullamcorper dui ullamcorper,
				eu laoreet sem consectetur. Aenean et ligula risus. Praesent sed
				posuere sem. Cum sociis natoque penatibus et magnis dis parturient
				montes,</div>
			<small class="mf-date"><i class="far fa-clock"></i>
				20/02/2015 10:10 AM</small>
		</div>

		<div class="message-feed media" id="msg" name="msg">
			<div class="pull-left">
				<img src="<%=request.getContextPath()%>/images/avatars/User 01a.png"
					alt="" class="mr-2 img-avatar">
			</div>
			<div class="media-body">
				<div class="mf-content bg-secondary text-dark">Cum sociis
					natoque penatibus et magnis dis parturient montes, nascetur
					ridiculus mus. Etiam ac tortor ut elit sodales varius. Mauris id
					ipsum id mauris malesuada tincidunt. Vestibulum elit massa,
					pulvinar at sapien sed, luctus vestibulum eros. Etiam finibus
					tristique ante, vitae rhoncus sapien volutpat eget</div>
				<small class="mf-date"><i class="far fa-clock"></i>
					20/02/2015 10:24 AM</small>
			</div>
		</div>
	</div>



	<br>
	<br>
	<br>

</body>






<footer>
	<div class="fixed-bottom msb-reply">
		<Input type="hidden" id="userId" value="user01">
		<textarea name="text" id="text" class="text"
			placeholder="What's on your mind..."></textarea>
		<button onclick="send();" id="enter">
			<i class="far fa-paper-plane"></i>
		</button>
	</div>
</footer>

<!-- 메세지 보낼때 -->
<script>

//creating web socket
	var socket = new WebSocket("ws://localhost:9393/<%=request.getContextPath()%>/messages/socket");
	socket.onopen = function(e) {
		//console.log(e);
	}

	socket.onmessage = function(e) {
		console.log(e);
		var d = JSON.parse(e.data);
		console.log(d);
		console.log(d["msg"]);
	}

	function send() {

		// creating a JSON and Sending it to Java 
		var msg = {
			"userId" : "user01",
			"msg" : $('#text').val(),
			"room" : "01",
			"flag" : "text-msg-yo",
			"receiveId" : "user02"
		};
		socket.send(JSON.stringify(msg));

		var date = document.createTextNode(formatAMPM(new Date()));

		var div = $("<div>").attr({
			"class" : "mf-content bg-primary text-white"
		});

		var small = $("<small>").attr({
			"class" : "mf-date"
		});

		var wrap = $("<div>").attr({
			"class" : "message-feed right"
		});

		div.append($("#text").val());
		small.append("<i class='far fa-clock'></i> ").append(date);
		wrap.append(div).append(small);

		$("#text-history").append(wrap);

		$("#text").val("");
		
		socket.onclose;
	}

	// 날짜/ 시간
	function formatAMPM(date) {
		var hours = date.getHours();
		var minutes = date.getMinutes();
		var ampm = hours >= 12 ? 'PM' : 'AM';
		hours = hours % 12;
		hours = hours ? hours : 12; // the hour '0' should be '12'
		minutes = minutes < 10 ? '0' + minutes : minutes;
		var strTime = hours + ':' + minutes + ' ' + ampm;
		return strTime;
	}

	$('#text').keyup(function(event) {
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if (keycode == '13') {
			send();
		}
	});
</script>



</html>