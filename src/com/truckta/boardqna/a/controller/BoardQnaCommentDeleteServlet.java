package com.truckta.boardqna.a.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardqna.q.model.service.BoardQnaQService;

/**
 * Servlet implementation class BoardQnaCommentDeleteServlet
 */
@WebServlet("/board/boardCommentDelete")
public class BoardQnaCommentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardQnaCommentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int qNo=Integer.parseInt(request.getParameter("no"));
		int aNo=Integer.parseInt(request.getParameter("aNo"));
		
		int result=new BoardQnaQService().deleteComment(qNo,aNo);
		String location="/board/boardView?boardNo="+qNo;
		String message=result>0?"댓글삭제완료":"댓글삭제실패";
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
