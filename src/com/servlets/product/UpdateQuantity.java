package com.servlets.product;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.util.DatabaseConnection;


@WebServlet(name = "UpdateQuantity",urlPatterns = "/UpdateQuantity")
public class UpdateQuantity extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	static Connection con = DatabaseConnection.getConnection(); 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	int id=Integer.parseInt(request.getParameter("id"));
    	int qty=Integer.parseInt(request.getParameter("qty"));
		
    	
    	try 
    	{
			
			PreparedStatement ps= con.prepareStatement("update cart set quantity=? where cartid=?");
			ps.setInt(1,qty);
			ps.setInt(2,id);
			ps.executeUpdate();
			
			response.sendRedirect("cart.jsp");
          
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
