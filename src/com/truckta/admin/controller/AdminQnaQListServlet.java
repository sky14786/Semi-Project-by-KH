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

@WebServlet("/admin/adminQnaQList")
public class AdminQnaQListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminQnaQListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Client loginClient = (Client) request.getSession().getAttribute("loginClient");
//		if (loginClient != null && loginClient.getUserType() == 3) {
//
//		}
		int cPage;
//		int type;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
//			type = Integer.parseInt(request.getParameter("type"));
//			if (!(type == 0 || type == 1 || type == 2)) {
//				type = 0;
//			}
		} catch (NumberFormatException nfe) {
			cPage = 1;
//			type = 0;
		}

		int numPerPage = 15;
		int totalBoardQna = new BoardQnaQService().selectCountBoardQnaQ(0);
		List<BoardQnaQ> list = new BoardQnaQService().selectListPage(cPage, numPerPage, 0);
		int totalPage = (int) Math.ceil((double) totalBoardQna / numPerPage);

		String pageBar = "";
		int pageSizeBar = 5;

		int pageNo = ((cPage - 1) / pageSizeBar) * pageSizeBar + 1;
		int pageEnd = pageNo + pageSizeBar - 1;

		if (pageNo == 1) {
			pageBar += "<span>[이전]</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/admin/adminQna?cPage=" + (pageNo - 1)
					+ ">[이전]</a>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href=" + request.getContextPath() + "/admin/adminQna?cPage=" + pageNo + ">"
						+ pageNo + "</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/admin/adminQna?cPage=" + (pageNo) + ">[다음]</a>";
		}

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list", list);
//		request.setAttribute("type", type);
		request.getRequestDispatcher("/views/admin/adminQnaQList.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
