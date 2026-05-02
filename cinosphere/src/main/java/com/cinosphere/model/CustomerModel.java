package com.cinosphere.model;

import java.time.LocalDate;
/**
 * Model class representing database table Customer and its attributes
 */
public class CustomerModel {
	private int customerId;
    private String firstName;
    private String lastName;
    private String username;
    private String email;
    private String contactNumber;
    private LocalDate dateOfBirth;
    private String gender;
    private String hashPassword;
    private LocalDate registrationDate;
    private boolean isActive;
    private String customerRole;
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
    public String getFirstName() {
    	return firstName;
    }
    /**
     * 
     * @param firstName
     */
    public void setFirstName(String firstName) { 
    	this.firstName = firstName;
    }
    /**
     * 
     * @return
     */
    public String getLastName() { 
    	return lastName; 
    }
    /**
     * 
     * @param lastName
     */
    public void setLastName(String lastName) { 
    	this.lastName = lastName; 
    }
    /**
     * 
     * @return
     */
    public String getUsername() { 
    	return username; 
    }
    /**
     * 
     * @param username
     */
    public void setUsername(String username) { 
    	this.username = username;
    }
    /**
     * 
     * @return
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
     * @return
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
     * @return
     */
    public LocalDate getDateOfBirth() { 
    	return dateOfBirth; 
    }
    /**
     * 
     * @param dateOfBirth
     */
    public void setDateOfBirth(LocalDate dateOfBirth) { 
    	this.dateOfBirth = dateOfBirth; 
    }
    /**
     * 
     * @return
     */
    public String getGender() { 
    	return gender; 
    }
    /**
     * 
     * @param gender
     */
    public void setGender(String gender) { 
    	this.gender = gender; 
    }
    /**
     * 
     * @return
     */
    public String getHashPassword() { 
    	return hashPassword; 
    }
    /**
     * 
     * @param hashPassword
     */
    public void setHashPassword(String hashPassword) { 
    	this.hashPassword = hashPassword; 
    }
    /**
     * 
     * @return
     */
    public LocalDate getRegistrationDate() { 
    	return registrationDate; 
    }
    /**
     * 
     * @param registrationDate
     */
    public void setRegistrationDate(LocalDate registrationDate) { 
    	this.registrationDate = registrationDate;
    }
    /**
     * 
     * @return
     */
    public boolean getisActive() { 
    	return isActive;
    }
    /**
     * \
     * @param active
     */
    public void setisActive(boolean active) { 
    	isActive = active;
    }
    /**
     * 
     * @return
     */
    public String getCustomerRole() { 
    	return customerRole;
    }
    /**
     * 
     * @param customerRole
     */
    public void setCustomerRole(String customerRole) { 
    	this.customerRole = customerRole; 
    }
}
