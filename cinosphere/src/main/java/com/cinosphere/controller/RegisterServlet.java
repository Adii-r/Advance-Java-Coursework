package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

import com.cinosphere.service.RegisterService;

/**
 * Servlet implementation class RegisterServlet
 * 
 * This servlet handles the registration functionality.
 * It displays the register page on GET requests and processes user details 
 * on POST requests. if registration, it redirects the user to login servlet
 * otherwise, it displays an error message on the register page.
 * 
 * @author Raunit Giri
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String status = null;
		String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        LocalDate dob = LocalDate.parse(request.getParameter("dob"));
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String username= request.getParameter("username");
        
        RegisterService register = new RegisterService();
        
        status = register.Authentication(firstName, lastName,gender, username, dob, email, password, confirmPassword);
        
        if (status != null) {
            request.setAttribute("error", status);
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            return;
        }
        
        register.addCustomer(firstName, lastName, username, email, dob, gender,password);
        response.sendRedirect(request.getContextPath()+"/login");
		} catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
	    }
	}

}
