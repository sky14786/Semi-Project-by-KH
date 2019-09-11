package com.truckta.chat.controller;

import java.io.IOException;

import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.truckta.chat.model.vo.Message;

import common.chat.MessageDecoder;
import common.chat.MessageEncoder;

@ServerEndpoint(value = "/messages/socket",
		encoders = {MessageEncoder.class}, // Java to Javascript
		decoders = {MessageDecoder.class} // Javascript to Java
		)

public class ChattingServer {
	
	@OnOpen
	public void open(Session session, EndpointConfig config) {
		System.out.println("Soceket connetion : " + session.getId());
	}
	
	@OnMessage
	public void message(Session session, Message msg) {
		System.out.println(msg);
		
		try {
			
			session.getBasicRemote().sendObject(new Message(msg.getUserId(), msg.getMsg(), msg.getRoom(), msg.getFlag(), msg.getReceiveId()));
		} catch (IOException | EncodeException e) {
			e.printStackTrace();
		}
		
	}

}
