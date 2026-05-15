package com.cinosphere.service;
import java.util.ArrayList;
import java.util.List;

import com.cinosphere.dao.BookingDAO;
import com.cinosphere.model.BookingModel;
import com.cinosphere.model.MembershipModel;
import com.cinosphere.model.UsersModel;
import com.cinosphere.utils.SessionUtil;

import jakarta.servlet.http.HttpServletRequest;

public class BookingService {
	BookingDAO bookingDAO = new BookingDAO();
	
	public List<BookingModel> getBookingsByUserId(int userId) throws Exception {
		return bookingDAO.findByUserId(userId);

	}
	public List<BookingModel> getBookingsByUserIdAndBookingStatus(int userId, String status) throws Exception {
			return bookingDAO.findByUserId(userId, status);

	}
	
	public List<Integer> getTotalBookings(List<UsersModel> users) throws Exception {
		
		List<Integer> bookingCount = new ArrayList<>();
		for(UsersModel user: users) {
			
			int totalBooking = bookingDAO.findTotalBookingByUserId(user.getUserId());
			
			bookingCount.add(totalBooking);
		}
		
		return bookingCount;
	}

	public int getTotalBookings(UsersModel user) throws Exception{
		
		return bookingDAO.findTotalBookingByUserId(user.getUserId());
	}
	
	
	
}
