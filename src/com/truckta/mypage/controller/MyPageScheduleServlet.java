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
		String writer = "010-0335-0361";
		
		// 올린글 전체를 받아옴
		List<BoardMatching> list = new BoardMatchingService().myAllList(writer);
		
		/* hire_date | start_addr | end_addr | id | pay */
		List<List> matList = new BoardMatchingService().matchingList(writer);
		/* com_date | id | end_addr | pay */
		List<List> matCompleList = new BoardMatchingService().matchingCompleteList(writer);
		//List<List> tmpList = new ArrayList<List>();
		int ck = 0;
		if(list.size() > 0) request.setAttribute("boardMatching", list);
		if(matList.size() > 0) request.setAttribute("matList", matList);
		if(matCompleList.size() > 0) request.setAttribute("matCompleList", matCompleList);
		
		
		//page
		List pageList = new ArrayList();
		pageList = paging(request, writer);
		
		String pageBar = (String)pageList.get(0);
		int cPage = (int)pageList.get(1);
		
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
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
	
	private List paging(HttpServletRequest request, String writer) {
		//paging
		List list = new ArrayList();
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException nfe) {
			cPage = 1;
		}

		int numPerPage = 10;
		int totalCount = new BoardMatchingService().matchingListCount(writer);
		
		int totalPage = (int) Math.ceil((double) totalCount / numPerPage);

		String pageBar = "";
		int pageSizeBar = 5;

		int pageNo = ((cPage - 1) / pageSizeBar) * pageSizeBar + 1;
		int pageEnd = pageNo + pageSizeBar - 1;

		if (pageNo == 1) {
			//pageBar += "<span>[이전]</span>";
			pageBar += "<li class='page-item'><a class='page-link' href='#' aria-label='prev'>" 
					+ "<i class='fa fa-angle-left'></i></span>"
					+ "<span class='sr-only'>prev</span>"
					+ "</a></li>";
		} else {
			//pageBar += "<a href=" + request.getContextPath() + "/admin/adminDriverList?cPage=" + (pageNo - 1) + ">[이전]</a>";
			pageBar += "<li class='page-item'><a class='page-link' href='"+ request.getContextPath() + "/my/mySchedule.do?cPage=" + (pageNo - 1) + "' aria-label='prev'>" 
					+ "<i class='fa fa-angle-left'></i></span>"
					+ "<span class='sr-only'>prev</span>"
					+ "</a></li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				//pageBar += "<span class='cPage'>" + pageNo + "</span>";
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
			} else {
				//pageBar += "<a href=" + request.getContextPath() + "/admin/adminDriverList?cPage=" + pageNo + ">" + pageNo
				//		+ "</a>";
				pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() 
				+ "/my/mySchedule.do?cPage="+ pageNo + "'>" + pageNo + "</a></li>";
				
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			//pageBar += "<span>[다음]</span>";
			pageBar += "<li class='page-item'><a class='page-link' href='#' aria-label='Next'>"
					+ "<span aria-hidden='true'><i class='fa fa-angle-right'></i></span>"
					+ "<span class='sr-only'>Next</span></a></li>";
		} else {
			//pageBar += "<a href=" + request.getContextPath() + "/admin/adminDriverList?cPage=" + (pageNo) + ">[다음]</a>";
			pageBar += "<li class='page-item'><a class='page-link' href='" + request.getContextPath() 
					+ "/my/mySchedule.do?cPage=" + (pageNo) 
					+ "' aria-label='Next'>"
					+ "<span aria-hidden='true'><i class='fa fa-angle-right'></i></span>"
					+ "<span class='sr-only'>Next</span></a></li>";
		}
		
		list.add(pageBar);
		list.add(cPage);

		return list; 
	}

}
