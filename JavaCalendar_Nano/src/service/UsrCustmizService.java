package service;

import java.sql.SQLException;

import dbmanager.UsrCstmzMngr;
import beans.User;
import beans.UsrCstmiz;

public class UsrCustmizService {

	public UsrCustmizService() {
		super();
		try {
			UsrCstmzMngr.readCustmiz();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public UsrCstmiz getCustmByUser(User usr){
		
		for (UsrCstmiz usrCstmiz : UsrCstmzMngr.customize) {
			if(usrCstmiz.getUserID()==usr.getUserID()){
				return usrCstmiz;
			}
		}
		return UsrCstmzMngr.customize.get(0);
	}
	
}
