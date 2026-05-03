package com.cinosphere.service;

import com.cinosphere.dao.UsersDAO;

public class DeleteAccountService {

	UsersDAO customerdao = new UsersDAO();
	public void DeleteAccount(int userId) throws Exception {
		customerdao.deleteUser(userId);
	}
}
