package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.cinosphere.model.UsersModel;
import com.cinosphere.service.UserService;
import com.cinosphere.utils.SessionUtil;

/**
 * @author Raunit Giri
 * @
 * Servlet implementation class AdminPanelServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin" })
public class AdminPanelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPanelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserService usersService = new UserService();
		 List<UsersModel> users;
		 try {
			users = usersService.getAllUsers();
			SessionUtil.setAttribute(request, "userList", users, 3600);
			request.getRequestDispatcher("/WEB-INF/pages/adminPanel.jsp").forward(request, response);
		} catch (Exception e) {

			request.getRequestDispatcher("/WEB-INF/pages/adminPanel.jsp").forward(request, response);
			e.printStackTrace();
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
        

}
