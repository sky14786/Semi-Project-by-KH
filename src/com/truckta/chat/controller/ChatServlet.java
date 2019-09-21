package com.truckta.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.chat.model.vo.ChatHistory;
import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;

/**
 * Servlet implementation class ChatServlet
 */
@WebServlet("/messages/chat")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Client loggedInClient =(Client)request.getSession().getAttribute("loginClient");
		String room = (String) request.getParameter("room");
		
		List<ChatHistory> list = new ClientService().selectChatHistory(room);
		request.setAttribute("room", room);
		request.setAttribute("list", list);
		request.setAttribute("loggedInClient", loggedInClient);
		
		request.getRequestDispatcher("/views/chat/chat.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
