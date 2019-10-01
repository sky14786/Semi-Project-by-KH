package com.truckta.boardqna.q.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardqna.q.model.service.BoardQnaQService;
import com.truckta.boardqna.q.model.vo.BoardQnaQ;
import com.truckta.file.qna.model.service.FileQnaService;
import com.truckta.file.qna.model.vo.FileQna;

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
		List<FileQna> fileList = new FileQnaService().findFileList(Integer.parseInt(boardNo));
		
		request.setAttribute("fileList", fileList);
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
