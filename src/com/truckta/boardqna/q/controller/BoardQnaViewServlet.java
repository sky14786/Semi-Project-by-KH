package com.truckta.boardqna.q.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardqna.a.model.vo.BoardQnaA;
import com.truckta.boardqna.q.model.service.BoardQnaQService;
import com.truckta.boardqna.q.model.vo.BoardQnaQ;

/**
 * Servlet implementation class BoardQnaViewServlet
 */
@WebServlet("/board/boardView")
public class BoardQnaViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardQnaViewServlet() {
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

		String boardNo = request.getParameter("boardNo");
		
		// 쿠키통해서 제한
		/*
		 * Cookie[] cookies=request.getCookies(); String boardCookieVal=""; boolean
		 * hasRead= false;//이게시글을 읽었는지 확인
		 * 
		 * if(cookies!=null) { out: for(Cookie c: cookies) { String name=c.getName();
		 * String value=c.getValue();
		 * 
		 * if("boardCookie".equals(name)) { boardCookieVal=value;
		 * if(value.contains("|"+boardNo+"|")) { hasRead=true;//읽었는지 확인 break out; } } }
		 * } if(!hasRead) { Cookie boardCookie=new Cookie("boardCookie",
		 * boardCookieVal+"|"+boardNo+"|"); boardCookie.setMaxAge(-1);
		 * response.addCookie(boardCookie); }
		 */

		BoardQnaQ q = new BoardQnaQService().selectBoard(boardNo);
		 List<BoardQnaA> list=new BoardQnaQService().selectBoardComment(boardNo); 
		request.setAttribute("board_qna_q", q);
		request.setAttribute("list", list);
		request.getRequestDispatcher(request.getContextPath()+"/views/user/board_qna_q_view.jsp").forward(request, response);
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
