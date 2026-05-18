package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.cinosphere.model.BookingModel;
import com.cinosphere.model.MembershipModel;
import com.cinosphere.model.MovieModel;
import com.cinosphere.model.ScreenModel;
import com.cinosphere.model.SeatModel;
import com.cinosphere.model.ShowtimeModel;
import com.cinosphere.model.TheatreModel;
import com.cinosphere.model.TicketModel;
import com.cinosphere.model.UsersModel;
import com.cinosphere.service.BookingService;
import com.cinosphere.service.MembershipService;
import com.cinosphere.service.MovieService;
import com.cinosphere.service.ScreenService;
import com.cinosphere.service.SeatService;
import com.cinosphere.service.ShowtimeService;
import com.cinosphere.service.TheatreService;
import com.cinosphere.service.TicketService;
import com.cinosphere.utils.SessionUtil;

/**
 * Servlet implementation class UserPanelServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/profile" })
public class UserPanelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern(" d MMM, EEEE");
	DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("h:mm a");
	BookingService bookingService = new BookingService();
	MembershipService membershipService = new MembershipService();
	TicketService ticketService = new TicketService();
	SeatService seatService = new SeatService();
	MovieService movieService = new MovieService();
	ShowtimeService showtimeService = new ShowtimeService();
	ScreenService screenService = new ScreenService();
	TheatreService theatreService = new TheatreService();
	
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
		int userId= user.getUserId();
		int totalBooking = bookingService.getTotalBookings(userId);
		int upcomingBooking = bookingService.getTotalUpcomingBookings(userId);
		LocalDate nearestUpcomming = bookingService.getLatestComingBookingDate(userId);
		int loyaltyPointsEarned = bookingService.getLatestLoyaltyPointsEarned(userId);
		MembershipModel membership = membershipService.getMembershipByuserId(userId);
		int monthTotal = bookingService.getTotalBookingsThisMonth(userId);
		
		List<BookingModel> bookings = bookingService.getUpcomingBookings(userId);
		List<Integer> movieIds      = new ArrayList<>();
        List<String>  movieNames    = new ArrayList<>();
        List<String>  showDates     = new ArrayList<>();
        List<String>  startTimes    = new ArrayList<>();
        List<String>  cities        = new ArrayList<>();
        List<String>  screenNames   = new ArrayList<>();
        List<String>  seatLabels    = new ArrayList<>();  
        List<Integer> seatCounts    = new ArrayList<>();
        List<String>  bookingStatuses = new ArrayList<>();
        
        for (BookingModel booking : bookings) {
            
            List<TicketModel> tickets = ticketService.getTicketByBooking(booking.getBookingId());
            TicketModel firstTicket = tickets.get(0);
            ShowtimeModel showtime  = showtimeService.getShowtimeById(firstTicket.getShowtimeId());
            MovieModel    movie     = movieService.getMovieById(showtime.getMovieId());
            ScreenModel   screen    = screenService.getScreenById(showtime.getScreenId());
            TheatreModel  theatre   = theatreService.getTheatreById(screen.getTheatreId());
            
            List<String> seats = new ArrayList<>();
            for (TicketModel t : tickets) {
                SeatModel seat = seatService.getSeatById(t.getSeatId());
                seats.add(seat.getRowNumber() + seat.getSeatNumber());
            }
            
            movieIds.add(movie.getMovieId());
            movieNames.add(movie.getMovieName());
            showDates.add(showtime.getShowDate().format(formatter));
            startTimes.add(showtime.getStartTime().format(timeFormatter));
            cities.add(theatre.getCity());
            screenNames.add(screen.getScreenName());
            seatLabels.add(String.join(", ", seats));
            seatCounts.add(tickets.size());
            bookingStatuses.add(booking.getBookingStatus());
            
            
            }
		
        request.setAttribute("totalBooking",        totalBooking);
        request.setAttribute("upcomingBooking",     upcomingBooking);
        request.setAttribute("loyaltyPointsEarned", loyaltyPointsEarned);
        request.setAttribute("upcommingDate",nearestUpcomming != null ? nearestUpcomming.format(formatter) : "—");
        request.setAttribute("today", LocalDate.now().format(formatter));
        request.setAttribute("membership", membership);
        request.setAttribute("bookingMonthTotal",  monthTotal);
        request.setAttribute("bookings",         movieIds);
        request.setAttribute("movieIds",         movieIds);
        request.setAttribute("movieNames",       movieNames);
        request.setAttribute("showDates",        showDates);
        request.setAttribute("startTimes",       startTimes);
        request.setAttribute("cities",           cities);
        request.setAttribute("screenNames",      screenNames);
        request.setAttribute("seatLabels",       seatLabels);
        request.setAttribute("seatCounts",       seatCounts);
        request.setAttribute("bookingStatuses",  bookingStatuses);
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
