package com.servlets.users;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.util.DatabaseConnection;
import com.jdbc.util.TrippleDes;
import com.tejas.model.User;

@WebServlet(urlPatterns = "/SignIn")
public class SignIn extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
     
	static Connection con = DatabaseConnection.getConnection(); 
    public SignIn() 
    {
        super();
    } 
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	PrintWriter out=response.getWriter();
    	User u=new User();
    	u.setUsername(request.getParameter("username")); 
    	
		
    	try 
    	{
    
    		 
    		TrippleDes td= new TrippleDes();
			String password=td.encrypt(request.getParameter("password"));
			u.setPassword(password);
			PreparedStatement pt= con.prepareStatement("select * from users where username=? and password=?");
			pt.setString(1, u.getUsername());
			pt.setString(2, password);
			ResultSet rs=pt.executeQuery();
			
			if(rs.next()) 
			{
				u.setEmail(rs.getString("email"));
				u.setRole(rs.getString("role"));
				u.setUid(rs.getInt("uid"));
				
				HttpSession hs=request.getSession();
				hs.setMaxInactiveInterval(60*2);
				hs.setAttribute("email", rs.getString("email"));
				hs.setAttribute("username", rs.getString("username"));
				hs.setAttribute("role", rs.getString("role"));
				hs.setAttribute("u", u);
				
				PreparedStatement ct= con.prepareStatement("select count(*) as item from cart where (order_status='notOrdered') AND uid=?");
				ct.setInt(1, u.getUid());
				ResultSet rs1=ct.executeQuery();
				if(rs1.next())
				{
					int c=Integer.parseInt(rs1.getString("item"));
					hs.setAttribute("count",c);
				}
				
				Cookie ck1=new Cookie("un", u.getUsername());
				Cookie ck2=new Cookie("pwd", u.getPassword());
				
				ck1.setMaxAge(30);
				ck2.setMaxAge(30);
				
				response.addCookie(ck1);
				response.addCookie(ck2);
				out.println(""
						+ "<script>"
						+ "alert('Welcome "+u.getUsername()+"');"
						+ "window.location='product.jsp';"
						+ "</script>");
			}
			else
			{
				out.println(""
						+ "<script>"
						+ "alert('Incorrect username or password');"
						+ "window.location='login.jsp';"
						+ "</script>");
			}
			
	
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
