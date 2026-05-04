package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.cinosphere.dao.UsersDAO;
import com.cinosphere.model.UsersModel;
import com.cinosphere.service.LoginService;
import com.cinosphere.utils.SessionUtil;



/**
 * Servlet implementation class LoginServlet
 * 
 * This servlet handles the login functionality.
 * It displays the login page on GET requests and processes user credentials 
 * on POST requests. If the login is successful, it redirects the user to 
 * the user panel, otherwise, it displays an error message on the login page.
 * 
 * @author Raunit Giri
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Extracting and using details from request to authenticate and log user
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        LoginService service= new LoginService();
        String status = service.authenticate(username, password,request); // logs user if credentials match and creates session
        if ("Success".equals(status)) {
        	UsersDAO userdao = new UsersDAO();
        	UsersModel user=null;
			try {
				user = userdao.findByUsername(username);
			} catch (SQLException e) {
				e.printStackTrace();
			}
        	if(user!=null && user.getUserRole().equals("ADMIN")) {
        		response.sendRedirect(request.getContextPath() + "/admin");
        	}else {
        		response.sendRedirect(request.getContextPath() + "/profile");
        	}
        	
        }else {
        	//forwarding error message
        	request.setAttribute("error", status);
            request.setAttribute("typedUser", username); 
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
	}

}
