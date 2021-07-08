package com.servlets.otp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tejas.email.Email;


@WebServlet("/OtpWithVerify")
public class OtpWithVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 
    public OtpWithVerify() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		String email=request.getParameter("email");
		Random r=new Random();
		int randomnumber=r.nextInt(8999)+1000;
		Email em=new Email(email,"Verification OTP","OTP :"+randomnumber+". This is your one time Password(OTP). Plaease enter the OTP to proceed. Thank you");
		em.sendEmail();
		HttpSession hs=request.getSession();
		hs.setAttribute("randomnumber", randomnumber);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
