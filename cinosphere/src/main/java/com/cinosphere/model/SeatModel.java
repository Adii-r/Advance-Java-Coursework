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
     * @return
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
     * @return
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
     * @return
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
