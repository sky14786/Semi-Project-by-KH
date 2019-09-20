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

@WebServlet("/admin/adminQnaSearch")
public class AdminQnaSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AdminQnaSearchServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Client loginClient = (Client)
		// request.getSession().getAttribute("loginClient"); if (loginClient != null &&
		// loginClient.getUserType() == 3) {
		//
		// }

		int cPage;
		String search = request.getParameter("search");
		String searchKeyword = request.getParameter("searchKeyword");

		if (search.equals("글번호")) {
			search = "board_No";
		} else if (search.equals("제목")) {
			search = "title";
		} else if (search.equals("작성자")) {
			search = "q_user";
		}
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));

		} catch (NumberFormatException nfe) {
			cPage = 1;
		}

		int numPerPage = 15;
		int totalBoardQnaQ = new BoardQnaQService().selectSearchCountBoardQnaQ(search, searchKeyword);
		List<BoardQnaQ> list = new BoardQnaQService().selectSearchListPage(cPage, numPerPage, search,
				searchKeyword);
		int totalPage = (int) Math.ceil((double) totalBoardQnaQ / numPerPage);

		String pageBar = "";
		int pageSizeBar = 10;

		int pageNo = ((cPage - 1) / pageSizeBar) * pageSizeBar + 1;
		int pageEnd = pageNo + pageSizeBar - 1;

		if (pageNo == 1) {
			pageBar += "<span>[이전]</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/admin/adminQnaSearch?cPage=" + (pageNo - 1)
					+ "&search=" + search + "&searchKeyword=" + searchKeyword + ">[이전]</a>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href=" + request.getContextPath() + "/admin/adminQnaSearch?cPage=" + pageNo
						+ "&search=" + search + "&searchKeyword=" + searchKeyword + ">" + pageNo + "</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/admin/adminQnaSearch?cPage=" + (pageNo)
					+ "&search=" + search + "&searchKeyword=" + searchKeyword + ">[다음]</a>";
		}

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list", list);
		request.setAttribute("searchKeyword", searchKeyword);
		request.setAttribute("search", search);
		request.getRequestDispatcher("/views/admin/adminQnaQList.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
