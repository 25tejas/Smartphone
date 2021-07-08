package com.servlets.otp;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.util.DatabaseConnection;
import com.tejas.email.Email;


@WebServlet("/OTPsend")
public class OTPsend extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	static Connection con = DatabaseConnection.getConnection(); 
    public OTPsend()
    {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		try
		{
			
			PreparedStatement pt= con.prepareStatement("select * from detail where email=?");
			pt.setString(1, email);
			ResultSet rs=pt.executeQuery();
			if(rs.next())
			{
				Random r=new Random();
				int randomnumber=r.nextInt(8999)+1000; 
				
				HttpSession hs=request.getSession();
				hs.setAttribute("randomnumber", randomnumber);
				hs.setAttribute("email", email);
				hs.setAttribute("username", rs.getString("username"));
				
				Email em=new Email(email,"Password Reset?","Dear "+rs.getString("username")+", "+randomnumber+" is your one time Password(OTP). Plaease enter the OTP to proceed. Thank you");
				em.sendEmail();
				
				out.println(""
						+ "<script>"
						+ "alert('Otp have been sent to your email account. Please check');"
						+ "window.location='getOTP.jsp';"
						+ "</script>");
			}
			else
			{
				out.println(""
						+ "<script>"
						+ "alert('Your email id is not registered');"
						+ "window.location='forgotpassword.jsp';"
						+ "</script>");
			}
		}
		catch(Exception e)
		{
			
		}
			
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
