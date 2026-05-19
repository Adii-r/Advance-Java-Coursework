package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.cinosphere.model.ScreenModel;
import com.cinosphere.model.TheatreModel;
import com.cinosphere.service.MovieService;
import com.cinosphere.service.ScreenService;
import com.cinosphere.service.ShowtimeService;
import com.cinosphere.service.TheatreService;
import com.cinosphere.utils.FileuploadUtil;

/**
 * Servlet implementation class UpdateMovieServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/updatemovie" })
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10,
	    maxRequestSize = 1024 * 1024 * 50
	)
public class UpdateMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR =System.getProperty("user.home")+ File.separator+ "webassets"+ File.separator+"poster";   
	ScreenService screenService = new ScreenService();
	TheatreService theatreService = new TheatreService();
	MovieService movieService = new MovieService();
	ShowtimeService showtimeService = new ShowtimeService();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		loadScreen(request);
		request.setAttribute("rows", 1);
		request.getRequestDispatcher("/WEB-INF/pages/updateMovie.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String operation = request.getParameter("operation");
		String rows = request.getParameter("rows");
		String movieName = request.getParameter("movieTitle");
		String genre = request.getParameter("movieGenre");
		String movieLanguage = request.getParameter("movieLanguage");
		String ageRating = request.getParameter("movieCertificate");
		String movieStatus = request.getParameter("movieStatus");
		String director = request.getParameter("movieDirector");
		String description = request.getParameter("movieDescription");
		String releaseDateStr = request.getParameter("movieReleaseDate");
		String durationStr = request.getParameter("movieDuration");

		String[] halls = request.getParameterValues("scheduleHall[]");
		String[] dates = request.getParameterValues("scheduleDate[]");
		String[] times = request.getParameterValues("scheduleTime[]");


		int row = 1;
		if (rows != null && !rows.isEmpty()) {
			row = Integer.parseInt(rows);
		}
		// ADD
		if ("add".equals(operation)) {

			row++;

			preserveState(request, row, halls, dates, times, movieName, genre, movieLanguage,
					ageRating, movieStatus, director, description, releaseDateStr, durationStr);

			loadScreen(request);
			request.getRequestDispatcher("/WEB-INF/pages/updateMovie.jsp").forward(request, response);
			return;
		}

		// DELETE
		if ("delete".equals(operation) && row > 1) {

			row--;

			if (halls != null && halls.length > 1) {
				halls = Arrays.copyOf(halls, halls.length - 1);
			}
			if (dates != null && dates.length > 1) {
				dates = Arrays.copyOf(dates, dates.length - 1);
			}
			if (times != null && times.length > 1) {
				times = Arrays.copyOf(times, times.length - 1);
			}

			preserveState(request, row, halls, dates, times, movieName, genre, movieLanguage,
					ageRating, movieStatus, director, description, releaseDateStr, durationStr);
			loadScreen(request);
			request.getRequestDispatcher("/WEB-INF/pages/updateMovie.jsp").forward(request, response);
			return;
		}

		// SAVE
		if ("save".equals(operation)) {

			preserveState(request, row, halls, dates, times, movieName, genre, movieLanguage,
					ageRating, movieStatus, director, description, releaseDateStr, durationStr);

			try {
				if (movieName == null || movieName.isBlank()) {
					request.setAttribute("error", "Enter movie name");
					request.getRequestDispatcher("/WEB-INF/pages/updateMovie.jsp").forward(request, response);
					return;
				}

				if (durationStr == null || !durationStr.matches("\\d+")) {
					request.setAttribute("error", "Duration must be a number");
					request.getRequestDispatcher("/WEB-INF/pages/updateMovie.jsp").forward(request, response);
					return;
				}

				int duration = Integer.parseInt(durationStr);
				LocalDate releaseDate = LocalDate.parse(releaseDateStr);


				if (halls == null || dates == null || times == null) {
					request.setAttribute("error", "At least one schedule required");
					request.getRequestDispatcher("/WEB-INF/pages/updateMovie.jsp").forward(request, response);
					return;
				}


				int movieId = movieService.insertAndGetId(movieName, duration, director, genre,
						movieLanguage, description, releaseDate, movieStatus, ageRating);
				Part filePart = request.getPart("profileAvatarInput");
				 if (FileuploadUtil.isImage(filePart)) {
					 
					 String userId = String.valueOf(movieId);
					 File folder = new File(UPLOAD_DIR);
					    File[] oldFiles = folder.listFiles((dir, name) -> name.startsWith(userId + "."));
					    if (oldFiles != null) {
					        for (File old : oldFiles) {
					            old.delete();
					        }
					    }
				 }

				for (int i = 0; i < halls.length; i++) {


					if (halls[i].isBlank() || dates[i].isBlank() || times[i].isBlank()) {
						continue;
					}

					LocalTime start = LocalTime.parse(times[i]);
					LocalTime end = start.plus(Duration.ofMinutes(duration));

					showtimeService.insertShowtime(Integer.parseInt(halls[i]),movieId,LocalDate.parse(dates[i]),start,end,"ACTIVE","STANDARD");}



			} catch (Exception e) {

				e.printStackTrace();
				request.setAttribute("error", "Failed to save movie");
			}
		}

		preserveState(request, row, halls, dates, times, movieName, genre, movieLanguage,
				ageRating, movieStatus, director, description, releaseDateStr, durationStr);

		response.sendRedirect(request.getContextPath() + "/updatemovie");
	}

	private void preserveState(HttpServletRequest request, int rows, String[] halls,
			String[] dates, String[] times, String movieName, String genre,
			String movieLanguage, String ageRating, String movieStatus,
			String director, String description,
			String releaseDateStr, String durationStr) {

		request.setAttribute("rows", rows);
		request.setAttribute("scheduleHall", halls);
		request.setAttribute("scheduleDate", dates);
		request.setAttribute("scheduleTime", times);
		request.setAttribute("movieTitle", movieName);
		request.setAttribute("movieGenre", genre);
		request.setAttribute("movieLanguage", movieLanguage);
		request.setAttribute("movieCertificate", ageRating);
		request.setAttribute("movieStatus", movieStatus);
		request.setAttribute("movieDirector", director);
		request.setAttribute("movieDescription", description);
		request.setAttribute("movieReleaseDate", releaseDateStr);
		request.setAttribute("movieDuration", durationStr);
	}
	
	private void loadScreen(HttpServletRequest request) {
		List<ScreenModel> screens = null;
		List<TheatreModel> theatres = new ArrayList<>();
		try {

			screens = screenService.getAllScreens();

			request.setAttribute("screens", screens);

			for (ScreenModel screen : screens) {
				System.out.println("[GET] Fetching theatre for screen: " + screen.getTheatreId());
				theatres.add(theatreService.getTheatreById(screen.getTheatreId()));
			}


		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("screens", screens);
		request.setAttribute("theatres", theatres);
	}
}