package com.truckta.chat.controller;
import java.io.IOException;
import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import com.truckta.chat.model.vo.ChatHistory;
import com.truckta.chat.model.vo.Message;
import com.truckta.client.model.service.ClientService;

import common.chat.MessageDecoder;
import common.chat.MessageEncoder;
@ServerEndpoint(value = "/messages/socket", encoders = {  MessageEncoder.class }, // Java to Javascript
          decoders = { MessageDecoder.class } //  Javascript to Java
)
public class ChattingServer {
	
     @OnOpen
     public void open(Session session, EndpointConfig  config) {
          System.out.println("Soceket connetion : " +  session.getId());
     }
     
     @OnMessage
     public void message(Session session, ChatHistory ch)  {
    	 // 보낸 사람의 properties 를 설정해준다. 
    	 // 왜냐하면 세션값은 세로 접속하면 수시로 바뀌기 때문이다. 
    	 // Session is an "OBJECT" to concurrently connect an online user.
    	 // The session number is given randomly and it changes the session number if it loses the connection.
    	 // Thus, in order to differentiate the online users, we send an object to differentiage the others.
    	 // In our case, I used ch, ChatHisotry "object", to different and fetch the values using session.getuserProperties
    	 // Thus, this is basically the message sender's object.
    	 session.getUserProperties().put("msg", ch);
    	 
    	 
    	 
    	 // DB 에 기록 남기기
    	 System.out.println("Chatting server //////////////////////");
    	 System.out.println(ch);
    	 int result = new ClientService().sendChat(ch);
    	 
          for (Session s : session.getOpenSessions()) {
              ChatHistory cHistory=(ChatHistory)s.getUserProperties().get("msg");
        	  if(cHistory.getRoomNo()==ch.getRoomNo()) {
	              try {
	                   s.getBasicRemote().sendObject(
	                             new  ChatHistory(ch.getRoomNo(), ch.getSender(),  ch.getChatText()));
	              } catch (IOException | EncodeException e) {
	                   e.printStackTrace();
	              }
        	  }
          }
     }
     
}