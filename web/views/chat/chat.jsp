<%@ page language="java" contentType="text/html;   charset=UTF-8"
     pageEncoding="UTF-8"%>
<%@ page import="com.truckta.client.model.vo.Client"%>
<%@ page import="java.util.List"%>
<%@ page import="com.truckta.chat.model.vo.ChatHistory"%>
<%
     Client c = (Client) request.getAttribute("loggedInClient");
     List<ChatHistory> list = (List) request.getAttribute("list");
     String room = (String)request.getAttribute("room");
     String id = c.getId();
     
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>chat</title>
<meta name="viewport" content="width=device-width,   initial-scale=1">
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
<header>
     <div id="chat-container" class="container-fluid ">
          
          <div class="navbar">
              <a   href="<%=request.getContextPath()%>/messages" class="p-2   "> <i
                   class="fas fa-chevron-left   fa-3x"></i></a>
              <div class="p-2 chat-container-title ">
                   <i class="far fa-envelope-open   fa-2x"></i>
              </div>
              <div></div>
          </div>
          
</header>
<body>
     <%
          if (list != null || !list.isEmpty()) {
              for (ChatHistory ch : list) {
                if(!c.getId().equals(ch.getSender())){
     %>
     <div class="text-history" name="text-history"    id="text-history">
          <div class="message-feed feed" id="msg"    name="msg">
              <div class="pull-left">
                   <img    src="<%=request.getContextPath()%>/images/avatars/User 01a.png"
                        alt="" class="mr-2 img-avatar">
              </div>
              <div class="media-body">
                   <div class="mf-content bg-secondary    text-dark"><%=ch.getChatText()%></div>
                   <small class="mf-date"><i class="far    fa-clock"></i> <%=ch.getSentDate()%></small>
              </div>
          </div>
          
          <%} else { %>
          
          <div class="message-feed right" id="msg"    name="msg">
              <div class="media-body">
                   <div class="mf-content bg-primary    text-white"><%=ch.getChatText()%></div>
                   <small class="mf-date"><i class="far    fa-clock"></i>
                        <%=ch.getSentDate()%></small>
              </div>
          </div>
          <%
          }
              }
              }
          %>
          
</body>
<footer>

     <div class="fixed-bottom msb-reply">
          <Input type="hidden" id="userId" value="user01">
          <textarea name="text" id="text" class="text"
              placeholder="What's on your  mind..."></textarea>
          <button onclick="send();" id="enter">
              <i class="far fa-paper-plane"></i>
          </button>
     </div>
</footer>
<!-- 메세지 보낼때 -->
<script>
//creating web socket
     var socket = new  WebSocket("ws://localhost:9090/<%=request.getContextPath()%>/messages/socket");
     socket.onopen = function(e) {
          //console.log(e);
     }
     
     // This method is triggered when it's received
     socket.onmessage = function(e) {
          //console.log(e);
          d = JSON.parse(e.data);
          receive(d);
     }
     
     function receive(d){
    	 
          var msg = {
        		  "roomNo" : <%=room%>,
                  "sender" : d["sender"],
                  "chatText" : d["chatText"]
              };
          var date =  document.createTextNode(formatAMPM(new Date()));
          
          
          if(msg["sender"] !== "<%=id%>"){
        	  
        	  /* inputting image */
        	  var imgDiv = $("<div>").attr({
        		 "class" : "pull-left" 
        	  });
        	  
        	  var img = $("<img>").attr({
        		 "src" :  "<%=request.getContextPath()%>/images/avatars/User 01a.png",
        		 "class" : "mr-2 img-avatar"
        	  });
				imgDiv.append(img);
				
        	  /* inputting text */
        	  var div = $("<div>").attr({
	              "class" : "mf-content bg-secondary  text-dark"
	          });
	          var small = $("<small>").attr({
	              "class" : "mf-date"
	          });
	          var wrap = $("<div>").attr({
	              "class" : "message-feed feed",
	              "id" : "msg",
	              "name" : "msg"
	          });
	          div.append(msg["chatText"]);
	          small.append("<i class='far fa-clock'></i>  ").append(date);
	          wrap.append(imgDiv);
	          wrap.append(div).append(small);
	          $("#text-history").append(wrap);
	          $("#text").val("");
	          
          } else{
        	  
	          var div = $("<div>").attr({
	              "class" : "mf-content bg-primary  text-white"
	          });
	          var small = $("<small>").attr({
	              "class" : "mf-date"
	          });
	          var wrap = $("<div>").attr({
	              "class" : "message-feed right"
	          });
	          div.append(msg["chatText"]);
	          small.append("<i class='far fa-clock'></i>  ").append(date);
	          wrap.append(div).append(small);
	          $("#text-history").append(wrap);
	          $("#text").val("");
          }
     }
     
     
     function send() {
          // creating a JSON and Sending it to Java
          var msg = {
              "roomNo" : <%=room%>,
              "sender" : "<%=id%>",
              "chatText" : $('#text').val()
              //,"sentDate" :  document.createTextNode(formatAMPM(new Date()))
          };
          //console.log("sender /////////////////");
          //console.log(msg["sender"]);
          //console.log(typeof msg["sender"]);
          socket.send(JSON.stringify(msg));
     }
     // 날짜/ 시간
     function formatAMPM(date) {
          var hours = date.getHours();
          var minutes = date.getMinutes();
          var ampm = hours >= 12 ? 'PM' : 'AM';
          hours = hours % 12;
          hours = hours ? hours : 12; // the hour '0'  should be '12'
          minutes = minutes < 10 ? '0' + minutes :  minutes;
          var strTime = hours + ':' + minutes + ' ' +  ampm;
          return strTime;
     }
     $('#text').keyup(function(event) {
          var keycode = (event.keyCode ? event.keyCode :  event.which);
          if (keycode == '13') {
              send();
          }
     });
</script>
</html>