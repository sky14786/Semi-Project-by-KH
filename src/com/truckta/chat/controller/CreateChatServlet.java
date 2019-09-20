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
		
		
		 
		
		
		Client loggedInClient =(Client)request.getSession().getAttribute("loginClient");
		String driverId = request.getParameter("driverId");
		String writerId = request.getParameter("writerId");
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		CreateChat cc = new CreateChat(writerId, driverId, boardNo);
		// creating one on one chat room
		int result = new ChatService().createChat(cc);
		
		
		
		// if the room is created
		// redirect to the chat room
		if(result >0) {
			//Finding the room number
			int num = new ChatService().selectRoom(cc);			
			String room = Integer.toString(num);
			request.setAttribute("room", room);
			request.getRequestDispatcher("/views/chat/createdChat.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
