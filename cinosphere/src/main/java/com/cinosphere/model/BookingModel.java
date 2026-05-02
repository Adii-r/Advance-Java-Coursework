package com.cinosphere.model;

import java.time.LocalDate;
import java.time.LocalTime;
/**
 * Model class representing database table Booking and its attributes
 */
public class BookingModel {
	private int bookingId;
    private int customerId;
    private LocalDate bookingDate;
    private LocalTime bookingTime;
    private String bookingStatus;
    private double totalAmount;
    private String bookingChannel;
    private int loyaltyPointsEarned;
    /**
     * 
     * @return
     */
    public int getBookingId() { 
    	return bookingId; 
    	}
    /**
     * 
     * @param bookingId
     */
    public void setBookingId(int bookingId) { 
    	this.bookingId = bookingId; }
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
    public LocalDate getBookingDate() { 
    	return bookingDate; 
    }
    /**
     * 
     * @param bookingDate
     */
    public void setBookingDate(LocalDate bookingDate) { 
    	this.bookingDate = bookingDate; 
    }
    /**
     * 
     * @return
     */
    public LocalTime getBookingTime() { 
    	return bookingTime; 
    }
    /**
     * 
     * @param bookingTime
     */
    public void setBookingTime(LocalTime bookingTime) { 
    	this.bookingTime = bookingTime; 
    }
    /**
     * 
     * @return
     */
    public String getBookingStatus() { 
    	return bookingStatus; }
    /**
     * 
     * @param bookingStatus
     */
    public void setBookingStatus(String bookingStatus) { 
    	this.bookingStatus = bookingStatus; 
    }
    /**
     * 
     * @return
     */
    public double getTotalAmount() { 
    	return totalAmount; 
    }
    /**
     * 
     * @param totalAmount
     */
    public void setTotalAmount(double totalAmount) { 
    	this.totalAmount = totalAmount; 
    }
    /**
     * 
     * @return
     */
    public String getBookingChannel() { 
    	return bookingChannel; 
    }
    /**
     * 
     * @param bookingChannel
     */
    public void setBookingChannel(String bookingChannel) { 
    	this.bookingChannel = bookingChannel; 
    }
    /**
     * 
     * @return
     */
    public int getLoyaltyPointsEarned() { 
    	return loyaltyPointsEarned; 
    }
    /**
     * 
     * @param loyaltyPointsEarned
     */
    public void setLoyaltyPointsEarned(int loyaltyPointsEarned) { 
    	this.loyaltyPointsEarned = loyaltyPointsEarned; 
    }
}
