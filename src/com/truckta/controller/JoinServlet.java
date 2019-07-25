package com.truckta.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.model.vo.Client;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/ClientJoin")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JoinServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("text/html;charset=utf-8");

		Client temp = new Client();
		temp.setId(request.getParameter("id"));
		temp.setPw(request.getParameter("pw"));
		temp.setName(request.getParameter("name"));
		ClientController cc = new ClientController();
		int result = cc.joinClient(temp);

		if (result == 1) {
			response.sendRedirect("http://www.truckta.com/test.html");
		} else {
			response.sendRedirect("http://www.truckta.com/testfail.html");
		}

	}

}
