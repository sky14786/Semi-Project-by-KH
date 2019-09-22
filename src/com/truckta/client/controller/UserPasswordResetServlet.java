package com.truckta.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.truckta.client.model.service.ClientService;

import common.template.DataEncryptionTemplate;

@WebServlet("/user/resetPassword")
public class UserPasswordResetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserPasswordResetServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String pwChk = request.getParameter("password_check");
		String key = (String) request.getSession().getAttribute("key");
		String keyChk = request.getParameter("key");
		
		if(pw.equals(pwChk)&& key.equals(keyChk)) {
			int result = new ClientService().resetPassword(id, DataEncryptionTemplate.encryptionToSHA512(pw));
			if(result==1) {
				request.getSession().removeAttribute("key");
				System.out.println(":: Truckta_LOG :: " + "USER_RESET PASSWORD : " + id);
				request.setAttribute("location", "/");
				request.setAttribute("message", "비밀번호 초기화에 성공했습니다.");
				request.getRequestDispatcher("../views/common/msg.jsp").forward(request, response);
				
			}else {
				System.out.println(":: Truckta_LOG :: " + "USER_RESET PASSWORD FAIL(?): " + id);
				request.setAttribute("message", "실패했습니다. 관리자에게 문의하세요!");
				request.setAttribute("location", "/");
				request.getRequestDispatcher("../views/common/msg.jsp").forward(request, response);
			}
		}else if(key.equals(keyChk)) {
			System.out.println(":: Truckta_LOG :: " + "USER_RESET PASSWORD FAIL(PW): " + id);
			request.setAttribute("location", "/user/pwReset.jsp");
			request.setAttribute("message", "비밀번호가 다릅니다.");
			request.getRequestDispatcher("../views/common/msg.jsp").forward(request, response);
		}else {
			System.out.println(":: Truckta_LOG :: " + "USER_RESET PASSWORD FAIL(KEY): " + id);
			request.setAttribute("location", "/user/pwReset.jsp");
			request.setAttribute("message", "인증번호가 다릅니다.");
			request.getRequestDispatcher("../views/common/msg.jsp").forward(request, response);
		}
		request.getSession().removeAttribute("key");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
