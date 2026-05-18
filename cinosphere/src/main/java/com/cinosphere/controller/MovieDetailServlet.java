package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.cinosphere.model.MovieModel;
import com.cinosphere.service.MovieService;

/**
 * Servlet implementation class moviedetail
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/moviedetail" })
public class MovieDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MovieService movieService = new MovieService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MovieModel> filteredMovies = null;
		String movieId = request.getParameter("movieId");
		try {
			if(movieId==null||movieId.isEmpty()) {
				response.sendRedirect("movie");
				return;
			}
			int id = Integer.parseInt(movieId);
			filteredMovies = movieService.get4ActiveMovies();
			request.setAttribute("movie",movieService.getMovieById(id));
			request.setAttribute("filteredMovies",filteredMovies);
		} catch (Exception e) {
		    e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/pages/movieDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
