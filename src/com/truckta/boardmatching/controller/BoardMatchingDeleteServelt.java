package com.truckta.boardmatching.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.truckta.boardmatching.model.service.BoardMatchingService;
import com.truckta.client.model.vo.Client;

@WebServlet("/board/delete")
public class BoardMatchingDeleteServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardMatchingDeleteServelt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Client cl = (Client)session.getAttribute("loginClient");
		if(cl == null || cl.getUserType() == 2 || cl.getUserType() == 3 || cl.getStatus() == 0) {
			request.setAttribute("message", "잘못된 접근입니다.");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		//게시판 글 삭제
		int boardNo = Integer.parseInt(request.getParameter("boNum"));
		int result = new BoardMatchingService().boardDelete(boardNo);
		if(result > 0) {
			//삭제 성공
			response.sendRedirect(request.getContextPath()+"/mainPage.jsp");
			return;
		}else {
			//삭제 실패
			request.setAttribute("message", "글 삭제가 되지 않았습니다.");
			request.setAttribute("location", "/");
			request.getRequestDispatcher(request.getContextPath()+"/common/msg.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
