package com.lake.camping;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out= response.getWriter();
		
		Connection con = null;
		PreparedStatement ps =  null;
		ResultSet rs=null;
		
		String DB_URL = "jdbc:postgresql://localhost/ajdb19";
		String DB_USER = "postgres";
		String DB_PWD = "Root";
		
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(DB_URL,DB_USER,DB_PWD);
			
			   String user = request.getParameter("username");
		        String pass = request.getParameter("password");
		        
		            	  ps = con.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)");
		            	  
		            	  ps.setString(1, user);
		            	  ps.setString(2, pass);
		            	  
		            	  ps.executeUpdate();
		            	  
		            	  response.sendRedirect("Main.jsp");
		            	  
		   
		            rs.close();
		            con.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
	}

	

}
