

package com.cinosphere.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.cinosphere.model.UsersModel;
import com.cinosphere.utils.SessionUtil;

/**
 * Servlet Filter implementation class AdminAuthenticationFIlter
 * This filter filters out request made to admin panel from users who aren't logged in
 * and who don't poses administrator privileges
 * 
 * @author Raunit Giri
 */

/** */
@WebFilter("/adminpanel")
public class AdminAuthenticationFIlter extends HttpFilter implements Filter {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpFilter#HttpFilter()
     */
    public AdminAuthenticationFIlter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		boolean isLoggedIn = SessionUtil.getAttribute(httpRequest, "user") != null;
		if (isLoggedIn) {
			UsersModel customer = (UsersModel) SessionUtil.getAttribute(httpRequest, "user");
			boolean isAdmin = customer.getUserRole().equals("ADMIN");
			System.out.print(isAdmin);
		 if(isAdmin) {
		// pass the request along the filter chain
		chain.doFilter(request, response);
		 }else {
			httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/userpanel");
		 }
		}else {
			httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
		}
			

		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

