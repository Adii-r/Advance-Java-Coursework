package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cinosphere.service.MovieService;

/**
 * Servlet implementation class AdminArchiveMovieServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/archivemovie" })
public class AdminArchiveMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String STATUS = "ARCHIVE";
	MovieService movieService = new MovieService();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminArchiveMovieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String movieId = request.getParameter("movieId");
		if(movieId==null||movieId.isEmpty()) {
			response.sendRedirect(request.getContextPath()+"/admin");
			return;
		}
		int id = Integer.parseInt(movieId);
		try {
			movieService.updateMovieStatus(id, "ARCHIVE");
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath()+"/admin#movie_management");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
