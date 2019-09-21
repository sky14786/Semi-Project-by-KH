package com.truckta.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.cartype.model.service.CarTypeService;
import com.truckta.cartype.model.vo.CarType;
import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;
import com.truckta.driver.model.service.DriverService;
import com.truckta.driver.model.vo.Driver;
import com.truckta.file.driver.model.service.FileDriverService;
import com.truckta.file.driver.model.vo.FileDriver;

@WebServlet("/admin/adminUserDetail")
public class AdminUserDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminUserDetailViewServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		boolean isDriverView = Boolean.parseBoolean(request.getParameter("isDriverView"));
		Client client = new ClientService().findClient(id);
		Driver driver = new DriverService().findDriver(id);
		List<CarType> carTypeList = new ArrayList<CarType>();
		carTypeList = new CarTypeService().selectAll();
		
		if (driver != null) {
			List<FileDriver> fileList = new FileDriverService().findDriverFile(id);
			request.setAttribute("fileList", fileList);
		}
		if(carTypeList!=null && carTypeList.size()>0) {
			request.setAttribute("carType", carTypeList);
		}
		request.setAttribute("driver", driver);
		request.setAttribute("client", client);
		request.setAttribute("isDriverView", isDriverView);

		if (request.getParameter("isUpdateView") != null
				&& Boolean.parseBoolean(request.getParameter("isUpdateView"))) {
			request.getRequestDispatcher("/views/admin/adminUserUpdateView.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/views/admin/adminUserView.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
