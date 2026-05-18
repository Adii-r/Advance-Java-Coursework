package com.cinosphere.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.cinosphere.model.UsersModel;
import com.cinosphere.utils.DBconfig;

/**
 *  Class for SQL operation involving user
 */
public class UsersDAO {
	/**
	 * Method to insert a new customer into the database
	 * @param firstName First name of the customer
	 * @param lastName Last name of the customer
	 * @param username username of the customer
	 * @param email email of the customer
	 * @param dateOfBirth DOB of the customer
	 * @param gender gender of the customer
	 * @param hashPassword password after Bcrypt
	 * @param customerRole
	 * @return boolean, True if customer saved, False if not
	 * @throws SQLException
	 */
	public boolean insert(String firstName, String lastName, String username, String email,LocalDate dateOfBirth, String gender,String hashPassword,String userRole) throws Exception {
		String sql = "INSERT INTO users (first_name, last_name, username, email, date_of_birth, gender, hash_password, registration_date, is_active, user_role) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);

			ps.setString (1,  firstName);
			ps.setString (2,  lastName);
			ps.setString (3,  username);
			ps.setString (4,  email);
			ps.setDate   (5,  Date.valueOf(dateOfBirth));
			ps.setString (6,  gender);
			ps.setString (7,  hashPassword);
			ps.setDate   (8,  Date.valueOf(LocalDate.now())); 
			ps.setBoolean(9, false);                          
			ps.setString (10, userRole);

			return ps.executeUpdate() > 0;
}
	/**
	 * Find a user by their username
	 * @param username
	 * @return user object
	 * @throws SQLException
	 */
	public UsersModel findByUsername(String username) throws Exception {
		UsersModel user = null;
        String sql = "SELECT * FROM users WHERE username = ?";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                	user = createUserModel(rs);
                }
            rs.close();
            ps.close();
            con.close();
            return user;
        }
	
	
	public List<UsersModel> findByUsernames(String username) throws Exception {
		List<UsersModel> users = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE username LIKE ?";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1,"%"+ username+"%");
        ResultSet rs = ps.executeQuery();
                while(rs.next()) {
                	users.add(createUserModel(rs));
                }
            rs.close();
            ps.close();
            con.close();
            return users;
	}

	
	/**
	 * Find a user by their email
	 * @param email
	 * @return user object
	 * @throws SQLException
	 */
	public UsersModel findByEmail(String email) throws SQLException {
		UsersModel user = null;
        String sql = "SELECT * FROM users WHERE email = ?";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                	user = createUserModel(rs);
                }
            rs.close();
            ps.close();
            con.close();
            return user;
        }

	/**
	 * Create list of all users
	 * @return list object of user
	 * @throws Exception
	 */
	public List<UsersModel> getAllUser() throws Exception {
		
	    List<UsersModel> users = new ArrayList<>();
	    Connection con = DBconfig.getConnection();
	    
	    String sql = "SELECT * FROM users";
	    PreparedStatement ps = con.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	
	    while (rs.next()) {
	        users.add(createUserModel(rs));
	    }
	    
	    rs.close();
	    ps.close();
	    con.close();
	    return users;
	}
	
	public List<UsersModel> getUserByStatus(boolean isActive) throws Exception{
		List<UsersModel> users = new ArrayList<>();
	    Connection con = DBconfig.getConnection();
	    
	    String sql = "SELECT * FROM users WHERE is_active=?";
	    PreparedStatement ps = con.prepareStatement(sql);
	    ps.setBoolean(1, isActive);
	    ResultSet rs = ps.executeQuery();
	
	    while (rs.next()) {
	        users.add(createUserModel(rs));
	    }
	    
	    rs.close();
	    ps.close();
	    con.close();
	    return users;
	}
	/**
	 * Soft delete user record
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public boolean deleteUser(int userId) throws Exception{
        String sql = "UPDATE users SET is_active = ? WHERE user_id = ? ";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setBoolean(1,false);
        ps.setInt(2, userId);
        
        return ps.executeUpdate() > 0;
	}
	/**
	 * Set inactive Accounts to true
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public boolean ActivateUser(int userId) throws Exception{
        String sql = "UPDATE users SET is_active = ? WHERE user_id = ? ";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setBoolean(1,true);
        ps.setInt(2,userId);
        
        return ps.executeUpdate() > 0;
	}
	
	/**
	 * Update user details
	 * @param userId
	 * @param firstName
	 * @param lastName
	 * @param username
	 * @param email
	 * @param hashPassword
	 * @return
	 * @throws Exception
	 */
	public boolean UpdateUser(int userId,String firstName, String lastName, String email,LocalDate dateOfBirth) throws Exception {
		
		String sql = "UPDATE users SET first_name =?, last_name=?, email=?, date_of_birth=? WHERE user_id = ? ";

		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString (1,  firstName);
		ps.setString (2,  lastName);
		ps.setString (3,  email);
		ps.setDate (4,  Date.valueOf(dateOfBirth));
		ps.setInt(5, userId);
		return ps.executeUpdate() > 0;
	}
	/**
	 * Update password
	 * @param userId
	 * @param firstName
	 * @param lastName
	 * @param username
	 * @param email
	 * @param hashPassword
	 * @return
	 * @throws Exception
	 */
	public boolean UpdateUserPassword(int userId,String password) throws Exception {
		
		String sql = "UPDATE users SET hash_password =? WHERE user_id = ? ";

		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString (1,  password);
		ps.setInt(2, userId);
		return ps.executeUpdate() > 0;
	}
	/**
	 * 
	 * @return
	 */
	public int getNewUsers(LocalDate date) throws Exception{
		int total = 0;
	    String query = " SELECT COUNT(*) FROM users WHERE DATE(registration_date) = ?";
	    Connection con = DBconfig.getConnection();
	    PreparedStatement ps = con.prepareStatement(query);
	    ps.setDate(1, Date.valueOf(date));
	    ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	          total = rs.getInt(1);
	        }
	    return total;
	}
	
	/**
	 * Helper method to create user Object
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	public UsersModel createUserModel(ResultSet rs) throws SQLException {
		UsersModel user = new UsersModel();
		user.setUserId(rs.getInt("user_id"));
		user.setFirstName(rs.getString("first_name"));
		user.setLastName(rs.getString("last_name"));
		user.setUsername(rs.getString("username"));
		user.setEmail(rs.getString("email"));
		user.setDateOfBirth(rs.getDate("date_of_birth").toLocalDate());
		user.setGender(rs.getString("gender"));
		user.setHashPassword(rs.getString("hash_password"));
		user.setRegistrationDate(rs.getDate("registration_date").toLocalDate());
		user.setisActive(rs.getBoolean("is_active"));
		user.setUserRole(rs.getString("user_role"));
		return user;
	}

}
