package com.truckta.client.controller;

import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;

import common.template.DataEncryptionTemplate;

@WebServlet("/clientSignUp.do")
public class ClientJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final private int maxSize = 1024 * 1024 * 3;

	public ClientJoinServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String path = request.getServletContext().getRealPath("/images/profile_images");
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest mul = new MultipartRequest(request, path, maxSize, "utf-8", policy);
		String now = new SimpleDateFormat("yyyyMMddHmsS").format(new java.util.Date());
		String fileName = mul.getFilesystemName("profile");
		System.out.println(fileName);
		
		Client temp = new Client();
		temp.setId(mul.getParameter("id"));
		temp.setPw(DataEncryptionTemplate.encryptionToSHA256(mul.getParameter("pw")));
		temp.setName(mul.getParameter("name"));
		temp.setUserType(1);
		
		if(fileName!=null) {
			String dir = path + "/" + fileName;

			File oldFile = new File(dir);
			dir = path + "/" + now + fileName;

			File newFIle = new File(dir);
			oldFile.renameTo(newFIle);
			temp.setProfile(dir);
		}
		
		ClientService cs = new ClientService();

		int result = cs.JoinClient(temp);
		if (result == 1) {
			System.out.println(":: LOG :: " + now + " :: " + " Client Add : " + temp.getId());
			response.getWriter().print("<script>alert('회원가입에 성공했습니다. 메인페이지로 이동합니다.')</script>");
			response.sendRedirect("http://www.truckta.com/index.html");
		} else {
			System.out.println(":: LOG :: " + now + " :: " + " Client Add Fail");
			response.getWriter().print("<script>alert('회원가입에 실패했습니다. 메인페이지로 이동합니다.')</script>");
			response.sendRedirect("http://www.truckta.com/testfail.html");
		}

	}
}
