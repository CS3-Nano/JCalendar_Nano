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
	public String getHighPrtyClr(String val){
		int i=Integer.parseInt(val);
		switch (i) {
		case 1:
			return "darkorange";
		case 2:
			return "darksalmon";		
		case 3:
			return "firebrick";
		case 4:
			return "deeppink";
		case 5:
			return "darkgoldenrod";
		default:
			return "darksalmon";
			
		}
	}
	public String getMedPrtyClr(String val){
		int i=Integer.parseInt(val);
		switch (i) {
		case 1:
			return "darkcyan";
		case 2:
			return "dodgerblue";		
		case 3:
			return "deepskyblue";
		case 4:
			return "aqua";
		case 5:
			return "aquamarine";
		default:
			return "aqua";
			
		}
	}
	public String getLowPrtyClr(String val){
		int i=Integer.parseInt(val);
		switch (i) {
		case 1:
			return "darkslategray";
		case 2:
			return "darkgrey";		
		case 3:
			return "antiquewhite";
		case 4:
			return "bisque";
		case 5:
			return "aquamarine";
		default:
			return "burlywood";
			
		}
	}
}
