package com.cinosphere.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cinosphere.model.TicketModel;
import com.cinosphere.utils.DBconfig;

public class TicketDAO {
	/**
	 * 
	 * @param bookingId
	 * @param showtimeId
	 * @param seatId
	 * @param ticketType
	 * @param ticketStatus
	 * @param issueDate
	 * @param ticketPrice
	 * @return
	 * @throws Exception
	 */
	 public boolean insert(int bookingId, int showtimeId, int seatId, String ticketType, String ticketStatus,String issueDate, double ticketPrice) throws Exception {
			String sql = "INSERT INTO ticket (booking_id, showtime_id, seat_id, ticket_type, "
			      + "ticket_status, issue_date, ticket_price) VALUES (?, ?, ?, ?, ?, ?, ?)";
			Connection con = DBconfig.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt       (1, bookingId);
			ps.setInt       (2, showtimeId);
			ps.setInt       (3, seatId);
			ps.setString    (4, ticketType);
			ps.setString    (5, ticketStatus);
			ps.setDate      (6, Date.valueOf(issueDate));
			ps.setBigDecimal(7, BigDecimal.valueOf(ticketPrice));
			return ps.executeUpdate() > 0;
	 }
	 /**
	  * 
	  * @param bookingId
	  * @return
	  * @throws Exception
	  */
	 public List<TicketModel> findByBookingId(int bookingId) throws Exception {
	        List<TicketModel> tickets = new ArrayList<>();
		 	String sql = "SELECT * FROM ticket WHERE booking_id = ?";
	        Connection con = DBconfig.getConnection();
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, bookingId);
	        ResultSet rs = ps.executeQuery();
	        while(rs.next()) {
	        	tickets.add(createTicketModel(rs));
	        }
	        rs.close();
	        ps.close();
	        con.close();
	        return tickets;
	    }
	 /**
	  * 
	  * @param rs
	  * @return
	  * @throws SQLException
	  */
	 public TicketModel createTicketModel(ResultSet rs) throws SQLException {
		 TicketModel ticket = new TicketModel();
		 ticket.setBookingId(rs.getInt("booking_id"));
		 ticket.setIssueDate(rs.getDate("issue_date").toLocalDate());
		 ticket.setSeatId(rs.getInt("seat_id"));
		 ticket.setShowtimeId(rs.getInt("showtime_id"));
		 ticket.setTicketId(rs.getInt("ticket_id"));
		 ticket.setTicketPrice(rs.getDouble("ticket_price"));
		 ticket.setTicketStatus(rs.getString("ticket_status"));
		 ticket.setTicketType(rs.getString("ticket_type"));
		 return ticket;
	 }
}
