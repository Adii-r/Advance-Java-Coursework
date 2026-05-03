package com.cinosphere.model;

import java.time.LocalDate;
/**
 * Model class representing database table Customer and its attributes
 */
public class UsersModel {
	private int userId;
    private String firstName;
    private String lastName;
    private String username;
    private String email;
    private LocalDate dateOfBirth;
    private String gender;
    private String hashPassword;
    private LocalDate registrationDate;
    private boolean isActive;
    private String userRole;
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
     * @return String
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
     * @return String
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
     * @return LocalDate
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
     * @return String
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
     * @return String
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
     * @return LocalDate
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
     * @return boolean
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
     * @return String
     */
    public String getUserRole() { 
    	return userRole;
    }
    /**
     * 
     * @param customerRole
     */
    public void setUserRole(String customerRole) { 
    	this.userRole = customerRole; 
    }
}
