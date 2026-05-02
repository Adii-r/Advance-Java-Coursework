package com.cinosphere.model;
/**
 * Model class representing database table Theatre and its attributes
 */
public class TheatreModel {
	private int theatreId;
    private String theatreName;
    private String city;
    private String email;
    private String contactNumber;
    private int totalScreens;
    private String theatreStatus;

    /**
     * 
     * @return int
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
     * @return String
     */

    public String getTheatreName() { 
    	return theatreName; 
    }
    /**
     * 
     * @param theatreName
     */
    public void setTheatreName(String theatreName) { 
    	this.theatreName = theatreName; 
    }
    /**
     * 
     * @return String
     */
    public String getCity() { 
    	return city; 
    }
    /**
     * 
     * @param city
     */
    public void setCity(String city) { 
    	this.city = city; 
    }
    /**
     * 
     * @return String
     */
    public String getEmail() { 
    	return email;
    }
    /**
     * 
     * @param email
     */
    public void setEmail(String email) { 
    	this.email = email; 
    }
    /**
     * 
     * @return String
     */
    public String getContactNumber() { 
    	return contactNumber; 
    }
    /**
     * 
     * @param contactNumber
     */
    public void setContactNumber(String contactNumber) { 
    	this.contactNumber = contactNumber; 
    }
    /**
     * 
     * @return int
     */
    public int getTotalScreens() { 
    	return totalScreens; 
    }
    /**
     * 
     * @param totalScreens
     */
    public void setTotalScreens(int totalScreens) { 
    	this.totalScreens = totalScreens; 
    }
    /**
     * 
     * @return String
     */
    public String getTheatreStatus() { 
    	return theatreStatus; 
    }
    /**
     * 
     * @param theatreStatus
     */
    public void setTheatreStatus(String theatreStatus) { 
    	this.theatreStatus = theatreStatus; 
    }
}
