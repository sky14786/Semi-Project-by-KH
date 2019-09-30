package com.truckta.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.truckta.cartype.model.service.CarTypeService;
import com.truckta.cartype.model.vo.CarType;
import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;
import com.truckta.driver.model.service.DriverService;
import com.truckta.driver.model.vo.Driver;
import com.truckta.file.driver.model.service.FileDriverService;
import com.truckta.file.driver.model.vo.FileDriver;

@WebServlet("/mypageUserLoad")
public class MypageUserLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Client cl = (Client)session.getAttribute("loginClient");
		if(cl == null) {
			request.setAttribute("message", "수정 페이지를 불러올 수 없습니다");
			String path = "/index.jsp";
			request.setAttribute("location", path);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		String id = cl.getId();
		// 유저 타입
//		cl.getUserType() 
		boolean isDriverView = true;
		if(cl.getUserType() == 2) { //1:c 2:d 3:Admin
			isDriverView = false;
		}
//		 = Boolean.parseBoolean(request.getParameter("isDriverView"));
		Client client = new ClientService().findClient(id);
		Driver driver = new DriverService().findDriver(id);
		
		List<CarType> carTypeList = new ArrayList<CarType>();
		carTypeList = new CarTypeService().selectAll();
		if (driver != null) {
			List<FileDriver> fileList = new FileDriverService().findDriverFile(id);
			request.setAttribute("fileList", fileList);
		}
		if(carTypeList!=null && carTypeList.size()>0) {
			request.setAttribute("carType", carTypeList);
		}
		
		request.setAttribute("driver", driver);
		request.setAttribute("client", client);
		request.setAttribute("isDriverView", isDriverView);

		request.getRequestDispatcher("/views/myPage/myPageUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	

}


