package com.truckta.client.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;

import common.template.DataEncryptionTemplate;

@WebServlet("/ClientUpdateEndServlet.do")
public class ClientUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final private int maxSize = 1024 * 1024 * 3;

	public ClientUpdateEndServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
			request.getSession().setAttribute("isCertified", false);
			request.setAttribute("location", "/");
			request.setAttribute("message", "잘못된 접근입니다. 홈으로 이동합니다.");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}

		String path = request.getServletContext().getRealPath("/images/profile_images");
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest mul = new MultipartRequest(request, path, maxSize, "utf-8", policy);
		String now = new SimpleDateFormat("yyyyMMddHmsS").format(new java.util.Date());
		String fileName = mul.getFilesystemName("profile");
		System.out.println(fileName);

		Client c = new Client();
		c.setPw(DataEncryptionTemplate.encryptionToSHA256(mul.getParameter("pw")));
		c.setName(mul.getParameter("name"));
		c.setEmail(mul.getParameter("email"));
		c.setId(mul.getParameter("id"));

		if (fileName != null) {
			String dir = path + "/" + fileName;

			File oldFile = new File(dir);
			dir = path + "/" + now + fileName;

			File newFIle = new File(dir);
			oldFile.renameTo(newFIle);
			c.setProfile(dir);
		}

		ClientService cs = new ClientService();

		int result = cs.updateClient(c);
		if (result == 1) {
			System.out.println(":: LOG :: " + now + " :: " + " Client update : " + c.getId());
			response.getWriter().print("<script>alert('정보업데이트에 성공했습니다. 메인페이지로 이동합니다.')</script>");
			response.sendRedirect("/views/common/header.jsp");
		} else {
			System.out.println(":: LOG :: " + now + " :: " + " Client update Fail");
			response.getWriter().print("<script>alert('정보업데이트에 실패했습니다. 메인페이지로 이동합니다.')</script>");
			
		}

	}
}
