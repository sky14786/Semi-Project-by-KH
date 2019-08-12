package com.truckta.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.model.service.ClientService;
import com.truckta.model.service.DriverService;

/**
 * Servlet implementation class PasswordResetServlet
 */
@WebServlet("/trypwreset.do")
public class TryPasswordResetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TryPasswordResetServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String inputId = request.getParameter("id");
		int driverCount = new DriverService().selectDriver(inputId);
		int clientCount = new ClientService().selectClient(inputId);

		if (driverCount == 1) {
			RequestDispatcher rd = request.getRequestDispatcher("/pwReset.html");
			request.setAttribute("id", inputId);
			request.setAttribute("isDriver", true);
			rd.forward(request, response);

		} else if (clientCount == 1) {
			RequestDispatcher rd = request.getRequestDispatcher("/pwReset.html");
			request.setAttribute("id", inputId);
			request.setAttribute("isDriver", false);
			rd.forward(request, response);
		} else {
			PrintWriter pw = response.getWriter();
			pw.println("<script>alert('등록된 계정이 아닙니다.');</script>");
			pw.flush();
		}

	}

}
