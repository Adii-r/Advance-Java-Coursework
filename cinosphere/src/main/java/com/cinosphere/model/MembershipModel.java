package com.cinosphere.model;
/**
 * Model class representing database table Membership and its attributes
 */
public class MembershipModel {
    private int membershipId;
    private int userId;
    private String membershipType;
    private String membershipStatus;
    private int totalLoyaltyPoints;
    private double discountPercentage;
    /**
     * 
     * @return int
     */
    public int getMembershipId() { 
    	return membershipId; 
    	}
    /**
     * 
     * @param membershipId
     */
    public void setMembershipId(int membershipId) { 
    	this.membershipId = membershipId; 
    }
    /**
     * 
     * @return int
     */
    public int getUserId() { 
    	return userId; 
    }
    /**
     * 
     * @param customerId
     */
    public void setUserId(int customerId) {
    	this.userId = customerId; 
    }
    /**
     * 
     * @return String
     */
    public String getMembershipType() { 
    	return membershipType; 
    }
    /**
     * 
     * @param membershipType
     */
    public void setMembershipType(String membershipType) { 
    	this.membershipType = membershipType; 
    }
    /**
     * 
     * @return String
     */
    public String getMembershipStatus() {
    	return membershipStatus; 
    }
    /**
     * 
     * @param membershipStatus
     */
    public void setMembershipStatus(String membershipStatus) { 
    	this.membershipStatus = membershipStatus; 
    }
    /**
     * 
     * @return int
     */
    public int getTotalLoyaltyPoints() { 
    	return totalLoyaltyPoints; 
    }
    /**
     * 
     * @param totalLoyaltyPoints
     */
    public void setTotalLoyaltyPoints(int totalLoyaltyPoints) { 
    	this.totalLoyaltyPoints = totalLoyaltyPoints; 
    }
    /**
     * 
     * @return double
     */
    public double getDiscountPercentage() { 
    	return discountPercentage; 
    }
    /**
     * 
     * @param discountPercentage
     */
    public void setDiscountPercentage(double discountPercentage) { 
    	this.discountPercentage = discountPercentage;
    }
}