package com.cinosphere.model;

import java.time.LocalDate;
/**
 * Model class representing database table Ticket and its attributes
 */
public class TicketModel {
	private int ticketId;
    private int bookingId;
    private int showtimeId;
    private int seatId;
    private String ticketType;
    private String ticketStatus;
    private LocalDate issueDate;
    private double ticketPrice;
    
    /**
     * 
     * @return int
     */
    public int getTicketId() {
    	return ticketId;
    }
    /**
     * 
     * @param ticketId
     */
    public void setTicketId(int ticketId) { 
    	this.ticketId = ticketId; 
    }
    /**
     * 
     * @return int
     */
    public int getBookingId() {
    	return bookingId; 
    }
    /**
     * 
     * @param bookingId
     */
    public void setBookingId(int bookingId) { 
    	this.bookingId = bookingId; 
    }
    /**
     * 
     * @return int
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
     * @return int
     */
    public int getSeatId() { 
    	return seatId; 
    }
    /**
     * 
     * @param seatId
     */
    public void setSeatId(int seatId) { 
    	this.seatId = seatId; 
    }
    /**
     * 
     * @return String
     */
    public String getTicketType() { 
    	return ticketType; 
    }
    /**
     * 
     * @param ticketType
     */
    public void setTicketType(String ticketType) { 
    	this.ticketType = ticketType; 
    }
    /**
     * 
     * @return String
     */
    public String getTicketStatus() { 
    	return ticketStatus;
    }
    /**
     * 
     * @param ticketStatus
     */
    public void setTicketStatus(String ticketStatus) { 
    	this.ticketStatus = ticketStatus;
    }
    /**
     * 
     * @return LocalDate
     */
    public LocalDate getIssueDate() { 
    	return issueDate; 
    }
    /**
     * 
     * @param issueDate
     */
    public void setIssueDate(LocalDate issueDate) {
    	this.issueDate = issueDate; 
    }
    /**
     * 
     * @return double
     */
    public double getTicketPrice() { 
    	return ticketPrice; 
    }
    /**
     * 
     * @param ticketPrice
     */
    public void setTicketPrice(double ticketPrice) { 
    	this.ticketPrice = ticketPrice; 
    }
}
