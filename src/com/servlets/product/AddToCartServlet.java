package com.servlets.product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.util.DatabaseConnection;
import com.tejas.model.User;


@WebServlet(name="AddToCartServlet",urlPatterns = "/AddToCartServlet")
public class AddToCartServlet extends HttpServlet 
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
		HttpSession hs  = req.getSession();
		int id = Integer.parseInt(req.getParameter("id"));
		int price= Integer.parseInt(req.getParameter("price"));
		int uid = ((User)hs.getAttribute("u")).getUid();
		
		try
		{
			
			PreparedStatement ps1 = con.prepareStatement("select * from cart where (order_status='notOrdered') and (phone_id=? and uid=?)");
			
			ps1.setInt(1,id);
			ps1.setInt(2,uid);
			
			ResultSet rs=ps1.executeQuery();
			if(rs.next())
			{
				PrintWriter out=resp.getWriter();
				out.println(""
						+ "<script>"
						+ "alert('item is already there in the cart. Goto cart page and check');"
						+ "window.location='cart.jsp';"
						+ "</script>");
			}
			else
			{
				
				PreparedStatement ps = con.prepareStatement("insert into cart(phone_id,uid,quantity,price,order_status) values(?,?,?,?,?)");
				ps.setInt(1, id);
				ps.setInt(2, uid);
				ps.setInt(3, 1);
				ps.setInt(4,price);
				ps.setString(5, "notOrdered");
				ps.executeUpdate();
				
				PreparedStatement ct= con.prepareStatement("select count(*) as item from cart where (order_status='notOrdered') AND uid=?");
				ct.setInt(1, uid);
				ResultSet rs1=ct.executeQuery();
				if(rs1.next())
				{
					int c=Integer.parseInt(rs1.getString("item"));
					hs.setAttribute("count",c);
				}
				PrintWriter out=resp.getWriter();
				
				out.println(""
						+ "<script>"
						+ "alert('cart item added successfully!!!');"
						+ "window.location='cart.jsp';"
						+ "</script>");
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
}