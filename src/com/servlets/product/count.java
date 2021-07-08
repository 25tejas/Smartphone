package com.servlets.product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.util.DatabaseConnection;

public class count extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	static Connection con = DatabaseConnection.getConnection(); 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try
		{
			
			String username=((String)req.getSession().getAttribute("username"));
			PreparedStatement ct= con.prepareStatement("select count(*) as item from cart where (order_status='notOrdered' AND deleted='no') AND username=?");
			ct.setString(1, username);
			ResultSet rs=ct.executeQuery();
			
			PrintWriter out=resp.getWriter();
			if(rs.next())
			{
				String c=rs.getString("item");
				out.println(c);
			}
		}
		catch(Exception e) 
		{
			PrintWriter out=resp.getWriter();
			out.println(e);
		}
	}
}
