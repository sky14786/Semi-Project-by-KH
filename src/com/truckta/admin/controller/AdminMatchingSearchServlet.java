package com.truckta.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.matching.model.service.MatchingService;
import com.truckta.matching.model.vo.Matching;

@WebServlet("/admin/adminMatchingSearch")
public class AdminMatchingSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminMatchingSearchServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Client loginClient = (Client) request.getSession().getAttribute("loginClient");
//		if (loginClient != null && loginClient.getUserType() == 3) {
//
//		}

		int cPage;
		String search = request.getParameter("search");
		String searchKeyword = request.getParameter("searchKeyword");
		
		if (search.equals("매칭번호")) {
			search = "mat_no";
		} else if (search.equals("원글번호")) {
			search = "board_no";
		} else if (search.equals("사용자")) {
			search = "user";
		}
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
			

		} catch (NumberFormatException nfe) {
			cPage = 1;
		}


		int numPerPage = 15;
		int totalMatching = new MatchingService().selectSearchCountMatching(search, searchKeyword);
		List<Matching> list = new MatchingService().selectSearchListPage(cPage, numPerPage, search, searchKeyword);
		int totalPage = (int) Math.ceil((double) totalMatching / numPerPage);

		String pageBar = "";
		int pageSizeBar = 10;

		int pageNo = ((cPage - 1) / pageSizeBar) * pageSizeBar + 1;
		int pageEnd = pageNo + pageSizeBar - 1;

		if (pageNo == 1) {
			pageBar += "<span>[이전]</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/admin/adminMatchingSearch?cPage=" + (pageNo - 1)
					+"&search="+search+"&searchKeyword="+searchKeyword+ ">[이전]</a>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href=" + request.getContextPath() + "/admin/adminMatchingSearch?cPage=" + pageNo + "&search="+search+"&searchKeyword="+searchKeyword+">"
						+ pageNo + "</a>";
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/admin/adminMatchingSearch?cPage=" + (pageNo) + "&search="+search+"&searchKeyword="+searchKeyword+">[다음]</a>";
		}

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list", list);
		request.setAttribute("searchKeyword", searchKeyword);
		request.setAttribute("search", search);
		request.getRequestDispatcher("/views/admin/adminMatchingList.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
