package com.cinosphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.cinosphere.utils.DBconfig;
/**
 * Class with methods for SQL operation in Membership table
 */
public class MembershipDAO {
	/**
	 * Insert new membership details for a customer
	 * @param customerid
	 * @param membershipType
	 * @param membershipStatus
	 * @param totalLoyaltyPoints
	 * @param discountPercent
	 * @return boolean, True if membership saved, False if not
	 * @throws SQLException
	 */
	public boolean insert(int customerid,String membershipType, String membershipStatus, int totalLoyaltyPoints, double discountPercent) throws SQLException {
        String sql = "INSERT INTO membership (customer_id, membership_type, membership_status, "
                   + "total_loyalty_points, discount_percentage) VALUES (?, ?, ?, ?, ?)";
        Connection con = DBconfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt        (1, customerid);
            ps.setString     (2, membershipType);
            ps.setString     (3, membershipStatus);
            ps.setInt        (4, totalLoyaltyPoints);
            ps.setDouble (5, discountPercent);
            return ps.executeUpdate() > 0;
        }
    }
