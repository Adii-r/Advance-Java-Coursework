package com.cinosphere.service;

import java.util.List;

import com.cinosphere.dao.TicketDAO;
import com.cinosphere.model.TicketModel;

public class TicketService {
	public List<TicketModel> findTicketByBooking(int booking_id) {
		List<TicketModel> ticket = null;
		TicketDAO ticketdao = new TicketDAO();
		try {
			ticket = ticketdao.findByBookingId(booking_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ticket;
	}
}
