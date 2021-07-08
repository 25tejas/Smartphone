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
 
@WebServlet("/UpdatePhone")
public class UpdatePhone extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	static Connection con = DatabaseConnection.getConnection();   
    public UpdatePhone() 
    {
        super();
  
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id=request.getParameter("id");
		String description=request.getParameter("description");
		String modelno=request.getParameter("modelno");
		String price=request.getParameter("price");
		int qty=Integer.parseInt(request.getParameter("qty"));
    	try 
    	{
			
			PreparedStatement ps= con.prepareStatement("update product set modelno=?,price=?,description=?,qty=? where pid=?");
			ps.setString(1, modelno);
			ps.setString(2, price);
			ps.setNString(3, description);
			ps.setInt(4, qty);
			ps.setString(5, id);
			
			ps.executeUpdate();
			
			response.sendRedirect("product.jsp");
          
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
