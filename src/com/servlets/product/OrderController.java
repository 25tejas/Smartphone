package com.servlets.product;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.instamojo.wrapper.api.ApiContext;
import com.instamojo.wrapper.api.Instamojo;
import com.instamojo.wrapper.api.InstamojoImpl;
import com.instamojo.wrapper.model.PaymentOrder;
import com.instamojo.wrapper.model.PaymentOrderResponse;
import com.jdbc.util.DatabaseConnection;
import com.tejas.model.User;

@WebServlet("/OrderController")
public class OrderController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	static Connection con = DatabaseConnection.getConnection(); 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{	
		HttpSession hs  = req.getSession();
		int uid = ((User)hs.getAttribute("u")).getUid();
		int id=Integer.parseInt(req.getParameter("id"));
		int qty=Integer.parseInt(req.getParameter("qty"));
		int pid=Integer.parseInt(req.getParameter("pid"));
		int price=Integer.parseInt(req.getParameter("price"));
		
		String emailid=((User)hs.getAttribute("u")).getEmail();
		String username=((User)hs.getAttribute("u")).getUsername();
		try 
	       {
	           ApiContext context = ApiContext.create("test_RDf65b0U8TgIXtY4MswVRGkI5NPLtcMiSBr", "test_BHUqoRtbzOOjQeNayR6G6SKUTmW9TwkWx4Yl9E76K5HbaOVkE6fHDFLHNuGbYWyoQw4I3rWinc6ge3pHJvIroaBiSyYAhBTw8yDCklrhOFyPLK31eSq2ia6vXJm", ApiContext.Mode.TEST);
	           Instamojo api = new InstamojoImpl(context);

	           PaymentOrder order = new PaymentOrder();
	           order.setName(username);
	           order.setEmail(emailid);
	           order.setPhone("8080388053");
	           order.setCurrency("INR");
	           order.setAmount((double)price);
	           order.setDescription("Buying Realme Smartphone");
	           order.setRedirectUrl("https://www.google.com");
	           order.setWebhookUrl("https://www.google.com");
	           order.setTransactionId(UUID.randomUUID().toString());

	           PaymentOrderResponse paymentOrderResponse = api.createPaymentOrder(order);
	           resp.sendRedirect(paymentOrderResponse.getPaymentOptions().getPaymentUrl());
	       }
	       catch (Exception e) 
	       {
	           System.out.println(e);
	       }
		try
		{ 
			
			PreparedStatement ps=con.prepareStatement("update cart set order_status='Ordered' where cartid=?");
			ps.setInt(1, id);
			ps.executeUpdate();
			PreparedStatement ps1=con.prepareStatement("update product set qty=qty-? where pid=?");
			ps1.setInt(1, qty);
			ps1.setInt(2, pid);
			ps1.executeUpdate();
			PreparedStatement ct= con.prepareStatement("select count(*) as item from cart where (order_status='notOrdered')  AND uid=?");
			ct.setInt(1, uid);
			ResultSet rs1=ct.executeQuery();
			if(rs1.next())
			{
				int c=Integer.parseInt(rs1.getString("item"));
				hs.setAttribute("count",c);
			}
		} 
		catch (Exception e) 
		{
			System.out.println(e);
		}

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
