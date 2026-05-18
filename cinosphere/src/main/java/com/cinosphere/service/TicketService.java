package com.cinosphere.service;

import java.time.LocalDate;
import java.util.List;

import com.cinosphere.dao.TicketDAO;
import com.cinosphere.model.TicketModel;

public class TicketService {
	TicketDAO ticketDAO = new TicketDAO();
	/**
	 * 
	 * @param booking_id
	 * @return
	 * @throws Exception
	 */
	public List<TicketModel> getTicketByBooking(int booking_id) throws Exception {
		return ticketDAO.findByBookingId(booking_id);
	}
	/**
	 * 
	 * @param ticketId
	 * @return
	 * @throws Exception
	 */
	public TicketModel getTicketById(int ticketId) throws Exception {
		return ticketDAO.findByTicketId(ticketId);
	}
	/**
	 * 
	 * @param ticketId
	 * @param ticketStatus
	 * @return
	 * @throws Exception
	 */
	public boolean updateTicketStatus(int ticketId, String ticketStatus) throws Exception {
		return ticketDAO.updateTicketStatus(ticketId, ticketStatus);
	}
	/**
	 * 
	 * @param bookingId
	 * @param showtimeId
	 * @param seatId
	 * @param ticketType
	 * @param ticketPrice
	 * @return
	 * @throws Exception
	 */
	public boolean createTicket(int bookingId, int showtimeId, int seatId, String ticketType, double ticketPrice) throws Exception {
		String issueDate = LocalDate.now().toString();
		return ticketDAO.insert(bookingId, showtimeId, seatId, ticketType, "ACTIVE", issueDate, ticketPrice);
	}
	
}
