package com.truckta.mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;

import common.template.SMTPAuthentication;

@WebServlet("/MypageMemeberDel")
public class MypageMemberDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MypageMemberDelServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
//		System.out.println("탈퇴 유저 아이디 : " + id);
		
		Client cl = new ClientService().delMemberSelect(id);
		
		int isDelete = new ClientService().copyClient(cl) + new ClientService().deleteClient(id);

		if (isDelete == 2) {
			String content = "<hr><h3>" + cl.getName() + "님 안녕하세요?</h3><hr>회원님은 탈퇴 처리되었음을 알립니다.";
			String subject = cl.getName() + "님 트럭타에서 알립니다.";
			SMTPAuthentication.sendmail(content, cl.getEmail(), subject);
			response.getWriter().write("true");
		} else {
			response.getWriter().write("false");
		}
		response.getWriter().flush();
		response.sendRedirect("/");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
