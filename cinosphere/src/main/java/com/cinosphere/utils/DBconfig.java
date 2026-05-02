package com.cinosphere.utils;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Utility Class responsible for connection with database
 */
public class DBconfig {
	//Attributes for COnnection to DB
	private static final String DBNAME = "cinosphere"; //Add DBname after database is finalized
	private static final String URL = "jdbc:mysql://localhost:3306/"+DBNAME;
	private static final String USER= "root";
	private static final String PASSWORD ="";
	/**
	 * Establish Connection with database
	 * @return Connection Object
	 */
	public static Connection getConnection() {

        Connection conn = null;

        try {
        	// Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish connection attempt
            conn = DriverManager.getConnection(URL, USER, PASSWORD);

            System.out.println("Connected to DB");

        } catch (Exception e) {
        	// Connection failure and print stack trace
            System.out.println("DB Connection Failed");
            e.printStackTrace(); 
        }

        return conn;
    }
}
