package com.servlets.product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.util.DatabaseConnection;
import com.jdbc.util.TrippleDes;
import com.tejas.email.Email;
import com.tejas.model.User;

@WebServlet("/AddReview")
public class AddReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con = DatabaseConnection.getConnection(); 
    
    public AddReview() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession hs=request.getSession();
		int pid=Integer.parseInt(request.getParameter("pid"));
		String review=request.getParameter("review");
		int point=Integer.parseInt(request.getParameter("star"));
		int uid = ((User)hs.getAttribute("u")).getUid();
		String username = ((User)hs.getAttribute("u")).getUsername();

		
			try
			{
				PreparedStatement ps=con.prepareStatement("insert into review(pid,rating,uid,username,review) values(?,?,?,?,?)");
				ps.setInt(1, pid);
				ps.setInt(2, point);
				ps.setInt(3, uid);
				ps.setString(4, username);
				ps.setString(5, review);
				ps.executeUpdate();
				response.sendRedirect("phone.jsp?id="+pid);
		
			} 
			catch (Exception e) 
			{
				System.out.println(e.getLocalizedMessage());
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		doGet(request, response);
	}

}
