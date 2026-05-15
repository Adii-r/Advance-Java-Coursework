package com.cinosphere.service;


import java.util.List;

import com.cinosphere.dao.MovieDAO;
import com.cinosphere.model.MovieModel;

public class MovieService {
	MovieDAO moviedao = new MovieDAO();
	public List<MovieModel> getFilteredMovies(String language, String genre, String status, String keyword) throws Exception {

			List<MovieModel> filtered = moviedao.findByFilters(language, genre, status, keyword);

			return filtered;
}

public MovieModel getMovieById(int movieId) throws Exception {
return moviedao.findById(movieId);
}
public List<MovieModel> getAllActiveMovies() throws Exception {
return moviedao.getAllActiveMovie();
}

public List<MovieModel> getTopActiveMovies() throws Exception {
	return moviedao.getTopActiveMovie();
}
}
