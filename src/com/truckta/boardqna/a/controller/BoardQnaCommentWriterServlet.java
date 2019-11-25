package com.truckta.boardqna.a.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardqna.a.model.vo.BoardQnaA;
import com.truckta.boardqna.q.model.service.BoardQnaQService;
import com.truckta.boardqna.q.model.vo.BoardQnaQ;
import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;

import common.template.SMTPAuthentication;

/**
 * Servlet implementation class BoardQnaCommentWriterServlet
 */
@WebServlet("/boardqnacomment/commentInsert")
public class BoardQnaCommentWriterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardQnaCommentWriterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * // TODO Auto-generated method stub int
		 * boardNo=Integer.parseInt(request.getParameter("aNo")); String
		 * etc=request.getParameter("etc"); String
		 * writer=request.getParameter("writer"); //자신이 맞는지 확인하는 로직
		 * 
		 * BoardQnaA a=new BoardQnaA(boardNo,etc,writer);
		 * System.out.println(a+"+aaaaa"); int result=new
		 * BoardQnaQService().insertComment(a);
		 * 
		 * String message=""; String location="/board/boardView?boardNo="+boardNo;
		 * String view="/views/common/msg.jsp"; message=result>0?"댓글등록 성공":"댓글등록 실패";
		 * request.setAttribute("message",message);
		 * request.setAttribute("location",location);
		 * request.getRequestDispatcher(view).forward(request, response);
		 */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		int qNo=Integer.parseInt(request.getParameter("qNo"));
		String etc=request.getParameter("etc");
		String writer=request.getParameter("writer");
		
		//자신이 맞는지 확인하는 로직
		
		BoardQnaA a=new BoardQnaA(qNo,etc,writer);
		int result=new BoardQnaQService().insertComment(a);
		
		if(result==1) {
			Client temp = new ClientService().findClient(writer);
			if(temp.getName().equals("admin")) {
				BoardQnaQ q = new BoardQnaQService().findBoardQnaQ(qNo);
				q.setStatus(1);
				if(new BoardQnaQService().updateQna(q)==1) {
					Client c = new ClientService().findClient(q.getqUser());
					String subject = "[Truck ~ Ta]"+c.getName()+"님 께서 문의주신 글에 대한 답변입니다.";
					String content = "<div style=\"border:2px gray solid; width:500px;text-align:center;padding:30px;\">"+
							"<h3>"+subject+"</h3>"+
							"<hr>"+
							"<h4>"+etc+"</h4>"+
							"</div>";
					SMTPAuthentication.sendmail(content, c.getEmail(), subject);
				}
			}
		}
		
		
		String message="";
		String location="/board/boardView?boardNo="+qNo;
		String view="/views/common/msg.jsp";
	    message=result>0?"댓글등록 성공":"댓글등록 실패";
	    request.setAttribute("message",message);
	    request.setAttribute("location",location);
	    request.getRequestDispatcher(view).forward(request, response);
	    
	}

}
