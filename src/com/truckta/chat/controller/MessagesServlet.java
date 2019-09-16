package com.truckta.chat.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.chat.model.vo.MessageList;
import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;

/**
 * Servlet implementation class MessagesServlet
 */
@WebServlet("/messages")
public class MessagesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessagesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	// 메세지 방 수 가지고 오기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Client loggedInClient =(Client)request.getSession().getAttribute("loginClient");
		if(loggedInClient == null) {
			request.setAttribute("msg","로그인 후 이용해주세요");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp");
		}
		else {
		ClientService service = new ClientService();
		
		// 리스트로 나와 대화창 기록들을 가지고 온다
		List<MessageList> list = service.selectMessageList(loggedInClient.getId());
		
		//set 으로 프론트로 넘겨준다
		request.setAttribute("loggedInClient", loggedInClient);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/chat/messages.jsp").forward(request, response);
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
