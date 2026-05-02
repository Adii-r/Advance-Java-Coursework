package com.cinosphere.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import com.cinosphere.model.CustomerModel;
import com.cinosphere.utils.DBconfig;

/**
 *  Class for SQL operation involving Customer
 */
public class CustomerDAO {
	public boolean insert(String firstName, String lastName, String username, String email,
							String contactNumber, LocalDate dateOfBirth, String gender,
							String hashPassword) throws SQLException {

		String sql = "INSERT INTO customer (first_name, last_name, username, email, contact_number, "
					+ "date_of_birth, gender, hash_password, registration_date, is_active, customer_role) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);

			ps.setString (1,  firstName);
			ps.setString (2,  lastName);
			ps.setString (3,  username);
			ps.setString (4,  email);
			ps.setString (5,  contactNumber);
			ps.setDate   (6,  Date.valueOf(dateOfBirth));
			ps.setString (7,  gender);
			ps.setString (8,  hashPassword);
			ps.setDate   (9,  Date.valueOf(LocalDate.now())); 
			ps.setBoolean(10, true);                          
			ps.setString (11, "customer");

			return ps.executeUpdate() > 0;
	}
	
	public CustomerModel findByUsername(String username) throws SQLException {
		CustomerModel customer = null;
        String sql = "SELECT * FROM customer WHERE username = ?";
        Connection con = DBconfig.getConnection();
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, username);
        ResultSet rs = pst.executeQuery();
                if(rs.next()) {
                	customer = new CustomerModel();
                	customer.setFirstName(rs.getString("first_name"));
                	customer.setLastName(rs.getString("last_name"));
                	customer.setUsername(rs.getString("username"));
                	customer.setEmail(rs.getString("emalil"));
                	customer.setContactNumber(rs.getString("contact_number"));
                	customer.setDateOfBirth(rs.getDate("date_of_birth").toLocalDate());
                	customer.setGender(rs.getString("gender"));
                	customer.setHashPassword(rs.getString("hash_password"));
                	customer.setRegistrationDate(rs.getDate("registration_date").toLocalDate());
                	customer.setisActive(rs.getBoolean("is_active"));
                	customer.setCustomerRole(rs.getString("customer_role"));
                }
            rs.close();
            pst.close();
            con.close();
            return customer;
        }
    }
