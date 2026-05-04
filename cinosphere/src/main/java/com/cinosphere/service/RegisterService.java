package com.cinosphere.service;

import java.time.LocalDate;
import java.util.List;

import com.cinosphere.dao.UsersDAO;
import com.cinosphere.dao.MembershipDAO;
import com.cinosphere.model.UsersModel;
import com.cinosphere.utils.PasswordUtil;

/**
 *  service class to handle registration operation
 */
public class RegisterService {
	UsersDAO  customerdao = new UsersDAO();
	MembershipDAO membership = new MembershipDAO();
	/**
	 * register customer using customerDAO method
	 * @param firstName
	 * @param lastName
	 * @param username
	 * @param email
	 * @param dateOfBirth
	 * @param gender
	 * @param password
	 * @throws Exception
	 */
	public void addCustomer(String firstName, String lastName, String username, String email, LocalDate dateOfBirth, String gender,String password) throws Exception {
		password = PasswordUtil.getHashPassword(password);
		boolean status = customerdao.insert(firstName, lastName, username, email, dateOfBirth, gender, password,"CUSTOMER");
		if(!status) {
			throw new Exception("Failed to insert customer");
		}
		UsersModel customer = customerdao.findByUsername(username);
		int customerid = customer.getUserId();
		status = membership.insert(customerid,"STARTER" ,"Active", 0, 0);
		if(!status) {
			throw new Exception("Failed to create membership");
		}
	}	
	/**
	 * Checks if email already exists
	 * @param email
	 * @return
	 * @throws Exception
	 */
	public boolean EmailCheck(String email) throws Exception {
			if(customerdao.findByEmail(email)!=null) {
				return true;
			}
		return false;
	}
	/**
	 * Checks if username already exists
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public boolean UsernameCheck(String username) throws Exception {
			if(customerdao.findByUsername(username)!=null) {
				return true;
			}
		return false;
	}
	}
