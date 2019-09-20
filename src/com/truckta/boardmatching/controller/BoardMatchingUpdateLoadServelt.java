package com.truckta.boardmatching.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.truckta.boardmatching.model.service.BoardMatchingService;
import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.client.model.vo.Client;
import com.truckta.file.matching.model.vo.FileMatching;

@WebServlet("/board/updateLoad")
public class BoardMatchingUpdateLoadServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardMatchingUpdateLoadServelt() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Client cl = (Client)session.getAttribute("loginClient");
		if(cl == null || cl.getUserType() == 2 || cl.getUserType() == 3 || cl.getStatus() == 0) {
			request.setAttribute("message", "잘못된 접속입니다.");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		
		/* 보드매칭 글 업데이 */
//		String writer = "010-0335-0361";
		String writer = cl.getId();
		int boardNum = 199; //해당 글번호
		BoardMatching bm = new BoardMatchingService().loadBoardMatching(writer, boardNum);
		List<FileMatching> list = new BoardMatchingService().loadBoardImg(boardNum);
		
		if(bm.getMemo().equals("null")) {
			bm.setMemo("");
		}
		
//		System.out.println("update : "+ bm);
//		System.out.println("imgList : " + list.size());
		
		request.setAttribute("board", bm);
		request.setAttribute("boardImgs", list);
		request.getRequestDispatcher(request.getContextPath() + "/views/user/noticeMod.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
