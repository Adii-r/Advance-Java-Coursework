package com.cinosphere.service;

import java.util.List;

import com.cinosphere.dao.UsersDAO;
import com.cinosphere.model.UsersModel;


public class UserService {
	UsersDAO usersDAO = new UsersDAO();
	public List<UsersModel> getAllUsers() throws Exception {
        return usersDAO.getAllUser();
    }
	public boolean deactivateUser(int userId) throws Exception {
        return usersDAO.deleteUser(userId);
    }
	public boolean activateUser(int userId) throws Exception {
        return usersDAO.ActivateUser(userId);
    }
	public List<UsersModel> getUsersByStatus(boolean isActive) throws Exception {
		
		return usersDAO.getUserByStatus(isActive);
	}
	public List<UsersModel> findByUsernames(String searchUser) throws Exception {
		return usersDAO.findByUsernames(searchUser);
	}
 
}
