package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

import com.cinosphere.dao.UsersDAO;
import com.cinosphere.model.MembershipModel;
import com.cinosphere.model.UsersModel;
import com.cinosphere.service.LoginService;
import com.cinosphere.service.MembershipService;
import com.cinosphere.utils.FileuploadUtil;
import com.cinosphere.utils.SessionUtil;


/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/updateprofile" })
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,
	    maxFileSize = 1024 * 1024 * 10,
	    maxRequestSize = 1024 * 1024 * 50
	)
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = new File(System.getProperty("user.dir"))+ File.separator+ "assets" + File.separator+ "profile";
	UsersDAO usersdao = new UsersDAO();
    MembershipService membershipService = new MembershipService();
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UsersModel user = (UsersModel) SessionUtil.getAttribute(request, "user");
		try {
			MembershipModel membership = membershipService.getMembershipByuserId(user.getUserId());
			request.setAttribute("membership", membership);
		} catch (Exception e) {
			request.setAttribute("error", "Failed to load profile details.");
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/pages/updateProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UsersModel user = (UsersModel) SessionUtil.getAttribute(request, "user");
		String firstName = request.getParameter("userFirstName");
		String lastName = request.getParameter("userLastName");
		String email = request.getParameter("userEmail");
		LocalDate dob = LocalDate.parse(request.getParameter("userDob"));
		try {
			boolean isUpdated = usersdao.UpdateUser(user.getUserId(), firstName, lastName, email,dob);
			if(isUpdated) {
				user.setFirstName(firstName);
				user.setLastName(lastName);
				user.setEmail(email);
				user.setDateOfBirth(dob);
				LoginService login = new LoginService();
				login.login(user, request);
				Part filePart = request.getPart("profileAvatarInput");
				 if (FileuploadUtil.isImage(filePart)) {
					 
					 String userId = String.valueOf(user.getUserId());
					 File folder = new File(UPLOAD_DIR);
					    File[] oldFiles = folder.listFiles((dir, name) -> name.startsWith(userId + "."));
					    if (oldFiles != null) {
					        for (File old : oldFiles) {
					            old.delete();
					        }
					    }
					 
					 String extension = FileuploadUtil.getFileExtension(filePart.getSubmittedFileName());
                     String fileName = userId + extension;
                     FileuploadUtil.saveFile(filePart, UPLOAD_DIR, fileName);
                     request.setAttribute("msg", "Update Success");
				 }
				 
			}else {
				request.setAttribute("error", "Update Failed");
				response.sendRedirect(request.getContextPath() + "/updateprofile");
				return;
			}
		} catch (Exception e) {
			request.setAttribute("error", "Unexpected error");
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/updateprofile");
			return;
		}
		response.sendRedirect(request.getContextPath() + "/profile");
		return;
	}
	

}
