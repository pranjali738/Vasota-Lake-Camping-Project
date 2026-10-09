package com.lake.camping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		
		
		Connection con = null;
		PreparedStatement ps =  null;
		
		String DB_URL = "jdbc:postgresql://localhost/ajdb19";
		String DB_USER = "postgres";
		String DB_PWD = "Root";
		
		
		String message = "";
		
		try
		{
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(DB_URL,DB_USER,DB_PWD);
			
			String name= request.getParameter("uname");
			String email = request.getParameter("email");
			String msg = request.getParameter("msg");
			
			ps = con.prepareStatement("insert into contact(name,email,message) values(?,?,?)");
			ps.setString(1,  name);
			ps.setString(2,  email);
			ps.setString(3, msg);
			
			ps.executeUpdate();
			
			message = "Thank you, " + name +  " Your message has been sent. We will contact you soon..!";
			
			con.close();
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		request.setAttribute("msg", message);
		
		RequestDispatcher rd = request.getRequestDispatcher("Contact.jsp");
		rd.forward(request, response);
	}

}
