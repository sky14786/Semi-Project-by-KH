package com.truckta.client.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.truckta.client.model.service.ClientService;
import com.truckta.client.model.vo.Client;

import common.template.SMTPAuthentication;

/**
 * Servlet implementation class PasswordResetServlet
 */
@WebServlet("/user/resetPasswordTry")
public class TryPasswordResetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TryPasswordResetServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Client temp = new ClientService().findClient(request.getParameter("id"));

		if (temp != null) {
			if (temp.getName().equals(request.getParameter("userName"))) {
				if (temp.getEmail().equals(request.getParameter("email"))) {
					// 초기화 메일 전송
					String key = Integer.toString(((int)(Math.random()*99999998)+1));
					String subject = "[Truck ~ Ta] Please Your Reset Password";
					String content = "<div style=\"border:2px gray solid; width:500px;text-align:center;padding:30px;\">"+
							"<h3>"+temp.getName()+"님께서 요청하신 패스워드 초기화 인증번호입니다.</h3>"+
							"<hr>"+
							"<h4>인증번호 : "+key+"</h4>"+
							"</div>";
					SMTPAuthentication.sendmail(content, temp.getEmail(), subject);
//					System.out.println(":: Truckta_LOG :: " + "USER_RESET PASSWORD TRY SEND MAIL : " + temp.getId());
					HttpSession session = request.getSession();
					session.setAttribute("key", key);
					request.setAttribute("id", temp.getId());
					request.getRequestDispatcher("/views/user/pwReset.jsp").forward(request, response);;
				} else {
					// 이메일이 다릅니다.
//					System.out.println(":: Truckta_LOG :: " + "USER_RESET PASSWORD TRY FAIL(EMAIL) : " + temp.getId());
					request.setAttribute("location", "/views/user/resetpassword.jsp");
					request.setAttribute("message", "이메일이 다릅니다.");
					request.getRequestDispatcher("../views/common/msg.jsp").forward(request, response);
				}
			} else if (temp.getEmail().equals(request.getParameter("email"))) {
				// 이름이 다릅니다.
//				System.out.println(":: Truckta_LOG :: " + "USER_RESET PASSWORD TRY FAIL(NAME) : " + temp.getId());
				request.setAttribute("location", "/views/user/resetpassword.jsp");
				request.setAttribute("message", "이름이 다릅니다.");
				request.getRequestDispatcher("../views/common/msg.jsp").forward(request, response);
			}
		} else {
			// 존재하지 않는 유저입니다.
//			System.out.println(":: Truckta_LOG :: " + "USER_RESET PASSWORD TRY FAIL(NOT FOUND)");
			request.setAttribute("location", "/views/user/resetpassword.jsp");
			request.setAttribute("message", "존재하지 않는 사용자 입니다.");
			request.getRequestDispatcher("../views/common/msg.jsp").forward(request, response);
		}
	}
//	 <div style="border: 2px gray solid;width:500px;text-align: center;padding: 30px;">
//     <h3>?님께서 요청하신 패스워드 초기화 인증번호입니다.</h3>
//     <hr>
//     <h4>인증번호 : ?</h4>
//     </div>
}
