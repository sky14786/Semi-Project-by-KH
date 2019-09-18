package common.template;

import java.io.FileReader;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SMTPAuthentication extends Authenticator {

	public PasswordAuthentication getPasswordAuthentication() {
		Properties prop = new Properties();
		PasswordAuthentication pa = null;
		String path = SMTPAuthentication.class.getResource("/common/template/smtp.properties").getPath();
		try {
			prop.load(new FileReader(path));
			pa = new PasswordAuthentication(prop.getProperty("id"), prop.getProperty("pw"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pa;
	}

	public static boolean sendmail(String content, String to, String subject) {
		boolean isSend = true;
		String user = "truckta.team@gmail.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		String password = "truck12#";
		// SMTP 서버 정보를 설정한다.
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			final String charSet = "UTF-8";
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));

			// 수신자메일주소
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Subject
			message.setSubject(subject,charSet); // 메일 제목을 입력

			// Text
			message.setText(content,charSet); // 메일 내용을 입력
			
			message.setHeader("content-Type", "text/html");

			// send the message
			Transport.send(message); //// 전송

		} catch (AddressException e) {
			isSend = false;
			e.printStackTrace();
		} catch (MessagingException e) {
			isSend = false;
			e.printStackTrace();
		}
		return isSend;
	}
}
