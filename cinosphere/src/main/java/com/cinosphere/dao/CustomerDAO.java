package com.cinosphere.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.cinosphere.model.CustomerModel;
import com.cinosphere.utils.DBconfig;

/**
 *  Class for SQL operation involving Customer
 */
public class CustomerDAO {
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
	public boolean insert(String firstName, String lastName, String username, String email,LocalDate dateOfBirth, String gender,String hashPassword,String customerRole) throws SQLException {
		String sql = "INSERT INTO customer (first_name, last_name, username, email, date_of_birth, gender, hash_password, registration_date, is_active, customer_role) "
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
			ps.setBoolean(9, true);                          
			ps.setString (10, customerRole);

			return ps.executeUpdate() > 0;
}
	/**
	 * Find a customer by their username
	 * @param username
	 * @return customer object
	 * @throws SQLException
	 */
	public CustomerModel findByUsername(String username) throws SQLException {
		CustomerModel customer = null;
        String sql = "SELECT * FROM customer WHERE username = ?";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                	customer = createCustomerModel(rs);
                }
            rs.close();
            ps.close();
            con.close();
            return customer;
        }
	/**
	 * Find a customer by their email
	 * @param email
	 * @return customer object
	 * @throws SQLException
	 */
	public CustomerModel findByEmail(String email) throws SQLException {
		CustomerModel customer = null;
        String sql = "SELECT * FROM customer WHERE email = ?";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
                if(rs.next()) {
                	customer = createCustomerModel(rs);
                }
            rs.close();
            ps.close();
            con.close();
            return customer;
        }

	/**
	 * Create list of all customers
	 * @return list object of customer
	 * @throws Exception
	 */
	public List<CustomerModel> getAllCustomer() throws Exception {
	    List<CustomerModel> customers = new ArrayList<>();
	    Connection con = DBconfig.getConnection();
	    
	    String sql = "SELECT * FROM customer";
	    PreparedStatement ps = con.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	
	    while (rs.next()) {
	        customers.add(createCustomerModel(rs));
	    }
	    
	    rs.close();
	    ps.close();
	    con.close();
	    return customers;
	}
	/**
	 * Soft delete customer record
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public boolean deleteCustomer(String username) throws Exception{
        String sql = "UPDATE customer SET is_active = ? WHERE username = ? ";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setBoolean(1,false);
        ps.setString(2, username);
        
        return ps.executeUpdate() > 0;
	}
	
	
	/**
	 * Helper method to create Customer Object
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	public CustomerModel createCustomerModel(ResultSet rs) throws SQLException {
		CustomerModel customer = new CustomerModel();
		customer.setCustomerId(rs.getInt("customer_id"));
		customer.setFirstName(rs.getString("first_name"));
		customer.setLastName(rs.getString("last_name"));
		customer.setUsername(rs.getString("username"));
		customer.setEmail(rs.getString("email"));
		customer.setDateOfBirth(rs.getDate("date_of_birth").toLocalDate());
		customer.setGender(rs.getString("gender"));
		customer.setHashPassword(rs.getString("hash_password"));
		customer.setRegistrationDate(rs.getDate("registration_date").toLocalDate());
		customer.setisActive(rs.getBoolean("is_active"));
		customer.setCustomerRole(rs.getString("customer_role"));
		return customer;
	}
}
