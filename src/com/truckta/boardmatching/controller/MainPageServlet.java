package com.truckta.boardmatching.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.boardmatching.model.service.MainService;
import com.truckta.boardmatching.model.vo.BoardMatching;
import com.truckta.file.matching.model.service.FileMatchingService;
import com.truckta.file.matching.model.vo.FileMatching;

@WebServlet("/mainpageload")
public class MainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MainPageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		List<BoardMatching> list = new MainService().selectList();
		List<FileMatching> fileList = new FileMatchingService().selectFileList();
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}

		int numPerPage = 9;
		int totalMember = new MainService().selectCountMember();
		int totalFile = new FileMatchingService().selectCountFileMatching();
//				List<Member> list=new MemberService().selectList();
		List<BoardMatching> list_page = new MainService().selectListPage(cPage, numPerPage);
		
		int totalPage = (int) Math.ceil((double) totalMember / numPerPage);
		String pageBar = "";
		int pageSizeBar = 5;
		int pageNo = ((cPage - 1) / pageSizeBar) * pageSizeBar + 1;
		int pageEnd = pageNo + pageSizeBar - 1;
		if (pageNo == 1) {
			pageBar += "<span>[이전]</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/mainpageload?cPage=" + (pageNo - 1) + ">[이전]</a>";
		}
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href=" + request.getContextPath() + "/mainpageload?cPage=" + pageNo + ">" + pageNo
						+ "</a>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/mainpageload?cPage=" + (pageNo) + ">[다음]</a>";
		}
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		
		request.setAttribute("numPerPage", numPerPage);// ?
		request.setAttribute("list_page", list_page);
		request.setAttribute("fileList", fileList);
		
		request.getRequestDispatcher("/mainListMoog.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
