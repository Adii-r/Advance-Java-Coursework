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
 * Servlet implementation class MovieFilterServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/moviefilter" })
public class MovieFilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieFilterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MovieService service = new MovieService();
		String language = request.getParameter("langFilter");
		String genre = request.getParameter("genreFilter");
		String status = request.getParameter("status");
		String search = request.getParameter("movieSearch");
		
		List<MovieModel> filteredMovies = null;
		try {
		if(!status.equals("all")) {
			filteredMovies = service.getFilteredMovies(language, genre, status, search);
		}else {
			filteredMovies = service.getAllActiveMovies();
		}
		request.setAttribute("selectedLanguage",   language);
        request.setAttribute("selectedGenre",  genre);
        request.setAttribute("searchKeyword",  search);
        request.setAttribute("selectedStatus", status != null ? status : "all");
        request.setAttribute("filteredMovies",filteredMovies);
			
		} catch (Exception e) {
			request.setAttribute("error", "Could not load movies Please try again later.");
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/pages/movies.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
