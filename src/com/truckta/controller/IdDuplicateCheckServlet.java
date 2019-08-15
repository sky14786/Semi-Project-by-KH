package com.truckta.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.model.service.ClientService;
import com.truckta.model.service.DriverService;

/**
 * Servlet implementation class IdDuplicateCheckServlet
 */
@WebServlet("/duplicateCheck.do")
public class IdDuplicateCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IdDuplicateCheckServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();

		String inputId = request.getParameter("id");
		int result = new ClientService().selectClient(inputId) + new DriverService().selectDriver(inputId);

		if (result == 0) {
			pw.print(true);

		} else {
			pw.print(false);

		}
		pw.flush();

	}

}
