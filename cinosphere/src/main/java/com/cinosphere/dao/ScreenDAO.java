package com.cinosphere.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.cinosphere.utils.DBconfig;

public class ScreenDAO {
	public boolean insert(int theatreId,String screenName, String screenType,String screenStatus,int capacity,double basePrice) throws Exception {
        String sql = "INSERT INTO screen (theatre_id, screen_name, screen_type, screen_status, total_capacity, base_price) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt   (1, theatreId);
            ps.setString(2, screenName);
            ps.setString(3, screenType);
            ps.setString(4, screenStatus);
            ps.setInt   (5, capacity);
            ps.setBigDecimal(6,BigDecimal.valueOf(basePrice));
            return ps.executeUpdate() > 0;
    }
}
