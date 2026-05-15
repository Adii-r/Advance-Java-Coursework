package com.cinosphere.service;

import java.util.ArrayList;
import java.util.List;

import com.cinosphere.dao.MembershipDAO;
import com.cinosphere.model.MembershipModel;
import com.cinosphere.model.UsersModel;
import com.cinosphere.utils.SessionUtil;

import jakarta.servlet.http.HttpServletRequest;

public class MembershipService {
	public boolean setMembershipToSession(HttpServletRequest request, int userId) {
		MembershipDAO membershipdao = new MembershipDAO();
		try {
			MembershipModel membership = membershipdao.findByUserId(userId);
			SessionUtil.setAttribute(request, "membership", membership, 3600);
			return true;
		} catch (Exception e) {
			request.setAttribute("error", "Failed to load membership Data");
			e.printStackTrace();
			return false;
		}
	}
	
	
	public List<MembershipModel> getMemberships(List<UsersModel> users) throws Exception {
		MembershipDAO membershipDAO = new MembershipDAO();
		List<MembershipModel> memberships = new ArrayList<>();
		
		for(UsersModel user: users) {
			
			MembershipModel membership = membershipDAO.findByUserId(user.getUserId());
			
			memberships.add(membership);
		}
		
		return memberships;
		
	}
}
