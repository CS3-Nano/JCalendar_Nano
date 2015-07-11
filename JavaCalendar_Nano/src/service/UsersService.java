package service;

import java.sql.SQLException;

import beans.LogIn;
import beans.User;
import dbmanager.LogInMngr;
import dbmanager.UserMngr;

public class UsersService {

	public UsersService() {
		try {
			UserMngr.readUsers();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public User getLoggedUser(LogIn log){
		for (User user : UserMngr.users) {
			if(user.getUserID()==log.getUserID()){
				return user;
			}
		}
		return null;
	}
	public boolean addnew(User usr,LogIn log) throws SQLException {
		System.out.println(usr.getUserFName()+" "+usr.getUserLName());
		UserMngr.readUsers();
		boolean insrt=UserMngr.insert(usr);
		if(insrt){
			insrt=UserMngr.setUserId(usr);	
			System.out.println("user id= "+usr.getUserID());
		}else{
			return false;
		}
		if(insrt){
			log.setUserID(usr.getUserID());
			System.out.println(log.getUsername()+" "+log.getPasswrd()+" "+log.getUserID());
			LogInMngr.readAllLogIn();
			insrt=LogInMngr.insert(log);
			
			System.out.println("work done "+insrt);
		}else{
			return false;
		}
		return insrt;		
	}
}
