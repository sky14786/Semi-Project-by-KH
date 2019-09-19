package common.template;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class DataEncryptionTemplate {

	public static String encryptionToSHA256(String temp) {
		MessageDigest md = null;
		try {
			String key = "www.truckta.com" + temp;
			md = MessageDigest.getInstance("SHA-512");
			md.update(key.getBytes());

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} finally {
			System.out.println(":: LOG :: Encryption_Try :: " + temp);
			return byteToHex(md.digest());
		}

	}

	private static String byteToHex(byte[] bytes) {
		StringBuilder builder = new StringBuilder();
		for (byte b : bytes) {
			builder.append(String.format("%02x", b));
		}

		System.out.println(":: LOG :: Encryption :: " + builder.toString());
		return builder.toString();

	}

}
