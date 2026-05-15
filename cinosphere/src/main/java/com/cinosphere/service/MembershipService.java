package com.cinosphere.service;

import java.util.ArrayList;
import java.util.List;

import com.cinosphere.dao.MembershipDAO;
import com.cinosphere.model.MembershipModel;
import com.cinosphere.model.UsersModel;
import com.cinosphere.utils.SessionUtil;

import jakarta.servlet.http.HttpServletRequest;

public class MembershipService {
	MembershipDAO membershipDAO = new MembershipDAO();
	public MembershipModel getMembershipByuserId(int userId) throws Exception {

			return membershipDAO.findByUserId(userId);


}
	
	
	public List<MembershipModel> getMemberships(List<UsersModel> users) throws Exception {
		List<MembershipModel> memberships = new ArrayList<>();
		
		for(UsersModel user: users) {
			
			MembershipModel membership = membershipDAO.findByUserId(user.getUserId());
			
			memberships.add(membership);
		}
		
		return memberships;
		
	}
}
