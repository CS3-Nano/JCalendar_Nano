package beans;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

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
	public String crtNwHash(String msg) {		
		String digest = null;
		String hash=null;		
		String salt;
		try {
			salt = this.getNewSalt();
			digest=this.getNewHash(msg, salt);
			System.out.println("Salt is :"+salt+" length :"+salt.length());
			hash=salt.concat(digest);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
			
		return hash;
	}
	public String getNewHash(String msg,String salt){
		String digest = null;
		try {
			MessageDigest msgDgst = MessageDigest.getInstance("SHA-256");
			msgDgst.update(salt.getBytes());
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
		System.out.println(digest);
		return digest;
		
	}
	public String getSaltFrmMsg(String msg) {
		String salt=msg.substring(0,11);
		return salt;
	}
	public String getHashFrmMsg(String msg) {
		String digest=msg.substring(11,75);
		return digest;
	}
	public String getNewSalt() throws NoSuchAlgorithmException{
			SecureRandom sr=SecureRandom.getInstance("SHA1PRNG");
			byte[] salt=new byte[16];
			sr.nextBytes(salt);
			return salt.toString();				
	}
	public String getCombine(String salt,String dgst){
		return salt.concat(dgst);
	}
}
