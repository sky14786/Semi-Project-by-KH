package com.truckta.chat.model.vo;

import java.util.Date;

public class ChatHistory {
	private int roomNo;
	private String sender;
	private String chatText;
	private Date sentDate;
	
	public ChatHistory() {
		// TODO Auto-generated constructor stub
	}

	public ChatHistory(int roomNo, String sender, String chatText, Date sentDate) {
		super();
		this.roomNo = roomNo;
		this.sender = sender;
		this.chatText = chatText;
		this.sentDate = sentDate;
	}
	
	public ChatHistory(int roomNo, String sender, String chatText) {
		super();
		this.roomNo = roomNo;
		this.sender = sender;
		this.chatText = chatText;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getChatText() {
		return chatText;
	}

	public void setChatText(String chatText) {
		this.chatText = chatText;
	}

	public Date getSentDate() {
		return sentDate;
	}

	public void setSentDate(Date sentDate) {
		this.sentDate = sentDate;
	}

	@Override
	public String toString() {
		return "ChatHistory [roomNo=" + roomNo + ", sender=" + sender + ", chatText=" + chatText + ", sentDate="
				+ sentDate + "]";
	}
	
}
