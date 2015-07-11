package service;

import java.sql.SQLException;

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
		
		for (LogIn logusr : LogInMngr.userLog) {
			if(logusr.getUsername().equals(logIn.getUsername())){
				if(logusr.getPasswrd().equals(logIn.getPasswrd())){
					logIn.setUserID(logusr.getUserID());
					return true;
				}
			}
		}
		return false;
	}
	
}
