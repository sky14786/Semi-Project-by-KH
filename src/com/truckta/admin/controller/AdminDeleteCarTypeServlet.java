package com.truckta.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.cartype.model.service.CarTypeService;

@WebServlet("/admin/deleteCarType")
public class AdminDeleteCarTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDeleteCarTypeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int delTarget = Integer.parseInt(request.getParameter("del_target"));

		int result = new CarTypeService().deleteCarType(delTarget);
		if (result == 1) {
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
		response.getWriter().flush();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
