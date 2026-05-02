package com.cinosphere.model;
/**
 * 
 */
public class ScreenModel {
	private int screenId;
    private int theatreId;
    private String screenName;
    private String screenType;
    private String screenStatus;
    private int totalCapacity;
    private double basePrice;
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
    public int getTheatreId() { 
    	return theatreId; 
    }
    /**
     * 
     * @param theatreId
     */
    public void setTheatreId(int theatreId) { 
    	this.theatreId = theatreId; 
    }
    /**
     * 
     * @return
     */
    public String getScreenName() { 
    	return screenName; 
    }
    /**
     * 
     * @param screenName
     */
    public void setScreenName(String screenName) { 
    	this.screenName = screenName; 
    }
    /**
     * 
     * @return
     */
    public String getScreenType() { 
    	return screenType; 
    }
    /**
     * 
     * @param screenType
     */
    public void setScreenType(String screenType) { 
    	this.screenType = screenType; 
    }
    /**
     * 
     * @return
     */
    public String getScreenStatus() { 
    	return screenStatus; 
    }
    /**
     * 
     * @param screenStatus
     */
    public void setScreenStatus(String screenStatus) { 
    	this.screenStatus = screenStatus; 
    }
    /**
     * 
     * @return
     */
    public int getTotalCapacity() { 
    	return totalCapacity; 
    }
    /**
     * 
     * @param totalCapacity
     */
    public void setTotalCapacity(int totalCapacity) { 
    	this.totalCapacity = totalCapacity; 
    }
    /**
     * 
     * @return
     */
    public double getBasePrice() { 
    	return basePrice; 
    }
    /**
     * 
     * @param basePrice
     */
    public void setBasePrice(double basePrice) { 
    	this.basePrice = basePrice; 
    }
}
