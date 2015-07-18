package service;

import java.sql.SQLException;

import beans.Hash;
import beans.LogIn;
import dbmanager.LogInMngr;

public class LogInService {

	public LogInService() {
		try {
			LogInMngr.readAllLogIn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public boolean authenticate(LogIn logIn){	
		Hash hsh=new Hash();
		for (LogIn logusr : LogInMngr.userLog) {
			if(logusr.getUsername().equals(logIn.getUsername())){
				String salt=hsh.getSaltFrmMsg(logusr.getPasswrd());
				String pw=hsh.getNewHash(logIn.getPasswrd(), salt);
				String pwcomb=hsh.getCombine(salt, pw);
				if(logusr.getPasswrd().equals(pwcomb)){
					logIn.setUserID(logusr.getUserID());
					return true;
				}
			}
		}
		return false;
	}
	
}
