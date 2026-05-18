package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import com.cinosphere.dao.MembershipDAO;
import com.cinosphere.model.MembershipModel;
import com.cinosphere.model.MovieModel;
import com.cinosphere.model.UsersModel;
import com.cinosphere.service.BookingService;
import com.cinosphere.service.MembershipService;
import com.cinosphere.service.MovieService;
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
	UserService usersService = new UserService();
	MembershipService membershipService = new MembershipService();
	MovieService movieService = new MovieService();
	BookingService bookingService = new BookingService();
       
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
			 List<UsersModel> users = usersService.getAllUsers();
			 List<MembershipModel> memberships = membershipService.getMemberships(users);
			 List<Integer> bookings = bookingService.getTotalBookings(users);
			 int totalBooking = bookingService.getTotalBookings();
			 List<MovieModel> movies = movieService.getAllMovies();
			 request.setAttribute("today",LocalDate.now().format(formatter));
			request.setAttribute("totalBooking", totalBooking);
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

            // Search movie
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

            List<MembershipModel> memberships = membershipService.getMemberships(users);

            List<Integer> bookings = bookingService.getTotalBookings(users);
            
            request.setAttribute("userList", users);
            request.setAttribute("membershipList", memberships);
            request.setAttribute("bookingList", bookings);
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
		
	}
        
