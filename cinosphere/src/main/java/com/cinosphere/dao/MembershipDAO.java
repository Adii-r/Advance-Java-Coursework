package com.cinosphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cinosphere.model.MembershipModel;
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
	public boolean insert(int userid,String membershipType, String membershipStatus, int totalLoyaltyPoints, double discountPercent) throws SQLException {
        String sql = "INSERT INTO membership (user_id, membership_type, membership_status, "
                   + "total_loyalty_points, discount_percentage) VALUES (?, ?, ?, ?, ?)";
        Connection con = DBconfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt        (1, userid);
            ps.setString     (2, membershipType);
            ps.setString     (3, membershipStatus);
            ps.setInt        (4, totalLoyaltyPoints);
            ps.setDouble (5, discountPercent);
            return ps.executeUpdate() > 0;
        }
	/**
	 * 
	 * @param customerId
	 * @return
	 * @throws Exception
	 */
	public MembershipModel findByCustomerId(int customerId) throws Exception {
        MembershipModel membership = null;
		String sql = "SELECT * FROM membership WHERE user_id = ?";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, customerId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
        	membership = createMembershipModel(rs);
        }
        rs.close();
        ps.close();
        con.close();
        return membership;
    }
	/**
	 * 
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	
	public MembershipModel createMembershipModel(ResultSet rs) throws SQLException {
		MembershipModel membership = new MembershipModel();
		membership.setMembershipId(rs.getInt("membership_id"));
		membership.setUserId(rs.getInt("user_id"));
		membership.setMembershipType(rs.getString("membership_type"));
		membership.setMembershipStatus(rs.getString("membership_status"));
		membership.setTotalLoyaltyPoints(rs.getInt("total_loyalty_points"));
		membership.setDiscountPercentage(rs.getDouble("discount_percentage"));
		return membership;
	}
    }
