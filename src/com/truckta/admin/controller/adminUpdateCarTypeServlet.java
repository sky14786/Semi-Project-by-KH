package com.truckta.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.cartype.model.service.CarTypeService;
import com.truckta.cartype.model.vo.CarType;

@WebServlet("/admin/updateCarType")
public class adminUpdateCarTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public adminUpdateCarTypeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String carType = request.getParameter("carType");
		int typeNo = Integer.parseInt(request.getParameter("typeNo"));

		CarType temp = new CarType(typeNo, carType);
		int result = new CarTypeService().updateCarType(temp);

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
