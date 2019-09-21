package com.truckta.admin.controller;

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

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;
import com.truckta.driver.model.service.DriverService;
import com.truckta.driver.model.vo.Driver;
import com.truckta.file.driver.model.service.FileDriverService;
import com.truckta.file.driver.model.vo.FileDriver;

@WebServlet("/admin/adminUserUpdate")
public class AdminUserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final private int maxSize = 1024 * 1024 * 3;

	public AdminUserUpdateServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		FileDriverService service = new FileDriverService();
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

		String target = mul.getParameter("target");
		String id = mul.getParameter("id");
		String name = mul.getParameter("name");
		String email = mul.getParameter("email");
		String bLicense = mul.getParameter("bLicense");
		String dLicense = mul.getParameter("dLicense");
		String dateOfBirth = mul.getParameter("dateOfBirth");
		int carType = Integer.parseInt(mul.getParameter("carType"));

		Client c = null;
		String profile = null;
		if (mul.getFilesystemName("profile") == null) {
			c = new Client(id, name, email, mul.getParameter("org_profile"));
		} else {
			profile = mul.getFilesystemName("profile");
			c = new Client(id, name, email, profile);
		}

		if (profile != null) {
			String dir = path + "/" + profile;
			File oldFile = new File(dir);
			String tempDir = path + "/" + c.getId() + "_" + now + "_" + profile;
			String tempFileName = c.getId() + "_" + now + "_" + profile;
			c.setProfile(tempFileName);

			File newFile = new File(tempDir);
			oldFile.renameTo(newFile);
		}

		Driver d = new Driver(id, dateOfBirth, carType, dLicense, bLicense);

		Iterator fileNameIter = (Iterator) mul.getFileNames();
		
		ArrayList<FileDriver> fileDriverList = new ArrayList<FileDriver>();
		
		
		List<FileDriver> files =  service.findDriverFile(id);
		
		int i = 0;
		while (i<6&&fileNameIter.hasNext()) {
			String tryUploadFileNameTag = (String) fileNameIter.next();
			
			if (mul.getFilesystemName(tryUploadFileNameTag)==null) {
				i++;
				
			} else{
				int result =0;
				if(i<files.size()) {
					result = service.deleteDriverFile(files.get(i).getFileName());
				}
				
				if(result==1) {
					String dir = path + "/" + mul.getFilesystemName(tryUploadFileNameTag);
					File oldFile = new File(dir);
					String tempDir = path + "/" + d.getId() + "_" + now + "_"
							+ mul.getFilesystemName(tryUploadFileNameTag);
					String tempFileName = d.getId() + "_" + now + "_" + mul.getFilesystemName(tryUploadFileNameTag);
					FileDriver fd = new FileDriver(d.getId(), tempFileName);
					File newFile = new File(tempDir);
					oldFile.renameTo(newFile);
					if (service.joinDriver(fd) == 1) {
						i++;
					}
				}
			}
		}

		if (i == 5 && new DriverService().adminUpdateDriver(d, id) == 1
				&& new ClientService().adminUpdateClient(c, id) == 1) {
			System.out.println(":: Truckta_LOG :: " + now + " :: " + " Admin_Driver_Update : " + c.getId());
			request.setAttribute(id, c.getId());
			request.setAttribute("isDriverView", true);
			request.getRequestDispatcher("admin/adminUserDetail").forward(request, response);
		} else if (new ClientService().adminUpdateClient(c, id) == 1) {
			System.out.println(":: Truckta_LOG :: " + now + " :: " + " Admin_Client_Update : " + c.getId());
			request.setAttribute(id, c.getId());
			request.setAttribute("isDriverView", false);
			request.getRequestDispatcher("admin/adminUserDetail").forward(request, response);
		} else {
			System.out.println(":: Truckta_LOG :: " + now + " :: " + " Admin_User_Update Fail : " + c.getId());
			request.setAttribute("location", "/");
			request.setAttribute("message", "실패! 개발자에게 문의하세요");
			request.getRequestDispatcher("views/common/msg.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
