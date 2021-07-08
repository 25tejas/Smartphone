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

@WebFilter(urlPatterns = {"/OrderController","/Cart.jsp","/YourOrdered.jsp"})
public class Filter1 implements Filter {

    public Filter1() 
    {
       
    }

	public void destroy() 
	{
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException 
	{
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		
		if(req.getSession().getAttribute("u")==null)
		{
			res.sendRedirect("login.jsp");
			
		}
	
		chain.doFilter(req, res);
	}

	public void init(FilterConfig fConfig) throws ServletException 
	{
		
	}

}
