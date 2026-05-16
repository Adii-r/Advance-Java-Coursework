package com.cinosphere.service;


import java.util.List;

import com.cinosphere.dao.MovieDAO;
import com.cinosphere.model.MovieModel;

public class MovieService {
	MovieDAO movieDAO = new MovieDAO();
	public List<MovieModel> getFilteredMovies(String language, String genre, String status, String keyword) throws Exception {

			List<MovieModel> filtered = movieDAO.findByFilters(language, genre, status, keyword);

			return filtered;
}

public MovieModel getMovieById(int movieId) throws Exception {
return movieDAO.findById(movieId);
}
public List<MovieModel> getAllActiveMovies() throws Exception {
return movieDAO.getAllActiveMovie();
}

public List<MovieModel> get4ActiveMovies() throws Exception {
	return movieDAO.get4ActiveMovie();
}

public List<MovieModel> getAllMovies() throws Exception {
	return movieDAO.findByFilters(null, null, null, null);
}

public List<MovieModel> getMoviesByStatus(String status) throws Exception {
 
	return movieDAO.findByMovieStatus(status);
}

public List<MovieModel> findByMovieName(String searchMovie) throws Exception{
	
	return movieDAO.findByMovieName(searchMovie);
}
}
