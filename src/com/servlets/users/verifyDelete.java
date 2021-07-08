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


@WebServlet(name = "verifyDelete",urlPatterns = "/verifyDelete")
public class verifyDelete extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	static Connection con = DatabaseConnection.getConnection(); 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	String username=request.getParameter("username"); 
    	try 
    	{
			
			PreparedStatement pt= con.prepareStatement("delete from detail where username=?");

            pt.setString(1, username);
            pt.executeUpdate();
  
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
