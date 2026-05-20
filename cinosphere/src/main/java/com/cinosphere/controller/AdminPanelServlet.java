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

import com.cinosphere.dao.MembershipDAO;
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
import com.cinosphere.service.UserService;
import com.cinosphere.utils.SessionUtil;

/**
 * @author Raunit Giri
 * @
 * Servlet implementation class AdminPanelServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin" })
public class AdminPanelServlet extends HttpServlet {
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
    UserService usersService = new UserService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPanelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try {
			 double revenueToday = bookingService.getTodayRevenue();
			 int ticketsSoldToday = bookingService.getTodayBooking();
			 int newMembersToday = usersService.getTodayNewUsers();
			 int totalBooking = bookingService.getTotalBookings();
			 double revenueYesterday = bookingService.getYesterdayRevenue();
			 int ticketsSoldYesterday = bookingService.getYesterdayBooking();
			 int newMembersYesterday = usersService.getYesterdayNewUsers();
			 
			 setBookingManagement(request);
			 
			 request.setAttribute("revenueToday", revenueToday);
			 request.setAttribute("ticketsSoldToday", ticketsSoldToday);
			 request.setAttribute("newMembersToday", newMembersToday);
			 request.setAttribute("totalBooking", totalBooking);
			 request.setAttribute("revenueChange",calculateChange(revenueToday, revenueYesterday));
			request.setAttribute("ticketsChange",ticketsSoldToday-ticketsSoldYesterday);
			request.setAttribute("usersChange",newMembersToday-newMembersYesterday);
			 List<UsersModel> users = usersService.getAllUsers();
			 List<MembershipModel> memberships = membershipService.getMemberships(users);
			 List<Integer> bookings = bookingService.getTotalBookings(users);
			 List<MovieModel> movies = movieService.getAllMovies();
			 request.setAttribute("today",LocalDate.now().format(formatter));
            request.setAttribute("filteredMovies", movies);
			request.setAttribute("userList", users);
			request.setAttribute("membershipList", memberships);
			request.setAttribute("bookingList", bookings);
		} catch (Exception e) {
			request.setAttribute("error", "Failed to load admin dashboard.");
			
			e.printStackTrace();
		}
		 request.getRequestDispatcher("/WEB-INF/pages/adminPanel.jsp").forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			double revenueToday = bookingService.getTodayRevenue();
			int ticketsSoldToday = bookingService.getTodayBooking();
			int newMembersToday = usersService.getTodayNewUsers();
			int totalBooking = bookingService.getTotalBookings();
			 double revenueYesterday = bookingService.getYesterdayRevenue();
			 int ticketsSoldYesterday = bookingService.getYesterdayBooking();
			 int newMembersYesterday = usersService.getYesterdayNewUsers();
			request.setAttribute("revenueToday", revenueToday);
			request.setAttribute("ticketsSoldToday", ticketsSoldToday);
			request.setAttribute("newMembersToday", newMembersToday);
			request.setAttribute("totalBooking", totalBooking);
			 request.setAttribute("revenueChange",calculateChange(revenueToday, revenueYesterday));
			request.setAttribute("ticketsChange",ticketsSoldToday-ticketsSoldYesterday);
			request.setAttribute("usersChange",newMembersToday-newMembersYesterday);
            String movieStatus = request.getParameter("movieStatus");
            String userType = request.getParameter("userType");
            String searchMovie = request.getParameter("searchMovie");
            String searchUser = request.getParameter("searchUser");

            // Movie filtering
            List<MovieModel> movies;

            if (movieStatus == null || movieStatus.equals("all")) {
                movies = movieService.getAllMovies();
            }
            else {
                movies = movieService.getMoviesByStatus(movieStatus);
            }
            if (searchMovie != null && !searchMovie.trim().isEmpty()) {
                movies = movieService.findByMovieName(searchMovie);
            }
            List<UsersModel> users;

            if (userType == null || userType.equals("all")) {

                users = usersService.getAllUsers();

            }
            else if (userType.equals("active")) {

                users = usersService.getUsersByStatus(true);

            }
            else {

                users = usersService.getUsersByStatus(false);

            }
            if (searchUser != null && !searchUser.trim().isEmpty()) {

                users = usersService.findByUsernames(searchUser);

            }
            setBookingManagement(request);
            List<MembershipModel> memberships = membershipService.getMemberships(users);
            List<Integer> Totalbookings = bookingService.getTotalBookings(users); 
            request.setAttribute("totalBooking",        totalBooking);
            request.setAttribute("today", LocalDate.now().format(formatter));
            request.setAttribute("userList", users);
            request.setAttribute("membershipList", memberships);
            request.setAttribute("bookingList", Totalbookings);
            request.setAttribute("userType", userType);  
            request.setAttribute("filteredMovies", movies);
            request.setAttribute("movieStatus", movieStatus);
            request.setAttribute("searchUser", searchUser);
            request.setAttribute("searchMovie", searchMovie);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Failed to process request.");
        }
        request.getRequestDispatcher("/WEB-INF/pages/adminPanel.jsp").forward(request, response);
    }
	
	
	private String calculateChange(double today, double yesterday) {
	    if (yesterday == 0) {
	        return today > 0 ? "100%" : "0%";
	    }

	    double change = ((today - yesterday) / yesterday) * 100;
	    return String.format("%.0f%%", change);
	}
	private void setBookingManagement(HttpServletRequest request) throws Exception {
		
        List<BookingModel> bookings = bookingService.getAllBookings();
		List<Integer> bookingIds      = new ArrayList<>();
        List<String>  movieNames    = new ArrayList<>();
        List<String>  showDates     = new ArrayList<>();
        List<String>  startTimes    = new ArrayList<>();
        List<String>  screenNames   = new ArrayList<>();
        List<String>  seatLabels    = new ArrayList<>(); 
        List<Double>  totalAmounts   = new ArrayList<>();
        List<Integer>  totalPointsEarned = new ArrayList<>(); 
        List<String>  bookingStatuses = new ArrayList<>();
        List<String>  usernames = new ArrayList<>();
        for (BookingModel booking : bookings) {
        	
            List<TicketModel> tickets = ticketService.getTicketByBooking(booking.getBookingId());
            TicketModel firstTicket = tickets.get(0);
            ShowtimeModel showtime  = showtimeService.getShowtimeById(firstTicket.getShowtimeId());
            MovieModel    movie     = movieService.getMovieById(showtime.getMovieId());
            ScreenModel   screen    = screenService.getScreenById(showtime.getScreenId());
            UsersModel  user   = usersService.getUserById(booking.getUserId());
            
            List<String> seats = new ArrayList<>();
            for (TicketModel t : tickets) {
                SeatModel seat = seatService.getSeatById(t.getSeatId());
                seats.add(seat.getRowNumber() + seat.getSeatNumber());
            }
            
            bookingIds.add(booking.getBookingId());
            movieNames.add(movie.getMovieName());
            showDates.add(showtime.getShowDate().format(formatter));
            startTimes.add(showtime.getStartTime().format(timeFormatter));
            screenNames.add(screen.getScreenName());
            seatLabels.add(String.join(", ", seats));
            bookingStatuses.add(booking.getBookingStatus());
            usernames.add(user.getUsername());
            totalAmounts.add(booking.getTotalAmount());
            totalPointsEarned.add(booking.getLoyaltyPointsEarned()); 
            }
		
        
        request.setAttribute("totalPointsEarned",  totalPointsEarned);
        request.setAttribute("bookings",         bookingIds);
        request.setAttribute("movieNames",       movieNames);
        request.setAttribute("showDates",        showDates);
        request.setAttribute("startTimes",       startTimes);
        request.setAttribute("totalAmounts",           totalAmounts);
        request.setAttribute("screenNames",      screenNames);
        request.setAttribute("seatLabels",       seatLabels);
        request.setAttribute("usernames",       usernames);
        request.setAttribute("bookingStatuses",  bookingStatuses);
	}
	}
        
