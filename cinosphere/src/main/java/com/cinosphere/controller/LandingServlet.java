package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import com.cinosphere.model.MovieModel;
import com.cinosphere.service.MovieService;

/**
 * Servlet implementation class LandingServlet
 */
@WebServlet(
		asyncSupported = true, 
		urlPatterns = {"/home"})
public class LandingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LandingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		MovieService service = new MovieService();
		try {
			List<MovieModel> activeMovies  = service.get4ActiveMovies();
			request.setAttribute("activeMovies",activeMovies);
		} catch (Exception e) {
			request.setAttribute("error", "Could not load movies Please try again later.");
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
