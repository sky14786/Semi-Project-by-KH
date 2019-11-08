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
import com.truckta.file.matching.model.service.FileMatchingService;
import com.truckta.file.matching.model.vo.FileMatching;

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
		List<FileMatching> fileList = new FileMatchingService().selectFileList();
		// String type=request.getParameter("searchType");
		String keyword = request.getParameter("searchKeyword");
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));

		} catch (NumberFormatException e) {
			cPage = 1;
		}
		int numPerPage = 8;
		int totalData = new MainService().selectCountMember(keyword);
		List<BoardMatching> list = new MainService().selectMemberList(keyword, cPage, numPerPage);
		//List<FileMatching> fileList = new FileMatchingService().selectListPage(cPage,numPerPage);
		// 占쏙옙체 占쏙옙占쏙옙占쏙옙 占쏙옙占� (占쏙옙占쏙옙징처占쏙옙)
		int totalPage = (int) Math.ceil((double) totalData / numPerPage);

		// 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
		int pageSizeBar = 5;
		String pageBar = ""; 
		int pageNo = ((cPage - 1) / pageSizeBar) * pageSizeBar + 1;
		int pageEnd = pageNo + pageSizeBar - 1;

		// 占쏙옙占쏙옙湄占� pageBar占쏙옙 占쏙옙占쏙옙占싹깍옙
		if (pageNo == 1) {
			pageBar += "<span>[�씠�쟾]</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/main/mainFinder?cPage=" + (pageNo - 1)
					+ "&searchKeyword=" + keyword + "'>[�씠�쟾]</a>";
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
			pageBar += "<span>[�떎�쓬]</span>";
		} else {
			pageBar += "<a href='" + request.getContextPath() + "/admin/memberFinder?cPage=" + (pageNo)
					+ "&searchKeyword=" + keyword + "'>[�떎�쓬]</a>";
		}
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("fileList", fileList);
		request.setAttribute("searchKeyword", keyword);
//		System.out.println("####setattribute"+keyword);
		request.setAttribute("cPage", cPage);
		request.setAttribute("list_page", list);
//		System.out.println("#####setattributelist_page:"+list);
		request.getRequestDispatcher("/mainListMoog.jsp").forward(request, response);
		///views
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
