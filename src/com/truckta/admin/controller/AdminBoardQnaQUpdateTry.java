package com.truckta.admin.controller;

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

@WebServlet("/admin/adminBoardQnaQUpdateTry")
public class AdminBoardQnaQUpdateTry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminBoardQnaQUpdateTry() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		BoardQnaQ temp = new BoardQnaQService().findBoardQnaQ(boardNo);
		List<FileQna> fileList = new FileQnaService().findFileList(boardNo);
		
		if(fileList!=null && fileList.size()>0) {
			request.setAttribute("fileList", fileList);
		}
		if(temp!=null) {
			request.setAttribute("boardQnaQ", temp);
			request.getRequestDispatcher("/views/user/boardqnaqUpdate.jsp").forward(request, response);
		}else {
			request.setAttribute("location", "/");
			request.setAttribute("message", "에러 발생! 메인페이지로 이동합니다.");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
