package com.truckta.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardmatching.model.service.BoardMatchingService;
import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.file.matching.model.vo.FileMatching;

@WebServlet("/my/pageTop")
public class MypageTopServleit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageTopServleit() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String writer = "010-0335-0361"; //010-2362-6438
	
		// 값이 없으면 메인화면으로 이전
		if(writer.equals("null") || writer == null) {
			String path = "/mainPage.jsp";
			request.setAttribute("message", "마이페이지 불러오기에 실패했습니다");
			request.setAttribute("location", path);
			request.getRequestDispatcher(request.getContextPath()+"/views/common/msg.jsp").forward(request, response);
		}
		
		List<BoardMatching> list = new BoardMatchingService().mypageTop(writer);
		List<List> imgAllList = new ArrayList<List>();
//		System.out.println(list.size());
//		for (BoardMatching b : list) {
//			System.out.println(b);
//		}
		
		for (int i = 0; i < list.size(); i++) {
			int boardTmp = list.get(i).getBoardNo();
//			System.out.println(boardTmp);
			List<FileMatching> listImg = new BoardMatchingService().loadBoardImg(boardTmp);	
			imgAllList.add(listImg);			
		}
		for (int i = 0; i < imgAllList.size(); i++) {
			for (int j = 0; j < imgAllList.get(i).size(); j++) {
//				System.out.println( ((FileMatching)imgAllList.get(i).get(j)).getBaordNo() );
//				System.out.println(  ((FileMatching)imgAllList.get(i).get(j)).getFileName()  );
			}
		}
		if(list.size() != 0) {
			request.setAttribute("boardTop", list);
			
//			String stAddr = list.get(0).getStartAddr();
//			System.out.println(stAddr);
//			String stAddrArray[] = stAddr.split(",");
//			System.out.println(stAddrArray[0]);
//			System.out.println(stAddrArray[1]);
//			stAddr = stAddrArray[1];
//			stAddrArray = stAddr.split(" ");
//			stAddr = stAddrArray[0] + stAddrArray[1];
//			System.out.println(stAddr);
		}
		if(imgAllList.size() != 0) {
			request.setAttribute("imgTop", imgAllList);
		}else {
			request.setAttribute("defaultImg", request.getContextPath()+"/images/boardMatching_images/defaultImg.jpg");
		}
		
		request.getRequestDispatcher(request.getContextPath()+"/views/user/myMainPage.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
