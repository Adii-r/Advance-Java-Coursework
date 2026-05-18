package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cinosphere.service.MovieService;

/**
 * Servlet implementation class Booking
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/booking" })
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MovieService movieService = new MovieService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String movieId = request.getParameter("movieId");
		String hallName= request.getParameter("screenName");
		String showtime = request.getParameter("selectedTime");
		String date = request.getParameter("selectedDate");
		if(movieId==null||movieId.isEmpty()) {
			response.sendRedirect("schedules");
			return;
		}
		int id = Integer.parseInt(movieId);
		try {
			request.setAttribute("movie",movieService.getMovieById(id));
			request.setAttribute("selectedTime",showtime);
			request.setAttribute("selectedDate",date);
			request.setAttribute("selectedHall",hallName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/pages/booking.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
