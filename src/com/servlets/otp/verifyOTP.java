package com.servlets.otp;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class verifyOTP
 */
@WebServlet("/verifyOTP")
public class verifyOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public verifyOTP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int userotp=Integer.parseInt(request.getParameter("otp"));//entered by user
		
		HttpSession hs=request.getSession();
		int yourotp=(Integer)hs.getAttribute("randomnumber");//your otp saved in session
		
		PrintWriter out=response.getWriter();
		if(userotp==yourotp)
		{
			out.println(""
					+ "<script>"
					+ "alert('Correct OTP');"
					+ "window.location='changePassword.jsp';"
					+ "</script>");
		}
		else
		{
			out.println(""
					+ "<script>"
					+ "alert('INCorrect OTP');"
					+ "window.location='getOTP.jsp';"
					+ "</script>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
