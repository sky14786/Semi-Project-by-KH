package com.truckta.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.truckta.client.model.vo.Client;

/**
 * Servlet implementation class UserToDriverServlet
 */
@WebServlet("/userToDriver")
public class UserToDriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserToDriverServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Client cl = (Client)session.getAttribute("loginClient");
		if(cl == null || cl.getStatus() == 2 || cl.getStatus() == 3) {
			request.setAttribute("message", "드라이버는 신청할 수 없습니");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		request.setAttribute("client", cl);
		request.getRequestDispatcher("/views/user/userToDriver.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
