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

@WebServlet("/admin/adminClientDelete")
public class AdminClientDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminClientDelete() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Client temp = new ClientService().findClient(request.getParameter("user"));
		int isDelete = new ClientService().copyClient(temp) + new ClientService().deleteClient(temp.getId());

		if (isDelete == 2) {
			String content = "<hr><h3>" + temp.getName() + "님 안녕하세요?</h3><hr>회원님은 관리자에 의해 삭제처리되었음을 알립니다.";
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
