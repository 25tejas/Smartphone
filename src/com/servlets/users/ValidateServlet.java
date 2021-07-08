package com.servlets.users;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ValidateServlet")
public class ValidateServlet extends HttpServlet 
{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String value=req.getParameter("value");
		String id=req.getParameter("id");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/osps","root","root"); 
			PreparedStatement ps=con1.prepareStatement("select * from detail where "+id+"=?");
			ps.setString(1, value);
			ResultSet rs=ps.executeQuery();
			
			PrintWriter out=resp.getWriter();
			if(rs.next())
			{
				con1.close();
				out.println(id+" is already exist");
			}
			con1.close();
		}
		catch(Exception e) 
		{
			PrintWriter out=resp.getWriter();
			out.println(e);
		}
	}
}
