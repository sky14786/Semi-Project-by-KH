package com.truckta.boardqna.q.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardqna.q.model.service.BoardQnaQService;

/**
 * Servlet implementation class BoardQnaFormDeleteServlet
 */
@WebServlet("/BoardQnaFormDeleteServlet")
public class BoardQnaFormDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardQnaFormDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int boardNo=Integer.parseInt(request.getParameter("no"));
		int type=Integer.parseInt(request.getParameter("type"));
		
		int result=new BoardQnaQService().deleteBoard(boardNo,type);
		String location="/board/boardQnaQList?boardNo="+boardNo;
		String message=result>0?"게시판삭제완료":"게시판삭제실패";
		String view="/views/common/msg.jsp";
		request.setAttribute("message", message);
		request.setAttribute("location", location);
		request.getRequestDispatcher(view).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
