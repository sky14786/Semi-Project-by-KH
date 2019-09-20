package com.truckta.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardmatching.model.service.BoardMatchingService;
import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;

import common.template.SMTPAuthentication;

@WebServlet("/admin/adminDeleteBoardMatching")
public class AdminDeleteBoardMatchingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminDeleteBoardMatchingServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		int result = new BoardMatchingService().deleteBoardMatching(no);

		if (result == 1) {
			Client user = new ClientService().boardMatchingFindClient(no);
			if (user != null) {
				String content = "<hr><h3>" + user.getName() + "님 안녕하세요?</h3><hr>회원님의 글 관리자에 의해 삭제처리되었음을 알립니다.";
				String subject = user.getName() + "님 트럭타에서 알립니다.";
				SMTPAuthentication.sendmail(content, user.getEmail(), subject);
			}
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
