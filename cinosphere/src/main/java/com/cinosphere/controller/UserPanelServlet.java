package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.cinosphere.model.BookingModel;
import com.cinosphere.model.MembershipModel;
import com.cinosphere.model.UsersModel;
import com.cinosphere.service.BookingService;
import com.cinosphere.service.MembershipService;
import com.cinosphere.utils.SessionUtil;

/**
 * Servlet implementation class UserPanelServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/profile" })
public class UserPanelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BookingService bookingService = new BookingService();
	MembershipService membershipService = new MembershipService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPanelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		UsersModel user = (UsersModel) SessionUtil.getAttribute(request, "user");
		
		int totalBooking = bookingService.getTotalBookings(user);
		int userId= user.getUserId();
		request.setAttribute("totalBooking", totalBooking);
		MembershipModel membership = membershipService.getMembershipByuserId(userId);
		List<BookingModel> bookings = bookingService.getBookingsByUserId(userId);
		 request.setAttribute("membership", membership);
         request.setAttribute("bookings",bookings);
         request.setAttribute("totalBooking", totalBooking);
		} catch (Exception e) {
			request.setAttribute("error", "Failed to load profile details.");
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/pages/userPanel.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
