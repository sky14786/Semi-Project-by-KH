package com.truckta.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.truckta.boardqna.q.model.service.BoardQnaQService;
import com.truckta.boardqna.q.model.vo.BoardQnaQ;
import com.truckta.file.driver.model.vo.FileDriver;
import com.truckta.file.qna.model.service.FileQnaService;
import com.truckta.file.qna.model.vo.FileQna;

@WebServlet("/admin/adminBoardQnaQUpdate")
public class AdminBoardQnaQUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final private int maxSize = 1024 * 1024 * 3;

	public AdminBoardQnaQUpdateServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
			request.getSession().setAttribute("isCertified", false);
			request.setAttribute("location", "/");
			request.setAttribute("message", "잘못된 접근입니다. 홈으로 이동합니다.");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		String path = request.getServletContext().getRealPath("/images/qna_images");
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest mul = new MultipartRequest(request, path, maxSize, "utf-8", policy);
		String now = new SimpleDateFormat("yyyyMMddHmsS").format(new java.util.Date());

		FileQnaService fileService = new FileQnaService();
		BoardQnaQService qnaService = new BoardQnaQService();
		int boardNo = Integer.parseInt(mul.getParameter("boardNo"));
		BoardQnaQ temp = qnaService.findBoardQnaQ(boardNo);
		temp.setEtc(mul.getParameter("etc"));
		temp.setTitle(mul.getParameter("title"));

		List<FileQna> fileList = fileService.findFileList(boardNo);

		int i = 0;
		for (; i < 5; i++) {
			String nameTag = "qnaPic" + (i + 1);
			if (mul.getFilesystemName(nameTag) != null) {
				boolean uploadFile = false;
				if (i < fileList.size()) {
					uploadFile = (fileService.deleteQnaFile(fileList.get(i).getFileName()) == 1);
				} else {
					uploadFile = true;
				}

				if (uploadFile) {
					String dir = path + "/" + mul.getFilesystemName(nameTag);
					File oldFile = new File(dir);
					String tempDir = path + "/" + temp.getBoardNo() + "_" + now + "_" + mul.getFilesystemName(nameTag);
					String tempFileName = temp.getBoardNo() + "_" + now + "_" + mul.getFilesystemName(nameTag);
					fileService.uploadQnaFile(new FileQna(temp.getBoardNo(), tempFileName));
					File newFile = new File(tempDir);
					oldFile.renameTo(newFile);
				}
			} else if (i < fileList.size() && mul.getParameter("org_" + nameTag).equals("null")) {

				fileService.deleteQnaFile(fileList.get(i).getFileName());
			}
		}
		i += qnaService.updateQna(temp);

		if (i == 6) {
//			System.out.println(":: Truckta_LOG :: " + now + " :: " + " Admin_QNA_Q_Update : " + temp.getBoardNo());
			request.getRequestDispatcher("adminBoardQnaQUpdateTry?boardNo=" + temp.getBoardNo()).forward(request,
					response);
		} else {
//			System.out.println(":: Truckta_LOG :: " + now + " :: " + " Admin_QNA_Q_Update Fail : " + temp.getBoardNo());
			request.setAttribute("location", "/");
			request.setAttribute("message", "실패! 개발자에게 문의하세요");
			request.getRequestDispatcher("/common/msg.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
