package com.cinosphere.service;

import com.cinosphere.dao.MembershipDAO;
import com.cinosphere.model.MembershipModel;
import com.cinosphere.utils.SessionUtil;

import jakarta.servlet.http.HttpServletRequest;

public class MembershipService {
	public boolean setMembershipToSession(HttpServletRequest request, int userId) {
		MembershipDAO membershipdao = new MembershipDAO();
		try {
			MembershipModel membership = membershipdao.findByCustomerId(userId);
			SessionUtil.setAttribute(request, "membership", membership, 3600);
			return true;
		} catch (Exception e) {
			request.setAttribute("error", "Failed to load membership Data");
			e.printStackTrace();
			return false;
		}
	}
}
