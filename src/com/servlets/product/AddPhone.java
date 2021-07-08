package com.servlets.product;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.jdbc.util.DatabaseConnection;

@WebServlet("/AddPhone")
@MultipartConfig(maxFileSize = 9999999999L)
public class AddPhone extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
       
	static Connection con = DatabaseConnection.getConnection(); 
    public AddPhone() 
    {
        super();
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String modelno=request.getParameter("modelno");
		String price=request.getParameter("price");
		String description=request.getParameter("description");
		Part part=request.getPart("image");
		InputStream is=part.getInputStream();
		int qty=Integer.parseInt(request.getParameter("qty"));
		try
		{ 
			Class.forName("com.mysql.jdbc.Driver");
			 
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/osps","root","root");
			PreparedStatement ps=con.prepareStatement("insert into product(brandname,modelno,price,image,qty,description, availability) values(?,?,?,?,?,?,?)");
			ps.setString(1, "Realme");
			ps.setString(2, modelno);
			ps.setString(3, price);
			ps.setBlob(4, is);
			ps.setInt(5, qty);
			ps.setString(6,description);
			ps.setString(7,"A");
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
