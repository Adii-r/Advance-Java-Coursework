package com.cinosphere.dao;

import java.math.BigDecimal;
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

import com.cinosphere.model.BookingModel;
import com.cinosphere.utils.DBconfig;

public class BookingDAO {
/**
 * 
 * @param userId
 * @param bookingDate
 * @param bookingTime
 * @param bookingStatus
 * @param totalAmount
 * @param bookingChannel
 * @param loyaltyPointsEarned
 * @return
 * @throws Exception
 */
	public boolean insert(int userId, String bookingDate, LocalTime bookingTime,String bookingStatus, double totalAmount,String bookingChannel, int loyaltyPointsEarned) throws Exception {
		String sql = "INSERT INTO booking  (user_id, booking_date, booking_time, booking_status,total_amount, booking_channel, loyalty_points_earned) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt       (1, userId);
		ps.setDate      (2, Date.valueOf(bookingDate));
		ps.setTime    (3, Time.valueOf(bookingTime)); 
		ps.setString    (4, bookingStatus);
		ps.setBigDecimal(5, BigDecimal.valueOf(totalAmount));
		ps.setString    (6, bookingChannel);
		ps.setInt       (7, loyaltyPointsEarned);
		return ps.executeUpdate()>0;
}
	/**
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<BookingModel> findByUserId(int userId) throws Exception {
        List<BookingModel> bookings = new ArrayList<>();
		String sql = "SELECT * FROM booking WHERE user_id = ?";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
        	bookings.add(createBookingModel(rs));
        }
        rs.close();
        ps.close();
        con.close();
        return bookings;
    }
	/**
	 * 
	 * @param bookingId
	 * @return
	 * @throws Exception
	 */
	public BookingModel findByBookingId(int bookingId) throws Exception {
       BookingModel booking = null;
		String sql = "SELECT * FROM booking WHERE booking_id = ?";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, bookingId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
        	booking = createBookingModel(rs);
        }
        rs.close();
        ps.close();
        con.close();
        return booking;
    }
	/**
	 * 
	 * @param userId
	 * @param bookingStatus
	 * @return
	 * @throws Exception
	 */
	public List<BookingModel> findByUserId(int userId, String bookingStatus) throws Exception {
        List<BookingModel> bookings = new ArrayList<>();
		String sql = "SELECT * FROM booking WHERE user_id = ? AND booking_status = ?";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ps.setString(2, bookingStatus);
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
        	bookings.add(createBookingModel(rs));
        }
        rs.close();
        ps.close();
        con.close();
        return bookings;
    }
	/**
	 * 
	 * @param userId
	 * @param bookingStatus
	 * @return
	 * @throws Exception
	 */
	public boolean updateBookingStatus(int userId, String bookingStatus)throws Exception {
		String sql = "UPDATE booking SET bookingStatus = ? WHERE user_id = ?";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString (1, bookingStatus);
		ps.setInt (2,  userId);
		return ps.executeUpdate() > 0;
	}
	/**
	 * \
	 * @return
	 * @throws Exception
	 */
	public int getTotalBookings() throws Exception {
		int booking = 0;
		String sql = "SELECT COUNT(*) FROM booking";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
        	booking = rs.getInt(1);
        }
        rs.close();
        ps.close();
        con.close();
        return booking;
	}
	/**
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public int findTotalBookingByUserId(int userId) throws Exception{
		int booking = 0;
		String sql = "SELECT COUNT(*) FROM booking WHERE user_id = ?";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
        	booking = rs.getInt(1);
        }
        rs.close();
        ps.close();
        con.close();
        return booking;
	}
	/**
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public int findTotalUpcomingByUserId(int userId) throws Exception {
		int count = 0;
		String sql = "SELECT COUNT(DISTINCT b.booking_id) FROM booking b JOIN ticket t ON t.booking_id = b.booking_id "
			+ "JOIN showtime s ON s.showtime_id = t.showtime_id WHERE b.user_id = ? AND s.show_date >= CURDATE()";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userId);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			count = rs.getInt(1);
		}
		rs.close();
		ps.close();
		con.close();
		return count;
	}
	/**
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public BookingModel findLatestComingByUserId(int userId) throws Exception {
		BookingModel booking = null;
		String sql = "SELECT DISTINCT b.* FROM booking b JOIN ticket t ON t.booking_id = b.booking_id "
				+ "JOIN showtime s ON s.showtime_id = t.showtime_id WHERE b.user_id = ? AND s.show_date >= CURDATE() "
				+ "ORDER BY s.show_date ASC LIMIT 1";
			Connection con = DBconfig.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				booking= createBookingModel(rs);
			}
			rs.close();
			ps.close();
			con.close();
			return booking;
	}
	/**
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public List<BookingModel> findUpcomingByUserId(int userId) throws Exception {
		List<BookingModel> bookings = new ArrayList<>();
		String sql = "SELECT DISTINCT b.* FROM booking b JOIN ticket t ON t.booking_id = b.booking_id "
			+ "JOIN showtime s ON s.showtime_id = t.showtime_id WHERE b.user_id = ? AND s.show_date >= CURDATE() "
			+ "ORDER BY s.show_date ASC";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, userId);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			bookings.add(createBookingModel(rs));
		}
		rs.close();
		ps.close();
		con.close();
		return bookings;
	}
	/**
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public BookingModel findLatestConfirmedByUserId(int userId) throws Exception {
		BookingModel booking = null;
		String sql = "SELECT * FROM booking WHERE user_id=? AND booking_status = ? ORDER BY booking_date DESC LIMIT 1;";
        Connection con = DBconfig.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, userId);
        ps.setString(2, "confirmed");
        ResultSet rs = ps.executeQuery();
        if(rs.next()) {
        	booking = createBookingModel(rs);
        }
        rs.close();
        ps.close();
        con.close();
        return booking;
	}
	/**
	 * 
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	public int getCurrentMonthBookings(int userId) throws Exception {
	    int total = 0;
	    String sql = "SELECT COUNT(*) FROM booking WHERE MONTH(booking_date) = MONTH(CURDATE()) AND YEAR(booking_date) = YEAR(CURDATE()) AND user_id=?";
	    Connection con = DBconfig.getConnection();
	    PreparedStatement ps = con.prepareStatement(sql);
	    ps.setInt(1, userId);
	    ResultSet rs = ps.executeQuery();
	    if (rs.next()) {
	        total = rs.getInt(1);
	    }
	    rs.close();
	    ps.close();
	    con.close();
	    return total;
	}
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public int getCurrentMonthBookings() throws Exception {
	    int total = 0;
	    String sql = "SELECT COUNT(*) FROM booking WHERE MONTH(booking_date) = MONTH(CURDATE()) AND YEAR(booking_date) = YEAR(CURDATE())";
	    Connection con = DBconfig.getConnection();
	    PreparedStatement ps = con.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	    if (rs.next()) {
	        total = rs.getInt(1);
	    }
	    rs.close();
	    ps.close();
	    con.close();
	    return total;
	}
	/**
	 * 
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	public BookingModel createBookingModel(ResultSet rs) throws SQLException {
		BookingModel booking = new BookingModel();
		booking.setBookingId(rs.getInt("booking_id"));
		booking.setUserId(rs.getInt("user_id"));
		booking.setBookingDate(rs.getDate("booking_date").toLocalDate());
		booking.setBookingTime(rs.getTime("booking_time").toLocalTime());
		booking.setBookingStatus(rs.getString("booking_status"));
		booking.setTotalAmount(rs.getDouble("total_amount"));
		booking.setBookingChannel(rs.getString("booking_channel"));
		booking.setLoyaltyPointsEarned(rs.getInt("Loyalty_points_earned"));
		return booking;
	}
	

}
