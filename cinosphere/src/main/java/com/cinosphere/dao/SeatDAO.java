package com.cinosphere.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.cinosphere.model.SeatModel;
import com.cinosphere.utils.DBconfig;

public class SeatDAO {
	
	public boolean insert(int screenId, String seatNumber, String rowNumber,String seatType, String seatStatus) throws Exception {
			String sql = "INSERT INTO seat (screen_id, seat_number, row_number, seat_type, seat_status) "
			     + "VALUES (?, ?, ?, ?, ?)";
			Connection con = DBconfig.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt   (1, screenId);
			ps.setString(2, seatNumber);
			ps.setString(3, rowNumber);
			ps.setString(4, seatType);
			ps.setString(5, seatStatus);
			return ps.executeUpdate() > 0;
		}
	
	/**
	 * 
	 * @param ticket_id
	 * @return
	 */
	public SeatModel findById(int seat_id) {
		
		return null;
	}

}
