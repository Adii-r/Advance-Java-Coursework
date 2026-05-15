package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cinosphere.model.UsersModel;
import com.cinosphere.service.UpdatePasswordService;
import com.cinosphere.utils.SessionUtil;

/**
 * Servlet implementation class UpdatePasswordServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/updatepassword" })
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10,
	    maxRequestSize = 1024 * 1024 * 50
	)
public class UpdatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
		// TODO Auto-generated method stub
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword  = request.getParameter("confirmPassword");
		UpdatePasswordService update = new UpdatePasswordService();
		UsersModel user = (UsersModel) SessionUtil.getAttribute(request, "user");
		String status = update.authenticate(request, user, currentPassword, newPassword, confirmPassword);
		System.out.print(status);
		if ("Success".equals(status)) {
	        	response.sendRedirect(request.getContextPath() + "/profile");
	        	
	        }else {
	        	request.setAttribute("error", status);
	            request.getRequestDispatcher("/WEB-INF/pages/updateProfile.jsp").forward(request, response);
	        }
	}

}
