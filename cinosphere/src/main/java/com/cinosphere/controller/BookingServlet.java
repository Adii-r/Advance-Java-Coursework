package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.cinosphere.model.ScreenModel;
import com.cinosphere.model.SeatModel;
import com.cinosphere.model.ShowtimeModel;
import com.cinosphere.model.TheatreModel;
import com.cinosphere.service.MovieService;
import com.cinosphere.service.ScreenService;
import com.cinosphere.service.SeatService;
import com.cinosphere.service.ShowtimeService;
import com.cinosphere.service.TheatreService;

/**
 * Servlet implementation class Booking
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/booking" })
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern(" d MMM, EEEE");
	DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("h:mm a");
	MovieService  movieService  = new MovieService();
	SeatService   seatService   = new SeatService();
	ShowtimeService   showtimeService  = new ShowtimeService();
	ScreenService screenService = new ScreenService();
	TheatreService theatreService = new TheatreService();
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
		String movieIdString   = request.getParameter("movieId");
		String showtimeIdString = request.getParameter("showtimeId");
		String screenIdString  = request.getParameter("screenId");
		if(movieIdString==null||showtimeIdString == null || screenIdString ==null ||movieIdString.isEmpty() || showtimeIdString.isEmpty() || screenIdString.isEmpty() ) {
			response.sendRedirect("schedules");
			return;
		}
		try {
			int movieId = Integer.parseInt(movieIdString);
			int showtimeId = Integer.parseInt(movieIdString);
			int screenId = Integer.parseInt(movieIdString);
			request.setAttribute("movie",movieService.getMovieById(movieId));
			ShowtimeModel showtime = showtimeService.getShowtimeById(showtimeId);
			request.setAttribute("showtime",showtime);
			
			request.setAttribute("time",showtime.getStartTime().format(timeFormatter));
			request.setAttribute("date",showtime.getShowDate().format(formatter));
			ScreenModel screen = screenService.getScreenById(screenId);
			request.setAttribute("screen",screen);
			TheatreModel theatre = theatreService.getTheatreById(screen.getTheatreId());
			request.setAttribute("screen",theatre);
			request.setAttribute("basePrice", screen.getBasePrice());
			List<SeatModel> seats = seatService.getSeatsByScreenId(screenId);
			request.setAttribute("seats", seats);
			String hallName = theatre.getCity() + " — " + screen.getScreenName();
			request.setAttribute("hallName", hallName);
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
