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

@WebServlet(name="ImageServlet1",urlPatterns = "/ImageServlet1")
public class ImageServlet1 extends HttpServlet 
{

	private static final long serialVersionUID = 1L;
	static Connection con = DatabaseConnection.getConnection(); 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		int id=Integer.parseInt(req.getParameter("id"));//1
		try
		{
			
			PreparedStatement ps=con.prepareStatement("select image1 from product where pid=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				Blob blob=rs.getBlob("image1");
				byte arr1[]=blob.getBytes(1, (int)blob.length());
				resp.getOutputStream().write(arr1);
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
