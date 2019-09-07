package com.truckta.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardmatching.model.service.BoardMatchingService;
import com.truckta.boardmatching.model.vo.BoardMatching;

@WebServlet("/admin/adminBoardMatchingList")
public class AdminBoardMatchingListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminBoardMatchingListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Client loginClient = (Client) request.getSession().getAttribute("loginClient");
//		if (loginClient != null && loginClient.getUserType() == 3) {
//
//		}
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException nfe) {
			cPage = 1;
		}

		int numPerPage = 15;
		int totalClient = new BoardMatchingService().selectCountBoardMatching();
		List<BoardMatching> list = new BoardMatchingService().selectListPage(cPage, numPerPage);
		int totalPage = (int) Math.ceil((double) totalClient / numPerPage);

		String pageBar = "";
		int pageSizeBar = 5;

		int pageNo = ((cPage - 1) / pageSizeBar) * pageSizeBar + 1;
		int pageEnd = pageNo + pageSizeBar - 1;

		if (pageNo == 1) {
			pageBar += "<span>[이전]</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/admin/adminBoardMatchingList?cPage=" + (pageNo - 1)
					+ ">[이전]</a>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href=" + request.getContextPath() + "/admin/adminBoardMatchingList?cPage=" + pageNo + ">"
						+ pageNo + "</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/admin/adminBoardMatchingList?cPage=" + (pageNo)
					+ ">[다음]</a>";
		}

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/adminBoardMatchingList.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
