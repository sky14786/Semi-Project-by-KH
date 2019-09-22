package com.truckta.boardmatching.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
 * Servlet implementation class MainDateSearch
 */
@WebServlet("/maindatesearch")
public class MainDateSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainDateSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//날짜
		String searchdate = request.getParameter("datesearch");
//		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S").parse(searchdate);
//		System.out.println("!!!!!!!!searchdate"+searchdate);
		//List<BoardMatching> datesearch= new MainService().searchDate();
		
		int cPage;
		String selectGu = request.getParameter("selectGu");
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		} catch (NumberFormatException e) {
			cPage = 1;
		}

		int numPerPage = 8;
		int totalBaordMatching = new MainService().selectCountBoardMatching(selectGu);
		List<BoardMatching> list_page = new MainService().searchDate(cPage, numPerPage, searchdate); //selectGu ->searchdate
		//사진
		List<FileMatching> fileList = new FileMatchingService().selectListPage(cPage,numPerPage);
		int totalPage = (int) Math.ceil((double) totalBaordMatching / numPerPage);
		String pageBar = "";
		int pageSizeBar = 5;
		int pageNo = ((cPage - 1) / pageSizeBar) * pageSizeBar + 1;
		int pageEnd = pageNo + pageSizeBar - 1;
		if (pageNo == 1) {
			pageBar += "<span>[이전]</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/gusearch?cPage=" + (pageNo - 1) + "&selectGu="
					+ selectGu + ">[이전]</a>";
		}
		
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				pageBar += "<span class='cPage'>" + pageNo + "</span>";
			} else {
				pageBar += "<a href=" + request.getContextPath() + "/gusearch?cPage=" + pageNo + "&selectGu="
						+ selectGu + ">" + pageNo + "</a>";
			}
			pageNo++;
		}
		
		if (pageNo > totalPage) {
			pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href=" + request.getContextPath() + "/gusearch?cPage=" + (pageNo) + "&selectGu="
					+ selectGu + ">[다음]</a>";
		}
		////////////
//		List<FileMatching> file_matching = new MainService().fileSearch();

		request.setAttribute("pageBar", pageBar);
		request.setAttribute("cPage", cPage);
		// request.setAttribute("members",list1);//??
//		request.setAttribute("numPerPage", numPerPage);// ?
		request.setAttribute("list_page", list_page);
		request.setAttribute("selectGu", selectGu);

		// request.setAttribute("list", list);
		//사진
		request.setAttribute("fileList", fileList);
//		request.setAttribute("imgsearch", file_matching);
//		System.out.println("######servlet imgsearch :" + file_matching);

		request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
