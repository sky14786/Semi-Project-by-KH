package com.truckta.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import com.truckta.driver.model.service.DriverService;
import com.truckta.file.matching.model.vo.FileMatching;

@WebServlet("/my/pageTopDriver")
public class MyPageDriverServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyPageDriverServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// my driver page init //
		
		// -- 다른 사용자 접속 에러 처리 --
		HttpSession session = request.getSession();
		String writer = "";
		Client cl = (Client)session.getAttribute("loginClient");
		if(cl == null || cl.getUserType()== 3 || cl.getUserType() == 1 ||cl.getStatus() == 0) {
			request.setAttribute("message", "드라이버 페이지 불러오기에 실패했습니다");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else
			writer = cl.getId();

		// -- 값이 없으면 메인화면으로 이전 --
		if(writer.equals("null") || writer == null) {
			String path = "/index.jsp";
			request.setAttribute("message", "마이페이지 불러오기에 실패했습니다");
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}

		// 데이터 처리
		// 거래중인 목록의 리스트(top3)
		List<BoardMatching> list = new DriverService().driverTopList(writer);
		List<List> imgAllList = new ArrayList<List>();

		for (int i = 0; i < list.size(); i++) {
			int boardTmp = list.get(i).getBoardNo();
			List<FileMatching> listImg = new BoardMatchingService().loadBoardImg(boardTmp);	
			imgAllList.add(listImg);			
		}

		if(list.size() > 0) {
			request.setAttribute("boardTop", list);
		}
		if(imgAllList.size() > 0) {
			request.setAttribute("imgTop", imgAllList);
		}else {
			request.setAttribute("defaultImg", request.getContextPath()+"/images/boardMatching_images/defaultImg.jpg");
		}

		request.getRequestDispatcher("/views/myPage/myMainPageDr.jsp").forward(request, response);


	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


}