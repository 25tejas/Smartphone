package com.servlets.product;
import java.io.IOException;

import java.io.InputStream;
import java.sql.Connection;

import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.jdbc.util.DatabaseConnection; 
@WebServlet("/AddImage")
@MultipartConfig(maxFileSize = 9999999999L)
public class AddImage extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
	static Connection con = DatabaseConnection.getConnection(); 
    public AddImage() 
    {
        super();
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		Part part1=request.getPart("image1");
		Part part2=request.getPart("image2");
		InputStream is1=part1.getInputStream();
		InputStream is2=part2.getInputStream();
		try
		{ 
			PreparedStatement ps=con.prepareStatement("update product set image1=?,image2=? ");
			ps.setBlob(1, is1);
			ps.setBlob(2, is2);
			ps.executeUpdate();
			System.out.println("images updated succesfully");
			response.sendRedirect("updateImage.jsp");
			
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
