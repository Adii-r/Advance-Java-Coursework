package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import com.cinosphere.model.ScreenModel;
import com.cinosphere.service.ScreenService;
import com.cinosphere.service.ShowtimeService;
import com.cinosphere.service.MovieService;

/**
 * Servlet implementation class AdminAddMovieServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/addmovie" })
public class AddMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ScreenService screenService = new ScreenService();
    MovieService movieService = new MovieService();
    ShowtimeService showtimeService = new ShowtimeService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMovieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = null;
		String movieName = null;
		int duration = 0;
		String director = null;
		String genre=null;
		String movieLanguage=null; 
		String description = null;
		LocalDate releaseDate = null;
		String movieStatus = null;
		String ageRating = null;
		
		try {
			movieName =	request.getParameter("movieTitle");
			genre =	 request.getParameter("movieGenre");
			movieLanguage =	request.getParameter("movieLanguage");
			ageRating =	request.getParameter("movieCertificate");
			movieStatus =request.getParameter("movieStatus");
			director =	request.getParameter("movieDirector");
			description = request.getParameter("movieDescription");
			String releaseDateStr =request.getParameter("movieReleaseDate");
			String durationStr =request.getParameter("movieDuration");
			
			if(movieName == null || movieName.isBlank()) {
				request.setAttribute("error","Movie title required");
				request.getRequestDispatcher("/WEB-INF/pages/updateMovie.jsp").forward(request, response);
				return;
			}
			if(durationStr.matches("[a-zA-Z]+")) {
				request.setAttribute("error","Duration in Mins number");
				request.getRequestDispatcher("/WEB-INF/pages/updateMovie.jsp").forward(request, response);
				return;
			}
			String[] halls = request.getParameterValues( "scheduleHall[]");

			String[] dates =request.getParameterValues("scheduleDate[]");

			String[] times = request.getParameterValues("scheduleTime[]");
			if(halls == null || halls.length == 0 || dates == null || dates.length ==0 || times == null || times.length == 0) {
				request.setAttribute("error","At least one schedule required");
				request.getRequestDispatcher("/WEB-INF/pages/updateMovie.jsp").forward(request, response);
				return;
			}
			duration = Integer.parseInt(durationStr);
			
			int movieId = movieService.insertAndGetId(movieName, duration, director, genre, movieLanguage, description, releaseDate, movieStatus, ageRating);
			if(movieId==-1) throw new Exception("Movie insert failed.");
			
			for(int i = 0; i < halls.length; i++) {
				//showtimeService.insertShowtime( movieId,Integer.parseInt(halls[i]),LocalDate.parse(dates[i]),LocalTime.parse(times[i]),Endtime=times[i]+duration,showStatus, SHowtype);
			}
		} catch (Exception e) {
			status = "Failed to add movie";
			e.printStackTrace();
		}
		request.setAttribute("error", status);
	}

}
