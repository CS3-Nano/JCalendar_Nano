package beans;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {

	public String getHash(String msg) {
		
		String digest = null;
		try {
			MessageDigest msgDgst = MessageDigest.getInstance("SHA-256");
			msgDgst.update(msg.getBytes());
			byte digstData[]=msgDgst.digest();
			StringBuffer strBffr=new StringBuffer();
			for (int i = 0; i < digstData.length; i++) {
				strBffr.append(Integer.toString((digstData[i] & 0xff)+ 0x100, 16).substring(1));
			}
			digest=strBffr.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return digest;
	}
}
