package com.cinosphere.service;
import java.util.List;

import com.cinosphere.dao.BookingDAO;
import com.cinosphere.model.BookingModel;
import com.cinosphere.utils.SessionUtil;

import jakarta.servlet.http.HttpServletRequest;

public class BookingService {
	public boolean setBookingsToSession(HttpServletRequest request, int userId, String status) {
		BookingDAO bookingdao = new BookingDAO();
		 try {
			List<BookingModel> bookings = bookingdao.findByUserIdBookingStatus(userId, status);
			SessionUtil.setAttribute(request, "bookings", bookings, 3600);
			return true;
		} catch (Exception e) {
			request.setAttribute("error", "Failed to load Booking Data");
			e.printStackTrace();
			return false;
		}	 
	}
}
