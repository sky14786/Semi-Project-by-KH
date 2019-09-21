package com.truckta.driver.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.truckta.driver.model.service.DriverService;
import com.truckta.driver.model.vo.Driver;
import com.truckta.file.driver.model.service.FileDriverService;
import com.truckta.file.driver.model.vo.FileDriver;

@WebServlet("/driverSignUp")
public class DriverJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final private int maxSize = 1024 * 1024 * 3;

	public DriverJoinServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		if (!ServletFileUpload.isMultipartContent(request)) {
//			request.getSession().setAttribute("isCertified", false);
//			request.setAttribute("location", "/");
//			request.setAttribute("message", "잘못된 접근입니다. 홈으로 이동합니다.");
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		}

		String path = request.getServletContext().getRealPath("/images/profile_images");
		MultipartRequest mul = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
		String now = new SimpleDateFormat("yyyyMMddHmsS").format(new java.util.Date());
		ArrayList<String> fileNames = new ArrayList<String>();
		Driver temp = new Driver();
		temp.setId(mul.getParameter("id"));
		temp.setDateOfBirth(mul.getParameter("dateOfBirth"));
		temp.setCarType(Integer.parseInt(mul.getParameter("carType")));
		temp.setbLicense(mul.getParameter("bLicense"));
		temp.setdLicense(mul.getParameter("dLicense"));

		Iterator fileNameIter = (Iterator) mul.getFileNames();
		while (fileNameIter.hasNext()) {
			String tryUploadFileNameTag = (String) fileNameIter.next();
			if (mul.getFilesystemName(tryUploadFileNameTag) != null) {
				fileNames.add(mul.getFilesystemName(tryUploadFileNameTag));
			}
		}

		List<FileDriver> files = new ArrayList<FileDriver>();
		
		for (int i = 0; i < fileNames.size(); i++) {
			String dir = path + "/" + fileNames.get(i);
			File oldFile = new File(dir);

			String tempDir = path + "/" + temp.getId() + "_" + now + "_" + fileNames.get(i);
			String tempFileName = temp.getId() + "_" + now + "_" + fileNames.get(i);
			FileDriver fd = new FileDriver(temp.getId(), tempFileName);
			files.add(fd);
			
			File newFile = new File(tempDir);
			oldFile.renameTo(newFile);
		}


		int result = new DriverService().joinDriver(temp);
		int isUpload = new FileDriverService().joinDriver(files);

		if (result == 1 && isUpload == files.size()) {
			System.out.println(":: Truckta_LOG :: " + now + " :: " + " Driver Add : " + temp.getId());
			request.setAttribute("location", "/");
			request.setAttribute("message", "신청했습니다. 관리자의 승인 후 이용가능합니다.");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		} else {
			System.out.println(":: Truckta_LOG :: " + now + " :: " + " Driver Add Fail : " + temp.getId());
			request.setAttribute("location", "/");
			request.setAttribute("message", "실패했습니다. 메인페이지로 이동합니다.");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}

}
