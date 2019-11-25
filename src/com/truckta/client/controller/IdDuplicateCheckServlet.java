package com.truckta.client.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.client.model.service.ClientService;

@WebServlet("/client/duplicateCheck")
public class IdDuplicateCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public IdDuplicateCheckServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();

		String inputId = request.getParameter("id");
		int result = new ClientService().clientDuplicateCheck(inputId);

		if (result == 1) {
			pw.print(true);

		} else {
			pw.print(false);

		}
		pw.flush();

	}

}
