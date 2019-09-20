package com.truckta.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardqna.q.model.service.BoardQnaQService;
import com.truckta.boardqna.q.model.vo.BoardQnaQ;
import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;

import common.template.SMTPAuthentication;

@WebServlet("/admin/adminDeleteQnaQ")
public class AdminQnaQDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminQnaQDeleteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		BoardQnaQ bTemp = new BoardQnaQService().findBoardQnaQ(no);

		Client cTemp = new ClientService().findClient(bTemp.getqUser());

		int result = new BoardQnaQService().deleteQnaQ(no);

		if (result == 1) {
			String content = "<hr><h1>" + cTemp.getName() + "님 안녕하세요?</h1><hr>회원님께서 작성하신 질문글 " + bTemp.getTitle()
					+ "가 운영진에 의해 삭제되었음을 알립니다.";
			SMTPAuthentication.sendmail(content, cTemp.getEmail(), "안녕");
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
