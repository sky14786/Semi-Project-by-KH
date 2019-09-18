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

@WebServlet("/my/mySchedule.do")
public class MyPageScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageScheduleServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		// 세션에서 접속자를 받아옴
		String writer = "010-0335-0361";//010-0335-0361
		
		// 올린글 전체를 받아옴
		List<BoardMatching> list = new BoardMatchingService().myAllList(writer);
		
		/* hire_date | start_addr | end_addr | id | pay */
		List<List> matList = new BoardMatchingService().matchingList(writer);
		/* com_date | id | end_addr | pay */
		List<List> matCompleList = new BoardMatchingService().matchingCompleteList(writer);
		List<List> tmpList = new ArrayList<List>();
		int ck = 0;
		if(list.size() > 0) request.setAttribute("boardMatching", list);
		if(matList.size() > 0) request.setAttribute("matList", matList);
		if(matCompleList.size() > 0) request.setAttribute("matCompleList", matCompleList);
		
		request.getRequestDispatcher(request.getContextPath()+"/views/user/mySchedule.jsp").forward(request, response);
		
		/* -- error --
		request.setAttribute("message", "마이페이지 불러오기에 실패했습니다");
		String path = "/mainPage.jsp";
		request.setAttribute("location", path);
		request.getRequestDispatcher(request.getContextPath()+"/views/common/msg.jsp").forward(request, response);
		*/
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
