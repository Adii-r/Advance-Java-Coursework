package com.cinosphere.service;

import com.cinosphere.dao.CustomerDAO;

public class DeleteAccountService {

	CustomerDAO customerdao = new CustomerDAO();
	public void DeleteAccount(String username) throws Exception {
		customerdao.deleteCustomer(username);
	}
}
