package com.truckta.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;

/**
 * Servlet implementation class ClientUpdateServlet
 */
@WebServlet("/client/clientUpdate")
public class ClientUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Client c=new Client();
		c.setId(request.getParameter("id"));
		c.setName(request.getParameter("name"));
		c.setProfile(request.getParameter("profile"));
		c.setEmail(request.getParameter("email"));
		
		
		int result=new ClientService().updateClient(c);
		
		String msg=result>0?"회원수정이 완료되었습니다.":"회원수정을 실패하였습니다";
		String loc="/clientUpdate?id="+c.getId();
		
		request.setAttribute("msg",msg );
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
