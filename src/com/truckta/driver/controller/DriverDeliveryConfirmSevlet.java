package com.truckta.driver.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.matching.complete.model.service.MatchingCompleteService;
import com.truckta.matching.model.service.MatchingService;
import com.truckta.matching.model.vo.Matching;

@WebServlet("/driverDeliConfirm")
public class DriverDeliveryConfirmSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DriverDeliveryConfirmSevlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 배송완료 비지니스 로직
		String boardNo = request.getParameter("boardNo");
		String id = request.getParameter("id");
		System.out.println("000000000000     "+boardNo);
		System.out.println(id);
		Matching mc = new MatchingCompleteService().matData(id, boardNo);
		if(mc == null) {
			request.setAttribute("message", "문제가 발생하여 완료할 수 없습니다");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		int result = new MatchingService().dirverConfirm(mc.getMatNo());
		
		if(result > 0) {
			String msg = "배송 완료!";
			request.setAttribute("message", msg);
			String path = "/my/pageTopDriver";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			request.setAttribute("message", "문제가 발생하여 완료할 수 없습니다");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
