package com.cinosphere.service;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
		for(UsersModel userId: users) {
			
			int totalBooking = getTotalBookings(userId.getUserId());
			
			bookingCount.add(totalBooking);
		}
		
		return bookingCount;
	}

	public int getTotalBookings(int userId) throws Exception{
		
		return bookingDAO.findTotalBookingByUserId(userId);
	}
	public int getTotalUpcomingBookings(int userId) throws Exception{
		
		return bookingDAO.findTotalUpcomingByUserId(userId);
	}
	
	public int getLatestLoyaltyPointsEarned(int userId) throws Exception {
		BookingModel booking = bookingDAO.findLatestConfirmedByUserId(userId);
		return booking.getLoyaltyPointsEarned();
	}
	
	
	public LocalDate getLatestComingBookingDate(int userId) throws Exception{
				
		BookingModel booking = bookingDAO.findLatestComingByUserId(userId);
		return booking.getBookingDate();
	}
	public int getTotalBookings() throws Exception{
		return bookingDAO.getTotalBookings();
	}
	public List<BookingModel> getUpcomingBookings(int userId) throws Exception{
		
		return bookingDAO.findUpcomingByUserId(userId);
	}
	public int getTotalBookingsThisMonth(int userId) throws Exception {
		return bookingDAO.getCurrentMonthBookings(userId);
		
	}
	public double getTodayRevenue() throws Exception {
	    return bookingDAO.getRevenue(LocalDate.now());
	}

	public int getTodayBooking() throws Exception {
	    return bookingDAO.getBookings(LocalDate.now());
	}
	public double getYesterdayRevenue() throws Exception {
	    return bookingDAO.getRevenue(LocalDate.now().minusDays(1));
	}

	public int getYesterdayBooking() throws Exception {
	    return bookingDAO.getBookings(LocalDate.now().minusDays(1));
	}
	public Set<Integer> getConfirmedSeatIdsByShowtime(int showtimeId) throws Exception {
		return bookingDAO.getConfirmedSeatIdsByShowtime(showtimeId);
	}
	public Set<Integer> getBookedSeatIdsByShowtime(int showtimeId) throws Exception {
		// TODO Auto-generated method stub
		return bookingDAO.getReservedSeatIdsByShowtime(showtimeId);
	}
	public int insertAndGetId(int userId, LocalDate today, LocalTime now, String string, double totalAmount,
			String string2, int pointsEarned) throws Exception {
		return bookingDAO.insertAndGetId(userId, today, now, string, totalAmount, string2, pointsEarned);
	}
}
