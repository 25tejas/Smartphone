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

@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ValidateOtp() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		int otp=Integer.parseInt(request.getParameter("otp"));
		HttpSession hs=request.getSession();
		int userotp=(Integer) hs.getAttribute("randomnumber");
		PrintWriter out=response.getWriter();
		if(userotp==otp)
		{
			out.println("otp is verified");
		}else{
			out.println("otp not matched");
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}

}
