package com.truckta.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;

import common.template.SMTPAuthentication;

@WebServlet("/admin/adminReportUser")
public class AdminReportUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminReportUserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int isReport = new ClientService().reportClient(request.getParameter("user"));
		Client temp = new ClientService().findClient(request.getParameter("user"));

		if (isReport == 1) {
			String content = "<hr><h1>" + temp.getName()
					+ "님 안녕하세요?</h1><hr>회원님은 관리자에 의해 경고처리되었음을 알립니다.<hr>현제 경고 누적 횟수 : " + temp.getReportCount();
			String subject = temp.getName() + "님 트럭타에서 알립니다.";
			SMTPAuthentication.sendmail(content, temp.getEmail(), subject);
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
