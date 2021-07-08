package com.tejas.filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tejas.model.User;

@WebFilter(urlPatterns = {"/AddPhone.jsp","/EditPhone.jsp","/allDetails.jsp","/listUser"})
public class Admin implements Filter 
{
	
    public Admin() 
    {
       
    }

	public void destroy() 
	{
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;

		if(req.getSession().getAttribute("u")==null)
		{
			resp.sendRedirect("login.jsp");
		}
		else 
		{
			/*
			 * User u=(user)req.getSession().getAttribute("u");
			 * if(u.getRole().equals("admin")) { chain.doFilter(req, resp); } else {
			 * resp.sendRedirect("Product.jsp"); }
			 */
		}
	}

	public void init(FilterConfig fConfig) throws ServletException 
	{
	
	}

}
