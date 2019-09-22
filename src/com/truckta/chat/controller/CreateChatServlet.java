package com.truckta.chat.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.chat.model.vo.CreateChat;
import com.truckta.chat.service.ChatService;
import com.truckta.client.model.vo.Client;

/**
 * Servlet implementation class CreateChatServlet
 */
@WebServlet("/createChat")
public class CreateChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateChatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ChatService cs = new ChatService();
		
		Client loggedInClient =(Client)request.getSession().getAttribute("loginClient");
		String driverId = request.getParameter("driverId");
		String writerId = request.getParameter("writerId");
		String bidPrice = request.getParameter("bidPrice");
//		System.out.println("bid price : " + bidPrice);
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String message = "안녕하세요, 선생님의 글을 보고 연락드린 트럭 기사입니다. 저는 이 일을 " + bidPrice + "원에 할수 있습니다 :)";
		
		CreateChat cc = new CreateChat(writerId, driverId, boardNo);
		
		//checking if the chatroom already exists
		// this fetches the room number
		int roomNum = cs.selectRoom(cc);
//		System.out.println("Room already exists or not : " + roomNum);
		
		
		// if there is no room, create one
		if(roomNum < 0) {
			// creating one on one chat room
			int result = cs.createRoom(cc);
			if(result ==1) {
//				System.out.println("Room created");
				roomNum = cs.selectRoom(cc);
//				System.out.println("Newly created room number : " + roomNum);
				
			} else {
//				System.out.println("There's a problem yo");
			}
		} 
		
		// Sending the greeting message
		System.out.println(message);
		int send = cs.sendGreeting(roomNum, driverId, message);
		// Adding to the bidding list
		int addBid =  cs.insertBid(boardNo, writerId, driverId, bidPrice);
		
		// Now that it has been created, redirect
		//Finding the room number		
		String room = Integer.toString(roomNum);
		request.setAttribute("room", room);
		request.getRequestDispatcher("/views/chat/createdChat.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
