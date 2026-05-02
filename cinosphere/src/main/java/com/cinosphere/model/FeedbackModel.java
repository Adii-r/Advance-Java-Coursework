package com.cinosphere.model;

import java.time.LocalDate;
import java.time.LocalTime;
/**
 * Model class representing database table Feedback and its attributes
 */
public class FeedbackModel {
	private int feedbackId;
    private int customerId;
    private int movieId;
    private int rating;
    private String description;
    private LocalDate feedbackDate;
    private LocalTime feedbackTime;
    private String feedbackStatus;
    /**
     * 
     * @return
     */
    public int getFeedbackId() { 
    	return feedbackId; 
    }
    /**
     * 
     * @param feedbackId
     */
    public void setFeedbackId(int feedbackId) {
    	this.feedbackId = feedbackId; 
    }
    /**
     * 
     * @return
     */
    public int getCustomerId() { 
    	return customerId; 
    }
    /**
     * 
     * @param customerId
     */
    public void setCustomerId(int customerId) { 
    	this.customerId = customerId; 
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
    public int getRating() { 
    	return rating; 
    }
    /**
     * 
     * @param rating
     */
    public void setRating(int rating) { 
    	this.rating = rating; 
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
    public LocalDate getFeedbackDate() { 
    	return feedbackDate;
    }
    /**
     * 
     * @param feedbackDate
     */
    public void setFeedbackDate(LocalDate feedbackDate) { 
    	this.feedbackDate = feedbackDate; 
    }
    /**
     * 
     * @return
     */
    public LocalTime getFeedbackTime() { 
    	return feedbackTime; 
    }
    /**
     * 
     * @param feedbackTime
     */
    public void setFeedbackTime(LocalTime feedbackTime) { 
    	this.feedbackTime = feedbackTime; 
    }
    /**
     * 
     * @return
     */
    public String getFeedbackStatus() { 
    	return feedbackStatus; 
    }
    /**
     * 
     * @param feedbackStatus
     */
    public void setFeedbackStatus(String feedbackStatus) { 
    	this.feedbackStatus = feedbackStatus; 
    }
}
