package common.filter;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncyptWrapper extends HttpServletRequestWrapper {
	
	public EncyptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		String value="";
		/* name = "www.truckta.com"+ name */; 
		if(name!=null && (name.equals("pw")||name.equals("passwordNew"))) {
			super.getParameter(name);//client 보낸실제값
			value=getSha512(super.getParameter(name));
			return value;
		}
		else {
			return super.getParameter(name);
		}
	}
	
	private String getSha512(String val) {
		
		String encPwd="";
		MessageDigest md=null;
		try {
			md=MessageDigest.getInstance("SHA-512");
			
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes=val.getBytes(Charset.forName("UTF-8"));
		
		md.update(bytes);
		
		encPwd=Base64.getEncoder().encodeToString(md.digest());
		return encPwd;
	}
	
	
}