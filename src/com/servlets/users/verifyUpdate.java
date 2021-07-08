package com.servlets.users;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.util.DatabaseConnection;


@WebServlet(name = "verifyUpdate",urlPatterns = "/verifyUpdate")
public class verifyUpdate extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	static Connection con = DatabaseConnection.getConnection(); 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	String username=request.getParameter("username");
    	String email=request.getParameter("email");
		String password=request.getParameter("password");
    	
    	try 
    	{
			PreparedStatement ps= con.prepareStatement("update detail set email=?,password=? where username=?");
			ps.setString(3, username);
			ps.setString(1, email);
			ps.setString(2, password);
			ps.executeUpdate();
			
			response.sendRedirect("AdminData.jsp");
          
   		}
    	catch (Exception e) 
    	{
		    System.out.println(e);
		}
	}
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
		doGet(request, response);
	}

}
