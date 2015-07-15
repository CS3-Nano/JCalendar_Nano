package service;

import java.sql.SQLException;
import java.util.ArrayList;

import beans.Freinds;
import beans.PendingReq;
import beans.User;
import dbmanager.FreindsMngr;
import dbmanager.PndngReqMngr;
import dbmanager.UserMngr;

public class FreindService {
	
	public FreindService() {
		super();
		try {
			FreindsMngr.readFreinds();
			UserMngr.readUsers();
			PndngReqMngr.readRequest();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<User> getAllUsrs(){
		return UserMngr.users;
	}
	public ArrayList<User> getNonFrnds(User usr){
		ArrayList<User> nonfrnds=new ArrayList<User>();
		
		for (User user : UserMngr.users) {
			if(user.getUserID()==usr.getUserID()){
//				System.out.println(user.getUserFName()+"------------------- current user");
				continue;
			}else if(isTheyFreinds(usr, user)){
//				System.out.println(user.getUserFName()+"------------------- friend");
				continue;
			}
			else if(isTheyFreinds(user, usr)){
//				System.out.println(user.getUserFName()+"------------------- friend");
				continue;
			}else if(isItPndngRq(user, usr)){
				continue;
			}else if (isItPndngRq(usr, user)) {
				continue;
			}
//			System.out.println(user.getUserFName());
			nonfrnds.add(user);
		}
		return nonfrnds;
	}
	public boolean isTheyFreinds(User usr1,User usr2){
		
		for (Freinds freinds : FreindsMngr.freindList) {
			if(freinds.getUserID()==usr1.getUserID()){
				if(freinds.getFriendID()==usr2.getUserID()){
					return true;
				}			
			}
		}
		return false;
	}
	public boolean isItPndngRq(User usr1,User usr2){
		for (PendingReq pndgReq : PndngReqMngr.requests) {
			if(pndgReq.getUserID()==usr1.getUserID()){
				if(pndgReq.getFriendID()==usr2.getUserID()){
					return true;
				}
			}
		}
		return false;
	}
	public ArrayList<PendingReq> getMyFrndrqst(User usr){
		ArrayList<PendingReq> myreq=new ArrayList<PendingReq>();
		for (PendingReq pndgReq : PndngReqMngr.requests) {
			if(pndgReq.getFriendID()==usr.getUserID()){
				myreq.add(pndgReq);
			}
		}
		return myreq;
	}
	public PendingReq getRqById(int id){
		for (PendingReq pndRq : PndngReqMngr.requests) {
			if(pndRq.getPendngID()==id){
				return pndRq;
			}
		}
		return null;
	}
}
