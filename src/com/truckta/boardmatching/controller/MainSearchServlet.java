package com.truckta.boardmatching.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardmatching.model.service.MainService;
import com.truckta.boardmatching.model.vo.BoardMatching;

/**
 * Servlet implementation class MainSearchFinderServlet
 */
@WebServlet("/main/mainFinder")
public class MainSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// String type=request.getParameter("searchType");
		String keyword = request.getParameter("searchKeyword");
		System.out.println("####servlet:" + keyword);
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));

		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 8;
		int totalData = new MainService().selectCountMember(keyword);
		List<BoardMatching> list = new MainService().selectMemberList(keyword, cPage, numPerPage);

		// ��ü ������ ��� (����¡ó��)
		int totalPage = (int) Math.ceil((double) totalData / numPerPage);

		// �������� ����
		int pageSizeBar = 5;// �������� ũ�� (������ ���ڰ���)
		String pageBar = ""; // ������ �ڵ�(pageBar����) ������ ���忭
		int pageNo = ((cPage - 1) / pageSizeBar) * pageSizeBar + 1;
		int pageEnd = pageNo + pageSizeBar - 1;

		// ����ڵ� pageBar�� �����ϱ�
		if (pageNo == 1) {
			pageBar += "<span>[����]</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/main/mainFinder?cPage=" + (pageNo - 1)
					+ "&searchKeyword=" + keyword + "'>[����]</a>";
		}
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (cPage == pageNo) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href='" + request.getContextPath() + "/main/mainFinder?cPage=" + (pageNo)
						+ "&searchKeyword=" + keyword + "'>" + pageNo + "</a>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += "<span>[����]</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/admin/memberFinder?cPage=" + (pageNo)
					+ "&searchKeyword=" + keyword + "'>[����]</a>";
		}
		request.setAttribute("pageBar", pageBar);

		request.setAttribute("searchKeyword", keyword);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list_page", list);
		request.getRequestDispatcher("/views/mainList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}