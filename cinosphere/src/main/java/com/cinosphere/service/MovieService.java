package com.cinosphere.service;


import java.time.LocalDate;
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
	return movieDAO.getAllMovie();
}

public List<MovieModel> getMoviesByStatus(String status) throws Exception {
 
	return movieDAO.findByMovieStatus(status);
}

public List<MovieModel> findByMovieName(String searchMovie) throws Exception{
	
	return movieDAO.findByMovieName(searchMovie);
}


public void updateAllMovieStatus() throws Exception{
	List<MovieModel> movies = getAllMovies();
	LocalDate today = LocalDate.now();
	for(MovieModel movie: movies) {
		String status = movie.getMovieStatus();
		if(status.equals("ARCHIVE")) continue;
		LocalDate release = movie.getReleaseDate();
		if(release.isAfter(today)){
			if(!status.equals("COMNG_SOON"))
				updateMovieStatus(movie.getMovieId(), "COMMING_SOON");
		}else{
			if(!status.equals("NOW_SHOWING"))
				updateMovieStatus(movie.getMovieId(), "NOW_SHOWING");
		}
	}
	
}


public boolean updateMovieStatus(int movieId,String movieStatus) throws Exception{
	return movieDAO.updateStatus(movieId, movieStatus);

}

public int insertAndGetId(String movieName, int duration, String director, String genre, String movieLanguage, String description, LocalDate releaseDate, String movieStatus, String ageRating) throws Exception {
	return movieDAO.insertAndGetId(movieName, duration, director, genre, movieLanguage, description, releaseDate, movieStatus, ageRating);
	
}

public boolean updateMovie(int movieId, String movieName, int duration, String director, String genre, String movieLang,String description, LocalDate releaseDate, String movieStatus, String ageRating) throws Exception {
	return movieDAO.updateMovie(movieId, movieName, duration, director, genre, movieLang, description, releaseDate, movieStatus, ageRating);
	
}
}
