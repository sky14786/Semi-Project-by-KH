package com.truckta.detail.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.detail.model.vo.Detail;
import com.truckta.detail.service.DetailService;

/**
 * Servlet implementation class DetailServlet
 */
@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardNo = request.getParameter("boardNo");
		System.out.println(boardNo);
		
		DetailService service = new DetailService();
		Detail d = service.selectDetail(boardNo);
		String startAddr[] = d.getStartAddr().split(",");
		String endAddr[] = d.getEndAddr().split(",");
		
		
//		System.out.println(startAddr[1]);
//		System.out.println(endAddr[1]);
		
		request.setAttribute("startAddr", startAddr[1]);
		request.setAttribute("endAddr", endAddr[1]);
		request.setAttribute("boardNo", boardNo);
		request.setAttribute("d", d);
		request.getRequestDispatcher("/views/detail/detailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
