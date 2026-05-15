package com.cinosphere.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.cinosphere.model.UsersModel;
import com.cinosphere.service.DeleteAccountService;
import com.cinosphere.utils.SessionUtil;

/**
 * Servlet implementation class AdminDeleteAccountServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admindeleteaccount" })
public class AdminDeleteAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDeleteAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DeleteAccountService service = new DeleteAccountService();
		int userId = Integer.parseInt(request.getParameter("userId"));
		try {
			service.DeleteAccount(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/admin");
	}

}
