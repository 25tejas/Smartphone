package com.servlets.product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.util.DatabaseConnection;

@WebServlet(name="ImageServlet2",urlPatterns = "/ImageServlet2")
public class ImageServlet2 extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	static Connection con = DatabaseConnection.getConnection(); 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		int id=Integer.parseInt(req.getParameter("id"));//1
		try
		{
			PreparedStatement ps=con.prepareStatement("select image2 from product where pid=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				Blob blob=rs.getBlob("image2");
				byte arr2[]=blob.getBytes(1, (int)blob.length());
				resp.getOutputStream().write(arr2);
			}
		}
		catch(Exception e)
		{
			
			PrintWriter out=resp.getWriter();
			out.print(e);
			
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
}
