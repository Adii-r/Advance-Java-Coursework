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

		String sql = "SELECT * FROM movie WHERE movie_name LIKE ? ORDER BY release_date ASC";
		
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
	public List<MovieModel> findByAgeRating(String ageRating)throws Exception {
		
		List<MovieModel> movies = new ArrayList<>();
		Connection con = DBconfig.getConnection();

		String sql = "SELECT * FROM movie WHERE age_rating = ? ORDER BY release_date ASC";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, ageRating);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			movies.add(createMovieModel(rs));
		}
		
		rs.close();
	    ps.close();
	    con.close();
	    return movies;
	}
	public List<MovieModel> findByMovieLanguage(String movieLanguage)throws Exception {
			
			List<MovieModel> movies = new ArrayList<>();
			Connection con = DBconfig.getConnection();
	
			String sql = "SELECT * FROM movie WHERE movie_language = ? ORDER BY release_date ASC";
			
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
	 * find movie data using movie language
	 * @param movieLanguage
	 * @return list of MovieModel Object
	 * @throws Exception
	 */
	public List<MovieModel> findByMovieStatus(String status)throws Exception{
		List<MovieModel> movies = new ArrayList<>();
		Connection con = DBconfig.getConnection();

		String sql = "SELECT * FROM movie WHERE movie_status = ? ORDER BY release_date ASC";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, status);
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
	public List<MovieModel> getAllActiveMovie() throws Exception {
		List<MovieModel> movies = new ArrayList<>();
		String sql = "SELECT * FROM movie WHERE movie_status = ? ORDER BY release_date ASC";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, "NOW_SHOWING");
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			movies.add(createMovieModel(rs));
		}
		rs.close();
	    ps.close();
	    con.close();
	    return movies;
	}
	public List<MovieModel> getTopActiveMovie() throws Exception{
		List<MovieModel> movies = new ArrayList<>();
		String sql = "SELECT * FROM movie WHERE movie_status = ? ORDER BY release_date ASC LIMIT 1;";
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, "NOW_SHOWING");
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			movies.add(createMovieModel(rs));
		}
		rs.close();
	    ps.close();
	    con.close();
	    return movies;
	}
	
	public List<MovieModel> findByFilters(String language, String genre,  String status, String keyword) throws Exception {
		List<MovieModel> movies = new ArrayList<>();
		StringBuilder sql = new StringBuilder("SELECT * FROM movie WHERE 1=1 ");
		List<String> params = new ArrayList<>();
		
		if (valueCheck(language)) { sql.append("AND movie_language = ? "); params.add(language); }
		if (valueCheck(genre))    { sql.append("AND genre = ? ");          params.add(genre);    }
		if (valueCheck(status) && !status.equals("all"))   { sql.append("AND movie_status = ? ");   params.add(status);   }
		if (valueCheck(keyword))  { sql.append("AND movie_name LIKE ? ");  params.add("%" + keyword + "%"); }
		
		sql.append("ORDER BY release_date ASC");
		
		Connection con = DBconfig.getConnection();
		PreparedStatement ps = con.prepareStatement(sql.toString());
		System.out.print(sql);
		System.out.print(params);
		for (int i = 0; i < params.size(); i++) {
			ps.setString(i+1, params.get(i));
		}
	
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) movies.add(createMovieModel(rs));
		
		rs.close(); ps.close(); con.close();
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
		movie.setMovieName(rs.getString("movie_name"));
		movie.setDuration(rs.getInt("duration"));
		movie.setDirector(rs.getString("director"));
		movie.setGenre(rs.getString("genre"));
		movie.setMovieLanguage(rs.getString("movie_language"));
		movie.setDescription(rs.getString("description"));
		movie.setReleaseDate(rs.getDate("release_date").toLocalDate());
		movie.setMovieStatus(rs.getString("movie_status"));
		movie.setAgeRating(rs.getString("age_rating"));
		return movie;
	}
	/**
	 * Helper to check values
	 * @param value
	 * @return
	 */
	private boolean valueCheck(String value) {
		return value!=null && !value.trim().isEmpty();
	}
	
}
