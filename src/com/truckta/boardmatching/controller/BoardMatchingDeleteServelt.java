package com.truckta.boardmatching.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardmatching.model.service.BoardMatchingService;

@WebServlet("/board/delete")
public class BoardMatchingDeleteServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardMatchingDeleteServelt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//게시판 글 삭제
		int boardNo = Integer.parseInt(request.getParameter("boNum"));
		int result = new BoardMatchingService().boardDelete(boardNo);
		if(result > 0) {
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
