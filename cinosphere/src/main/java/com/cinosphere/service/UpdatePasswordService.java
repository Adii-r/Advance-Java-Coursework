package com.cinosphere.service;

import com.cinosphere.dao.UsersDAO;
import com.cinosphere.model.UsersModel;
import com.cinosphere.utils.PasswordUtil;
import com.cinosphere.utils.SessionUtil;

import jakarta.servlet.http.HttpServletRequest;

public class UpdatePasswordService {
	UsersDAO userdao = new UsersDAO();
	
	public String authenticate(HttpServletRequest request,UsersModel user,String currentPassword, String NewPassword, String NewPasswordAgain) {
		System.out.print("authenticateRan");
		if (currentPassword == null || currentPassword.trim().isEmpty()) {
            return "Current is required";
        }
        if (NewPassword == null || NewPassword.isEmpty()) {
            return "New Password is required";
        }
        if(!NewPassword.equals(NewPasswordAgain)) {
        	return "New Passwords dont match";
        }
        try {
        if(PasswordUtil.checkPassword(currentPassword,user.getHashPassword())) {
        	return updatePassword(request,user,PasswordUtil.getHashPassword(NewPassword));
        	
        }else {
        	return "Current password is incorrect";
        }
      } catch (Exception e) {
          e.printStackTrace();
          return "Service unavailable";
      }
	}
	
	
	
	public String updatePassword(HttpServletRequest request,UsersModel  user, String Password) {
		try {
			userdao.UpdateUserPassword(user.getUserId(), Password);
			user.setHashPassword(Password);
			SessionUtil.setAttribute(request, "user", user, 3600);
			return "Success";
		} catch (Exception e) {
			
			e.printStackTrace();
			return "service unavaiable";
		}
	}
}
