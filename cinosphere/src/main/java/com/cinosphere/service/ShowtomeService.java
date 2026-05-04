package com.cinosphere.service;

import com.cinosphere.dao.ShowtimeDAO;
import com.cinosphere.model.ShowtimeModel;

public class ShowtomeService {
	public ShowtimeModel findShowtimeById(int showtimeId) {
		ShowtimeModel seat = null;
		ShowtimeDAO seatdao = new ShowtimeDAO();
		try {
			seat = seatdao.findById(showtimeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return seat;
	}
}
