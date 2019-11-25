package com.truckta.boardmatching.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.truckta.client.model.vo.Client;

/**
 * Servlet implementation class BoardMatchingPageLoadServlet
 */
@WebServlet("/board/pageLoad")
public class BoardMatchingPageLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardMatchingPageLoadServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Client cl = (Client) session.getAttribute("loginClient");
		if (cl == null ) {
			request.setAttribute("message", "업로드페이지 불러오기에 실패했습니다");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		} else {
			request.setAttribute("client", cl);
			request.getRequestDispatcher("/views/user/notice.jsp").forward(request,
					response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
