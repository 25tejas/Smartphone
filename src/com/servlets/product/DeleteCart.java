package com.servlets.product;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.util.DatabaseConnection;
import com.tejas.model.User;


@WebServlet(name = "deletecart",urlPatterns = "/DeleteCart")
public class DeleteCart extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	static Connection con = DatabaseConnection.getConnection();  
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	HttpSession hs  = request.getSession();
    	int uid = ((User)hs.getAttribute("u")).getUid();
    	int id=Integer.parseInt(request.getParameter("id")); 
    	try 
    	{
			PreparedStatement pt= con.prepareStatement("update cart set order_status='deleted' where cartid=?");
			
            pt.setInt(1, id);
            pt.executeUpdate();
  
            PreparedStatement ct= con.prepareStatement("select count(*) as item from cart where (order_status='notOrdered') AND uid=?");
			ct.setInt(1, uid);
			ResultSet rs1=ct.executeQuery();
			if(rs1.next())
			{
				int c=Integer.parseInt(rs1.getString("item"));
				hs.setAttribute("count",c);
			}
			
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
