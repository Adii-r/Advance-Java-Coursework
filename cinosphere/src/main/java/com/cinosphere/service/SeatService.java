package com.cinosphere.service;

import com.cinosphere.dao.SeatDAO;
import com.cinosphere.model.SeatModel;

public class SeatService {
	public SeatModel findSeatByTicket(int seat_id) {
		SeatModel seat = null;
		SeatDAO seatdao = new SeatDAO();
		try {
			seat = seatdao.findById(seat_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return seat;
	}
}
