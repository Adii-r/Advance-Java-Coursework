package com.cinosphere.model;

import java.time.LocalDate;
import java.time.LocalTime;
/**
 * Model class representing database table Payment and its attributes
 */
public class PaymentModel {
	private int paymentId;
    private int bookingId;
    private String paymentMethod;
    private double paymentAmount;
    private LocalDate paymentDate;
    private LocalTime paymentTime;
    private String paymentStatus;
    /**
     * 
     * @return
     */
    public int getPaymentId() { 
    	return paymentId; 
    }
    /**
     * 
     * @param paymentId
     */
    public void setPaymentId(int paymentId) { 
    	this.paymentId = paymentId;
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
    public String getPaymentMethod() { 
    	return paymentMethod; 
    }
    /**
     * 
     * @param paymentMethod
     */
    public void setPaymentMethod(String paymentMethod) { 
    	this.paymentMethod = paymentMethod; 
    }
    /**
     * 
     * @return
     */

    public double getPaymentAmount() { 
    	return paymentAmount; 
    }
    /**
     * 
     * @param paymentAmount
     */
    public void setPaymentAmount(double paymentAmount) { 
    	this.paymentAmount = paymentAmount;
    }
    /**
     * 
     * @return
     */
    public LocalDate getPaymentDate() { 
    	return paymentDate; 
    }
    /**
     * 
     * @param paymentDate
     */
    public void setPaymentDate(LocalDate paymentDate) { 
    	this.paymentDate = paymentDate; 
    }
    /**
     * 
     * @return
     */
    public LocalTime getPaymentTime() { 
    	return paymentTime; 
    }
    /**
     * 
     * @param paymentTime
     */
    public void setPaymentTime(LocalTime paymentTime) { 
    	this.paymentTime = paymentTime; 
    }
    /**
     * 
     * @return
     */
    public String getPaymentStatus() { 
    	return paymentStatus; 
    }
    /**
     * 
     * @param paymentStatus
     */
    public void setPaymentStatus(String paymentStatus) { 
    	this.paymentStatus = paymentStatus; 
    }
}
