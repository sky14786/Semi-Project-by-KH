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

@WebServlet("/clientSignUp")
public class ClientJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final private int maxSize = 1024 * 1024 * 3;

	public ClientJoinServlet() {
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

		Client temp = new Client();
		temp.setId(mul.getParameter("id"));
		temp.setPw(DataEncryptionTemplate.encryptionToSHA512(mul.getParameter("pw")));
		temp.setName(mul.getParameter("name"));
		temp.setEmail(mul.getParameter("email"));

		if (fileName != null) {
			String dir = path + "/" + fileName;
			File oldFile = new File(dir);
			String tempDir = path + "/" + temp.getId() + "_" + now + "_" + fileName;
			String tempFileName = temp.getId() + "_" + now + "_" + fileName;
			temp.setProfile(tempFileName);

			File newFile = new File(tempDir);
			oldFile.renameTo(newFile);
		}

		int result = new ClientService().JoinClient(temp);

		if (result == 1) {
//			System.out.println(":: Truckta_LOG :: " + now + " :: " + " Client Add : " + temp.getId());
			request.setAttribute("location", "/");
			request.setAttribute("message", "회원가입에 성공했습니다. 메인페이지로 이동합니다.");
			request.getRequestDispatcher("views/common/msg.jsp").forward(request, response);
		} else {
//			System.out.println(":: Truckta_LOG :: " + now + " :: " + " Client Add Fail");
			request.setAttribute("location", "/");
			request.setAttribute("message", "회원가입에 실패했습니다. 메인페이지로 이동합니다.");
			request.getRequestDispatcher("views/common/msg.jsp").forward(request, response);
		}

	}
}
