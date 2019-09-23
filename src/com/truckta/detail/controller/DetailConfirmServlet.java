package com.truckta.detail.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.matching.complete.model.service.MatchingCompleteService;
import com.truckta.matching.model.vo.Matching;

@WebServlet("/detailConfirm")
public class DetailConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DetailConfirmServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("id");
//		System.out.println(id);
		String room = request.getParameter("room");
//		System.out.println(room);
		
		Matching mc = new MatchingCompleteService().matData(id, room);
		if(mc == null) {
			request.setAttribute("message", "매칭되지 않았습니다");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
//		System.out.println(mc);
		int result = new MatchingCompleteService().insertData(mc);
		if (result > 0) {
			System.out.println("입력 성공 : " + result);
			request.setAttribute("message", "매칭되지 되었습니다. 배송 잘 부탁합니다!");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			
		}else {
			request.setAttribute("message", "매칭되지 않았습니다");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
