package com.servlets.users;

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
import com.tejas.model.User;

@WebServlet("/AddAddress")
public class AddAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Connection con = DatabaseConnection.getConnection(); 
    public AddAddress() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		HttpSession session=request.getSession();
		int uid=((User)session.getAttribute("u")).getUid();
		String name=request.getParameter("name");
		String mobile=request.getParameter("mobile");
		String pincode=request.getParameter("pincode");
		String house=request.getParameter("house");  
		String area=request.getParameter("area");
		String landmark=request.getParameter("landmark");  
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String type=request.getParameter("type");
		
		
		try {
		PreparedStatement ps=con.prepareStatement("insert into address(uid,name,mobile,pincode,house,area,landmark,city,state,type) values(?,?,?,?,?,?,?,?,?,?)");
		ps.setInt(1, uid);
		ps.setString(2, name);
		ps.setString(3, mobile);
		ps.setString(4, pincode);
		ps.setString(5, house);
		ps.setString(6, area);
		ps.setString(7, landmark);
		ps.setString(8, city);
		ps.setString(9, state);
		ps.setString(10, type);
		
		ps.executeUpdate();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		doGet(request, response);
	}

}
