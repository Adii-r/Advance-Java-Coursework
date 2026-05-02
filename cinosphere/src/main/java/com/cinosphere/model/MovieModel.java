package com.cinosphere.model;

import java.time.LocalDate;
/*8
 * Model class representing database table Movie and its attributes
 */
public class MovieModel {
	private int movieId;
    private String movieName;
    private int duration;
    private String director;
    private String genre;
    private String movieLanguage;
    private String description;
    private LocalDate releaseDate;
    private String movieStatus;
    private String ageRating;
    /**
     * 
     * @return
     */
    public int getMovieId() { 
    	return movieId; 
    }
    /**
     * 
     * @param movieId
     */
    public void setMovieId(int movieId) { 
    	this.movieId = movieId; 
    	}
    /**
     * 
     * @return
     */
    public String getMovieName() { 
    	return movieName; 
    }
    /**
     * 
     * @param movieName
     */
    public void setMovieName(String movieName) { 
    	this.movieName = movieName; 
    }
    /**
     * 
     * @return
     */
    public int getDuration() { 
    	return duration; 
    }
    /**
     * 
     * @param duration
     */
    public void setDuration(int duration) { 
    	this.duration = duration; 
    }
    /**
     * 
     * @return
     */

    public String getDirector() { 
    	return director; 
    }
    /**
     * 
     * @param director
     */
    public void setDirector(String director) { 
    	this.director = director;
    }
    /**
     * 
     * @return
     */
    public String getGenre() { 
    	return genre; 
    }
    /**
     * 
     * @param genre
     */
    public void setGenre(String genre) { 
    	this.genre = genre; 
    }
    /**
     * 
     * @return
     */
    public String getMovieLanguage() { 
    	return movieLanguage; 
    }
    /**
     * 
     * @param movieLanguage
     */
    public void setMovieLanguage(String movieLanguage) { 
    	this.movieLanguage = movieLanguage; 
    }
    /**
     * 
     * @return
     */
    public String getDescription() { 
    	return description; 
    }
    /**
     * 
     * @param description
     */
    public void setDescription(String description) { 
    	this.description = description; 
    }
    /**
     * 
     * @return
     */
    public LocalDate getReleaseDate() { 
    	return releaseDate; 
    }
    /**
     * 
     * @param releaseDate
     */
    public void setReleaseDate(LocalDate releaseDate) { 
    	this.releaseDate = releaseDate;
    }
    /**
     * 
     * @return
     */
    public String getMovieStatus() { 
    	return movieStatus;
    }
    /**
     * 
     * @param movieStatus
     */
    public void setMovieStatus(String movieStatus) { 
    	this.movieStatus = movieStatus; 
    }
    /**
     * 
     * @return
     */
    public String getAgeRating() {
    	return ageRating; 
    }
    /**
     * 
     * @param ageRating
     */
    public void setAgeRating(String ageRating) { 
    	this.ageRating = ageRating; 
    }
}
