package com.truckta.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.truckta.model.service.ClientService;
import com.truckta.model.vo.Client;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/ClientJoin.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JoinServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		int maxSize = 1024 * 1024 * 3;
		String path = request.getServletContext().getRealPath("WEB-INF/images");
		MultipartRequest mul = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());

		String fileNmae = mul.getFilesystemName("profile");
		String dir = path + "/" + fileNmae;
		Client temp = new Client();
		temp.setId(mul.getParameter("id"));
		temp.setPw(mul.getParameter("pw"));
		temp.setName(mul.getParameter("name"));
		temp.setProfile(dir);

		ClientService cs = new ClientService();

		int result = cs.JoinClient(temp);

		if (result == 1) {
			response.sendRedirect("http://www.truckta.com/test.html");
		} else {
			response.sendRedirect("http://www.truckta.com/testfail.html");
		}

	}
}
