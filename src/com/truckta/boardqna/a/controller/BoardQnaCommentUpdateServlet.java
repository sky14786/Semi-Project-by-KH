package com.truckta.boardqna.a.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardqna.a.model.vo.BoardQnaA;
import com.truckta.boardqna.q.model.service.BoardQnaQService;

/**
 * Servlet implementation class BoardQnaCommentUpdate
 */
@WebServlet("/board/boardCommentUpdate")
public class BoardQnaCommentUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardQnaCommentUpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String etc = request.getParameter("etc");
		String writer = request.getParameter("writer");
		int aNo = Integer.parseInt(request.getParameter("aNo"));

//		System.out.println(writer + "xxxxxxxx");

		// 자신이 맞는지 확인하는 로직

		BoardQnaA a = new BoardQnaA();
		a.setaNo(aNo);
		a.setEtc(etc);
		int result = new BoardQnaQService().updateComment(a);
		if (result == 1) {
			a = new BoardQnaQService().findAnswer(aNo);
			String message = "댓글수정 성공";
			String location = "/board/boardView?boardNo=" + a.getqNo();
			String view = "/views/common/msg.jsp";
			request.setAttribute("message", message);
			request.setAttribute("location", location);
			request.getRequestDispatcher(view).forward(request, response);
		} else {

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
