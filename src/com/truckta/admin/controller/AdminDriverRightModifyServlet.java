package com.truckta.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;
import com.truckta.driver.model.service.DriverService;

import common.template.SMTPAuthentication;

@WebServlet("/admin/adminDriverRightModify")
public class AdminDriverRightModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDriverRightModifyServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");

		int result = new DriverService().driverRightModfiy(id);

		if (result == 1) {
			Client temp = new ClientService().findClient(id);
			String content = "<hr><h1>" + temp.getName() + "님 안녕하세요?</h1><hr>회원님은 관리자에 의해 드라이버신청이 승인되었습니다.";
			String subject = temp.getName() + "님 트럭타에서 알립니다.";
			SMTPAuthentication.sendmail(content, temp.getEmail(), subject);
			
			System.out.println(":: Truckta_LOG :: " + " ADMIN_Driver Right Modify : " + temp.getId());
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
