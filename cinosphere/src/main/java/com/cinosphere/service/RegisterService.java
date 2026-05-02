package com.cinosphere.service;

import java.time.LocalDate;

import com.cinosphere.dao.CustomerDAO;
import com.cinosphere.utils.PasswordUtil;

//TODO Add check for registration
public class RegisterService {
	CustomerDAO dao = new CustomerDAO();
	public void addCustomer(String firstName, String lastName, String username, String email,
			String contactNumber, LocalDate dateOfBirth, String gender,String password) {
	password = PasswordUtil.getHashPassword(password);
	try {
	
		boolean status = dao.insert(firstName, lastName, username, email, contactNumber, dateOfBirth, gender, password);
		if(!status) {
			throw new Exception("Failed to insert customer");
		}
	}	
	catch(Exception e) {
		System.out.println("Regestration Failed");
		System.out.println(e.getMessage());
	}
	}
}
