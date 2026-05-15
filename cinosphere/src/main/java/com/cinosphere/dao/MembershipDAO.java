package com.cinosphere.dao;

import java.sql.Connection;
import java.sql.Date;
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
	public boolean insert(int userId,String membershipType, String membershipStatus, int totalLoyaltyPoints, double discountPercent) throws SQLException {
        String sql = "INSERT INTO membership (user_id, membership_type, membership_status, "
                   + "total_loyalty_points, discount_percentage) VALUES (?, ?, ?, ?, ?)";
        Connection con = DBconfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt        (1, userId);
            ps.setString     (2, membershipType);
            ps.setString     (3, membershipStatus);
            ps.setInt        (4, totalLoyaltyPoints);
            ps.setDouble (5, discountPercent);
            return ps.executeUpdate() > 0;
        }
	/**
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public MembershipModel findByUserId(int userId) throws Exception {
        MembershipModel membership = null;
		String sql = "SELECT * FROM membership WHERE user_id = ?";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
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
	 * @param userId
	 * @param membershipType
	 * @return
	 * @throws Exception
	 */
	public boolean updateMembershipType(int userId, String membershipType)throws Exception {
		String sql = "UPDATE membership SET membership_type = ? WHERE user_id = ?";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString (1, membershipType);
		ps.setInt (2,  userId);
		return ps.executeUpdate() > 0;
	}
	/**
	 * 
	 * @param userId
	 * @param loyaltyPoints
	 * @return
	 * @throws Exception
	 */
	public boolean updateMembershipLoyaltyPoints(int userId, int loyaltyPoints) throws Exception {
		String sql = "UPDATE membership SET total_loyalty_points = ? WHERE user_id = ?";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt (1, loyaltyPoints);
		ps.setInt (2,  userId);
		return ps.executeUpdate() > 0;
	}
	/**
	 * 
	 * @param userId
	 * @param discountPercent
	 * @return
	 * @throws Exception
	 */
	public boolean updateMembershipDiscount(int userId, int discountPercent) throws Exception {
		String sql = "UPDATE membership SET discount_percentage = ? WHERE user_id = ?";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt (1, discountPercent);
		ps.setInt (2,  userId);
		return ps.executeUpdate() > 0;
	}
	/**
	 * 
	 * @param userId
	 * @param membershipStatus
	 * @return
	 * @throws Exception
	 */
	public boolean updateMembershipStatus(int userId, String membershipStatus) throws Exception {
		String sql = "UPDATE membership SET membership_status = ? WHERE user_id = ?";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString (1, membershipStatus);
		ps.setInt (2,  userId);
		return ps.executeUpdate() > 0;
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
