package com.servlets.otp;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.util.DatabaseConnection;
import com.tejas.email.Email;


@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static Connection con = DatabaseConnection.getConnection(); 
    public ChangePassword() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String pass=request.getParameter("pass");
		String cpass=request.getParameter("cpass");
		String emailid=((String)request.getSession().getAttribute("email"));
		String username=((String)request.getSession().getAttribute("username"));
		
		PrintWriter out=response.getWriter();
		if(pass.equals(cpass))
		{
			try
			{
				
				PreparedStatement ps=con.prepareStatement("update detail set password=? where email=?");
				ps.setString(1, pass);
				ps.setString(2, emailid);
				ps.executeUpdate();
				
				out.println(""
						+ "<script>"
						+ "alert('Your password is changed succesfully!!!');"
						+ "window.location='login.jsp';"
						+ "</script>");
				Email em=new Email(emailid,"Your Password ","Dear "+username+", Your Password changed successfully..!. Your new password is "+pass+". Thank you");
				em.sendEmail();
			}
			catch (Exception e) 
			{
				System.out.println(e);
			}
		}
		else
		{
			out.println(""
					+ "<script>"
					+ "alert('Password and confirm password are not same!!!');"
					+ "window.location='changePassword.jsp';"
					+ "</script>");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
