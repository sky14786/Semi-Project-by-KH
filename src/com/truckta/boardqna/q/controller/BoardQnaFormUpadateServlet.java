package com.truckta.boardqna.q.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardqna.q.model.service.BoardQnaQService;
import com.truckta.boardqna.q.model.vo.BoardQnaQ;

/**
 * Servlet implementation class BoardQnaFormUpadateServlet
 */
@WebServlet("/board/boardFormUpdate")
public class BoardQnaFormUpadateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardQnaFormUpadateServlet() {
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
		String boardNo = request.getParameter("no");

		BoardQnaQ q = new BoardQnaQService().selectBoard(boardNo);

		request.setAttribute("board_qna_q", q);
		request.getRequestDispatcher(request.getContextPath() + "/views/user/boardQnaFormUpdate.jsp").forward(request,
				response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}