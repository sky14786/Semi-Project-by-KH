package com.truckta.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import com.truckta.model.service.ClientService;

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

		String inputId = request.getParameter("id");
		int clientCount = new ClientService().selectClient(inputId);

		if (clientCount == 1) {
			RequestDispatcher rd = request.getRequestDispatcher("/pwReset.html");
			request.setAttribute("id", inputId);
			rd.forward(request, response);
		} else {
			PrintWriter pw = response.getWriter();
			pw.println("<script>alert('해당 ID로 가입된 정보가 없습니다.');</script>");
			pw.flush();
		}

	}

}
