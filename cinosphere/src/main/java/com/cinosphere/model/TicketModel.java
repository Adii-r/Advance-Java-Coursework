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
     * @return
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
    	this.bookingId = bookingId; 
    }
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
     * @return
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
     * @return
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
     * @return
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
     * @return
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
