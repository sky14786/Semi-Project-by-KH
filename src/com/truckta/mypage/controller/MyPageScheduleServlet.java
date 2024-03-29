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

@WebServlet("/my/mySchedule.do")
public class MyPageScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MyPageScheduleServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 세션에서 접속자를 받아옴
		HttpSession session = request.getSession();
		String writer = "";
		Client cl = (Client)session.getAttribute("loginClient");
		if(cl == null) {
			request.setAttribute("message", "마이페이지 불러오기에 실패했습니다");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		writer = cl.getId();


		/* hire_date | start_addr | end_addr | id | pay */
		List<List> matList = new BoardMatchingService().matchingList(writer);
		/* com_date | id | end_addr | pay */
		List<List> matCompleList = new BoardMatchingService().matchingCompleteList(writer);

		if(matList.size() > 0) request.setAttribute("matList", matList);
		if(matCompleList.size() > 0) request.setAttribute("matCompleList", matCompleList);	

		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException nfe) {
			cPage = 1;
		}
		

		int numPerPage = 10; // 표시할 페이지 수

		int totalCount = new BoardMatchingService().matchingListCount(writer);
		List<BoardMatching> list = new BoardMatchingService().myAllList(writer, cPage, numPerPage);
		if(list.size() > 0) {
			request.setAttribute("boardMatching", list);
		}

		int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

		String pageBar = "";
		int pageSizeBar = 5;

		int pageNo = ((cPage - 1) / pageSizeBar) * pageSizeBar + 1;
		int pageEnd = pageNo + pageSizeBar - 1;
//		System.out.println(pageNo + " / " + pageEnd + " / " + totalPage + " / " + totalCount);
		if (pageNo == 1) {
			pageBar += "<li class='page-item'><a class='page-link' href='#' aria-label='prev'>" 
					+ "<i class='fa fa-angle-left'></i></span>"
					+ "<span class='sr-only'>prev</span>"
					+ "</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href="+ request.getContextPath() + "/my/mySchedule.do?cPage=" + (pageNo - 1) + " aria-label='prev'>" 
					+ "<i class='fa fa-angle-left'></i></span>"
					+ "<span class='sr-only'>prev</span>"
					+ "</a></li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() 
				+ "/my/mySchedule.do?cPage="+ pageNo + "'>" + pageNo + "</a></li>";

			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<li class='page-item'><a class='page-link' href='#' aria-label='Next'>"
					+ "<span aria-hidden='true'><i class='fa fa-angle-right'></i></span>"
					+ "<span class='sr-only'>Next</span></a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() 
			+ "/my/mySchedule.do?cPage=" + (pageNo) 
			+ "' aria-label='Next'>"
			+ "<span aria-hidden='true'><i class='fa fa-angle-right'></i></span>"
			+ "<span class='sr-only'>Next</span></a></li>";
		}

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.getRequestDispatcher("/views/myPage/mySchedule.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
