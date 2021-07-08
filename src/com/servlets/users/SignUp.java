package com.servlets.users;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.util.DatabaseConnection;
import com.jdbc.util.TrippleDes;
import com.tejas.email.Email;

@WebServlet(urlPatterns = "/SignUp")
public class SignUp extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	static Connection con = DatabaseConnection.getConnection(); 
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String username=req.getParameter("username");
		String email=req.getParameter("email");
		String password1= req.getParameter("password");
		
		 
		
			try
			{
				TrippleDes td= new TrippleDes();
				String password=td.encrypt(password1);
				PreparedStatement ps=con.prepareStatement("insert into users(username,email,password,role) values(?,?,?,?)");
				ps.setString(1, username);
				ps.setString(2, email);
				ps.setString(3, password);
				ps.setString(4, "user");
				ps.executeUpdate();
				
				resp.sendRedirect("login.jsp");
				Email em=new Email(email,"Registerd Successfully!!!", "Welcome to Phone Website!!!");
				em.sendEmail();
		
			} 
			catch (Exception e) 
			{
				System.out.println(e.getLocalizedMessage());
			}
		
		
		
		
	}
}
