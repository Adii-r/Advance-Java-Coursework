package com.cinosphere.model;

import java.time.LocalDate;
import java.time.LocalTime;
/**
 * Model class representing database table ShowtimeModel and its attributes
 */
public class ShowtimeModel {
	private int showtimeId;
    private int screenId;
    private int movieId;
    private LocalDate showDate;
    private LocalTime startTime;
    private LocalTime endTime;
    private String showStatus;
    private String showType;
    /**
     * 
     * @return
     */
    public int getShowtimeId() { 
    	return showtimeId; 
    }
    /**
     * 
     * @param showtimeId
     */
    public void setShowtimeId(int showtimeId) { 
    	this.showtimeId = showtimeId; 
    }
    /**
     * 
     * @return
     */
    public int getScreenId() { 
    	return screenId; 
    }
    /**
     * 
     * @param screenId
     */
    public void setScreenId(int screenId) { 
    	this.screenId = screenId; 
    }
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
    public LocalDate getShowDate() { 
    	return showDate; 
    }
    /**
     * 
     * @param showDate
     */
    public void setShowDate(LocalDate showDate) { 
    	this.showDate = showDate; 
    }
    /**
     * 
     * @return
     */
    public LocalTime getStartTime() {
    	return startTime; 
    }
    /**
     * 
     * @param startTime
     */
    public void setStartTime(LocalTime startTime) { 
    	this.startTime = startTime; 
    }
    /**
     * 
     * @return
     */
    public LocalTime getEndTime() { 
    	return endTime; 
    }
    /**
     * 
     * @param endTime
     */
    public void setEndTime(LocalTime endTime) { 
    	this.endTime = endTime; 
    }
    /**
     * 
     * @return
     */
    public String getShowStatus() { 
    	
    	return showStatus; 
    }
    /**
     * 
     * @param showStatus
     */
    public void setShowStatus(String showStatus) { 
    	this.showStatus = showStatus; 
    }
    /**
     * 
     * @return
     */
    public String getShowType() {
    	return showType; 
    }
    /**
     * 
     * @param showType
     */
    public void setShowType(String showType) { 
    	this.showType = showType; 
    }
}
