package com.cinosphere.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.cinosphere.model.MovieModel;
import com.cinosphere.utils.DBconfig;

public class MovieDAO {
	/**
	 * Insert new movie to database
	 * @param movieName
	 * @param duration
	 * @param director
	 * @param genre
	 * @param movieLanguage
	 * @param description
	 * @param releaseDate
	 * @param movieStatus
	 * @param ageRating
	 * @return boolean
	 * @throws Exception
	 */
	public boolean insert(String movieName, int duration, String director, String genre, String movieLanguage, String description,LocalDate releaseDate ,String movieStatus, String ageRating) throws Exception {
		String sql = "INSERT INTO movie (movie_name,duration,director,genre,movie_language,description,release_date,movie_status,age_rating)"
				+"VALUES (?,?,?,?,?,?,?,?,?)";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, movieName);
		ps.setInt(2, duration);
		ps.setString(3, director);
		ps.setString(4, genre);
		ps.setString(5, movieLanguage);
		ps.setString(6, description);
		ps.setDate(7,Date.valueOf(releaseDate));
		ps.setString(8, movieStatus);
		ps.setString(9, ageRating);
		return ps.executeUpdate() >0;
	}
	/**
	 * find movie data using id
	 * @param movieId
	 * @return MovieModel Object
	 * @throws Exception
	 */
	
	public MovieModel findById(int movieId) throws Exception{
		MovieModel movie = null;
		Connection con = DBconfig.getConnection();
		String sql = "SELECT * FROM movie WHERE movie_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, movieId);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			movie = createMovieModel(rs);
		}
		
		rs.close();
	    ps.close();
	    con.close();
	    return movie;
	}
	/**
	 * find movie data using genre
	 * @param genre
	 * @return list of MovieModel Object
	 * @throws Exception
	 */
	public List<MovieModel> findByGenre(String genre)throws Exception {
		List<MovieModel> movies = new ArrayList<>();
		Connection con = DBconfig.getConnection();

		String sql = "SELECT * FROM movie WHERE genre = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, genre);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			movies.add(createMovieModel(rs));
		}
		
		rs.close();
	    ps.close();
	    con.close();
	    return movies;
	}
	/**
	 * find movie data using movie name
	 * @param movieName
	 * @return list of MovieModel Object
	 * @throws Exception
	 */
	public List<MovieModel> findByMovieName(String movieName)throws Exception {
		List<MovieModel> movies = new ArrayList<>();
		Connection con = DBconfig.getConnection();

		String sql = "SELECT * FROM movie WHERE movie_name = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, movieName);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			movies.add(createMovieModel(rs));
		}
		
		rs.close();
	    ps.close();
	    con.close();
	    return movies;
	}
	/**
	 * find movie data using movie language
	 * @param movieLanguage
	 * @return list of MovieModel Object
	 * @throws Exception
	 */
	public List<MovieModel> findByMovieLanguage(String movieLanguage)throws Exception{
		List<MovieModel> movies = new ArrayList<>();
		Connection con = DBconfig.getConnection();

		String sql = "SELECT * FROM movie WHERE movie_language = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, movieLanguage);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			movies.add(createMovieModel(rs));
		}
		
		rs.close();
	    ps.close();
	    con.close();
	    return movies;
	}
	/**
	 * Get list containing all movies
	 * @return list of MovieModel Object
	 * @throws Exception
	 */
	public List<MovieModel> getAllMovie() throws Exception {
		List<MovieModel> movies = new ArrayList<>();
		String sql = "SELECT * FROM movie";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			movies.add(createMovieModel(rs));
		}
		rs.close();
	    ps.close();
	    con.close();
	    return movies;
	}
	/**
	 * Helper method to create Movie Object
	 * @param rs ResultSet
	 * @return MovieModel Object
	 * @throws SQLException
	 */
	public MovieModel createMovieModel(ResultSet rs) throws SQLException  {
		MovieModel movie = new MovieModel();
		movie.setMovieId(rs.getInt("movie_id"));
		movie.setMovieName(rs.getString(""));
		movie.setDuration(rs.getInt(""));
		movie.setDirector(rs.getString(""));
		movie.setGenre(rs.getString(""));
		movie.setMovieLanguage(rs.getString(""));
		movie.setDescription(rs.getString(""));
		movie.setReleaseDate(rs.getDate(0).toLocalDate());
		movie.setMovieStatus(rs.getString(""));
		movie.setAgeRating(rs.getString(""));
		return movie;
	}
}
