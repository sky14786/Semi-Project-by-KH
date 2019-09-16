package com.truckta.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.cartype.model.service.CarTypeService;

@WebServlet("/admin/insertCarType")
public class AdminInsertCarTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminInsertCarTypeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// admin 아닐경우 예외처리
		String carType = request.getParameter("car_type");

		int result = new CarTypeService().insertCarType(carType);

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
