package com.cinosphere.model;
/**
 * Model class representing database table Membership and its attributes
 */
public class MembershipModel {
    private int membershipId;
    private int customerId;
    private String membershipType;
    private String membershipStatus;
    private int totalLoyaltyPoints;
    private double discountPercentage;
    /**
     * 
     * @return
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
     * @return
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
     * @return
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
     * @return
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