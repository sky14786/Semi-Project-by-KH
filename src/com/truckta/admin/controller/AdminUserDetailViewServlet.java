package com.truckta.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;
import com.truckta.driver.model.service.DriverService;
import com.truckta.driver.model.vo.Driver;
import com.truckta.file.driver.model.service.FileDriverService;

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
		List<String> fileList = new FileDriverService().findDriverFile(id);

		request.setAttribute("client", client);
		request.setAttribute("driver", driver);
		request.setAttribute("fileList", fileList);
		request.setAttribute("isDriverView", isDriverView);
		request.getRequestDispatcher("/views/admin/adminUserView.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
