package com.cinosphere.model;
/**
 * Model class representing database table Feedback and its attributes
 */
public class SeatModel {
	private int seatId;
    private int screenId;
    private String seatNumber;
    private String rowNumber;
    private String seatType;
    private String seatStatus;
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
     * @return int
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
     * @return String
     */
    public String getSeatNumber() { 
    	return seatNumber; 
    }
    /**
     * 
     * @param seatNumber
     */
    public void setSeatNumber(String seatNumber) { 
    	this.seatNumber = seatNumber; 
    }
    /**
     * 
     * @return String
     */
    public String getRowNumber() { 
    	return rowNumber; 
    }
    /**
     * 
     * @param rowNumber
     */
    public void setRowNumber(String rowNumber) { 
    	this.rowNumber = rowNumber; 
    }
    /**
     * 
     * @return String
     */
    public String getSeatType() { 
    	return seatType; 
    }
    /**
     * 
     * @param seatType
     */
    public void setSeatType(String seatType) { 
    	this.seatType = seatType; 
    }
    /**
     * 
     * @return String
     */
    public String getSeatStatus() { 
    	return seatStatus; 
    }
    /**
     * 
     * @param seatStatus
     */
    public void setSeatStatus(String seatStatus) { 
    	this.seatStatus = seatStatus; 
    }
}
