package com.truckta.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.truckta.model.service.DriverService;
import com.truckta.model.vo.Driver;

import common.template.DataEncryptionTemplate;

@WebServlet("/driverSignUp.do")
public class DriverJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final private int maxSize = 1024 * 1024 * 3;

	public DriverJoinServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String path = request.getServletContext().getRealPath("WEB-INF/resource/images/uploaded_files");
		MultipartRequest mul = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
		String now = new SimpleDateFormat("yyyyMMddHmsS").format(new java.util.Date());
		ArrayList<String> fileNames = new ArrayList<String>();
		String dirs[] = new String[3];
		Driver temp = new Driver();
		temp.setId(mul.getParameter("id"));
		temp.setPw(DataEncryptionTemplate.encryptionToSHA256(mul.getParameter("pw")));
		temp.setName(mul.getParameter("name"));

		Date tempDate = new Date(Integer.parseInt(mul.getParameter("birth1")),
				Integer.parseInt(mul.getParameter("birth2")), Integer.parseInt(mul.getParameter("birth3")));
		temp.setDateOfBirth(tempDate);

		temp.setCartype(mul.getParameter("carType"));

		fileNames.add(mul.getFilesystemName("dLicense"));
		fileNames.add(mul.getFilesystemName("bLincese"));
		fileNames.add(mul.getFilesystemName("carPic"));

		for (int i = 0; i < fileNames.size(); i++) {
			String dir = path + "/" + fileNames.get(i);
			File oldFile = new File(dir);
			dir = path + "/" + now + fileNames.get(i);
			dirs[i] = dir;
			File newFile = new File(dir);
			oldFile.renameTo(newFile);
		}
		temp.setdLicense(dirs[0]);
		temp.setbLicense(dirs[1]);
		temp.setCarpic(dirs[2]);

		int result = new DriverService().joinDriver(temp);

		if (result == 1) {
			System.out.println(":: LOG :: " + now + " :: " + " Driver Add : " + temp.getId());
			response.getWriter().print("<script>alert('회원가입에 성공했습니다. 메인페이지로 이동합니다.')</script>");
			response.sendRedirect("http://www.truckta.com/test.html");
		} else {
			System.out.println(":: LOG :: " + now + " :: " + " Driver Add Fail");
			response.getWriter().print("<script>alert('회원가입에 실패했습니다. 메인페이지로 이동합니다.')</script>");
			response.sendRedirect("http://www.truckta.com/testfail.html");
		}
	}

}
