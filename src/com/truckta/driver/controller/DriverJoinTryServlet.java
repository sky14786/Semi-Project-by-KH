package com.truckta.driver.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.truckta.cartype.model.service.CarTypeService;
import com.truckta.cartype.model.vo.CarType;

@WebServlet("/driver/driverJoinTry")
public class DriverJoinTryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DriverJoinTryServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<CarType> carTypeList = new ArrayList<CarType>();
		carTypeList = new CarTypeService().selectAll();
		
		
		if (carTypeList != null && carTypeList.size() > 0) {
			request.getSession().setAttribute("isCertified", true);
			request.setAttribute("carTypeList", carTypeList);
			request.getRequestDispatcher("/views/user/signUpDriver.jsp").forward(request, response);
		} else {
			request.setAttribute("message", "개발자에게 문의하세요.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher("/").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
