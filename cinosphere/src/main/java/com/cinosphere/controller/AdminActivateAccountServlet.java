package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cinosphere.service.UserService;

/**
 * Servlet implementation class AdminActivateAccountServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/adminactivateaccount" })
public class AdminActivateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminActivateAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userIdstr =request.getParameter("userId");
	    boolean current = Boolean.parseBoolean(request.getParameter("currentStatus"));
	    UserService service = new UserService();
	        try {
	        	int userId =  Integer.parseInt(userIdstr);
	            if(current){
	                service.deactivateUser(userId);
	            }
	            else{
	                service.activateUser(userId);
	            }

	        } catch(Exception e){
	            e.printStackTrace();
	        }

	        response.sendRedirect(request.getContextPath()+"/admin#user_management");
	    }	

}
