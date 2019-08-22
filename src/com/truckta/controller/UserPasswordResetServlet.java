package com.truckta.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.model.service.ClientService;

/**
 * Servlet implementation class UserPasswordResetServlet
 */
@WebServlet("/pwreset.do")
public class UserPasswordResetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserPasswordResetServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("password");

		int result = new ClientService().resetPassword(id, pw);

		if (result == 1) {

		} else {

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
