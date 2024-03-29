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

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		Client cl = (Client)session.getAttribute("loginClient");
		if(cl == null) {
			request.setAttribute("message", "수정 페이지를 불러올 수 없습니다");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		
		/* 보드매칭 글 업데이 */
//		String writer = "010-0335-0361";
		//int boardNum = 199; //해당 글번호
		String writer = cl.getId();
		int boardNum = Integer.parseInt(request.getParameter("boNum")); 
//		System.out.println(boardNum);
		BoardMatching bm = new BoardMatchingService().findBoard(boardNum);
		List<FileMatching> list = new BoardMatchingService().loadBoardImg(boardNum);
//		System.out.println(bm);
//		for (FileMatching f : list) {
//			System.out.println(f);
//		}
		
//		System.out.println(bm.toString());
		if(bm.getMemo()==null) {
			bm.setMemo("");
		}

		request.setAttribute("board", bm);
		request.setAttribute("boardImgs", list);
		request.getRequestDispatcher("/views/user/noticeMod.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
