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

@WebServlet("/my/pageScheduleDriver.do")
public class MypageDriverScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public MypageDriverScheduleServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 세션에서 접속자를 받아옴
		HttpSession session = request.getSession();
		String writer = "";
		Client cl = (Client)session.getAttribute("loginClient");
		if(cl == null ) {
			request.setAttribute("message", "드라이버 페이지 불러오기에 실패했습니다");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		writer = cl.getId();
		
		/* title | start_addr | end_addr | try_date | pay | board_no */
		List<List> matList = new DriverService().myPageDriverMatching(writer);
		/* com_date | requestor | end_addr | pay | board_no */
		List<List> matCompleList = new DriverService().myPageDriverMatchingCom(writer);
		
		if(matList.size() > 0) request.setAttribute("matList", matList);
		if(matCompleList.size() > 0) request.setAttribute("matCompleList", matCompleList);	

		//page
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException nfe) {
			cPage = 1;
		}

		int numPerPage = 10;
		int totalCount = new DriverService().matchingListCount();

		/* title | start_addr | end_addr | responser | try_date | board_no */
		List<List> list = new DriverService().driverReqAllList(cPage, numPerPage);
		if(list.size() > 0) request.setAttribute("boardMatching", list);
		
		int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

		String pageBar = "";
		int pageSizeBar = 5;

		int pageNo = ((cPage - 1) / pageSizeBar) * pageSizeBar + 1;
		int pageEnd = pageNo + pageSizeBar - 1;

		if (pageNo == 1) {
			pageBar += "<li class='page-item'><a class='page-link' href='#' aria-label='prev'>" 
					+ "<i class='fa fa-angle-left'></i></span>"
					+ "<span class='sr-only'>prev</span>"
					+ "</a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='"+ request.getContextPath() + "/my/pageScheduleDriver.do?cPage=" + (pageNo - 1) + "' aria-label='prev'>" 
					+ "<i class='fa fa-angle-left'></i></span>"
					+ "<span class='sr-only'>prev</span>"
					+ "</a></li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() 
				+ "/my/pageScheduleDriver.do?cPage="+ pageNo + "'>" + pageNo + "</a></li>";
				
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<li class='page-item'><a class='page-link' href='#' aria-label='Next'>"
					+ "<span aria-hidden='true'><i class='fa fa-angle-right'></i></span>"
					+ "<span class='sr-only'>Next</span></a></li>";
		} else {
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() 
					+ "/my/pageScheduleDriver.do?cPage=" + (pageNo) 
					+ "' aria-label='Next'>"
					+ "<span aria-hidden='true'><i class='fa fa-angle-right'></i></span>"
					+ "<span class='sr-only'>Next</span></a></li>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.getRequestDispatcher("/views/myPage/myPageDriverSchedule.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
