package com.cinosphere.service;
import com.cinosphere.dao.CustomerDAO;
import com.cinosphere.model.CustomerModel;
import com.cinosphere.utils.PasswordUtil;
import com.cinosphere.utils.SessionUtil;

import jakarta.servlet.http.HttpServletRequest;

/**
 * Service class to handle login operation
 */
public class LoginService {

	CustomerDAO customerdao = new CustomerDAO();
	/**
	 * Check if username exists and password matches.
	 * if match found calls login method with customerData and request
	 * @param username
	 * @param password
	 * @param request
	 * @return
	 */
	public String authenticate(String username,String password,HttpServletRequest request) {
		if (username == null || username.trim().isEmpty()) {
            return "Username is required";
        }
        if (password == null || password.isEmpty()) {
            return "Password is required";
        }
        try {
            CustomerModel customer = customerdao.findByUsername(username);
            if (customer == null) {
                return "User doesn't exists";
            }

            // Verify the password using PAsswordUtil
            if (PasswordUtil.checkPassword(password, customer.getHashPassword())) {
                return login(customer,request);
            } 
            else {
                return "Password is incorrect";
            }

        } catch (Exception e) {
            e.printStackTrace();
            return "Service unavailable";
        }
	}
	/**
	 * Use customer data to create session on current request
	 * @param customerData
	 * @param request
	 * @return
	 */
	public String login(CustomerModel customerData,HttpServletRequest request){
		try {  	
    	SessionUtil.setAttribute(request, "user", customerData, 3600);
    	return "Success";
		}
		catch(Exception e){
			e.printStackTrace();
			return "Service unavailable";
		}

	}
}
