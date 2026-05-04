package com.cinosphere.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;


import com.cinosphere.model.ShowtimeModel;
import com.cinosphere.utils.DBconfig;

/**
 *  Class for SQL operation involving SHowtime
 */
public class ShowtimeDAO {
	/**
	 * Method to insert new showtime into the database
	 * @param screenId
	 * @param movieId
	 * @param showDate
	 * @param startTime
	 * @param endTime
	 * @param showStatus
	 * @param showType
	 * @return
	 * @throws Exception
	 */
	public boolean insert(int screenId, int movieId, LocalDate showDate, LocalTime startTime, LocalTime endTime, String showStatus, String showType) throws Exception {
		String sql = "INSERT INTO showtime (screen_id,movie_id,show_date,start_time,end_time,show_status,show_type)"
				+"VALUES (?,?,?,?,?,?,?)";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, screenId);
		ps.setInt(2, movieId);
		ps.setDate(3, Date.valueOf(showDate));
		ps.setTime(4, Time.valueOf(startTime));
		ps.setTime(5, Time.valueOf(endTime));
		ps.setString(6, showStatus);
		ps.setString(7, showType);
		
		return ps.executeUpdate() > 0;		
	}
	/**
	 * 
	 * @param movieId
	 * @return
	 * @throws Exception
	 */
	public List<ShowtimeModel> findByMovieId(int movieId) throws Exception{
		List<ShowtimeModel> shows = new ArrayList<>();
		Connection con = DBconfig.getConnection();
		
		String sql = "SELECT * FROM showtime WHERE movie_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, movieId);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			shows.add(createShowtimeModel(rs));
		}
		rs.close();
		ps.close();
		return shows;
	}
	/**
	 * 
	 * @param screenId
	 * @return
	 * @throws Exception
	 */
	public List<ShowtimeModel> findByScreenId(int screenId) throws Exception{
		List<ShowtimeModel> shows = new ArrayList<>();
		Connection con = DBconfig.getConnection();
		
		String sql = "SELECT * FROM showtime WHERE screen_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, screenId);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			shows.add(createShowtimeModel(rs));
		}
		rs.close();
		ps.close();
		return shows;
	}
	
	/**
	 * 
	 * @param screenId
	 * @return
	 * @throws Exception
	 */
	public ShowtimeModel findById(int showtimeId) throws Exception{
		ShowtimeModel show = null;
		Connection con = DBconfig.getConnection();
		
		String sql = "SELECT * FROM showtime WHERE showtime_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, showtimeId);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			show = createShowtimeModel(rs);
		}
		rs.close();
		ps.close();
		return show;
	}
	
	/**
	 * Helper to create showtime object
	 * @param rs
	 * @return ShowtimeModel object
	 * @throws SQLException
	 */
	public ShowtimeModel createShowtimeModel(ResultSet rs) throws SQLException {
		ShowtimeModel show = new ShowtimeModel();
		show.setShowtimeId(rs.getInt("show_id"));
		show.setScreenId(rs.getInt("screen_id"));
		show.setMovieId(rs.getInt("movie_id"));
		show.setShowDate(rs.getDate("show_date").toLocalDate());
		show.setStartTime(rs.getTime("start_time").toLocalTime());
		show.setEndTime(rs.getTime("end_time").toLocalTime());
		show.setShowStatus(rs.getString("show_status"));
		show.setShowType(rs.getString("show_type"));
		return show;
	}

	
}
