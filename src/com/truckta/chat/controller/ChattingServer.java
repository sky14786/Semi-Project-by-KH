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
    	 // DB 에 기록 남기기
    	 System.out.println(ch.getRoomNo());
    	 int result = new ClientService().sendChat(ch);
    	 
          for (Session s : session.getOpenSessions()) {
              
              try {
                   s.getBasicRemote().sendObject(
                             new  ChatHistory(ch.getRoomNo(), ch.getSender(),  ch.getChatText()));
              } catch (IOException | EncodeException e) {
                   e.printStackTrace();
              }
          }
     }
}