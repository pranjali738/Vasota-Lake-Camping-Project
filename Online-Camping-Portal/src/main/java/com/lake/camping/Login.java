package com.lake.camping;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Login")
public class Login extends HttpServlet {
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
		String message="";
		
	
		
		
		
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(DB_URL,DB_USER,DB_PWD);
			
			   String user = request.getParameter("username");
		        String pass = request.getParameter("password");
		        
		       
		            if (user.equals("admin") && pass.equals("Admin"))
		            {
		                response.sendRedirect("Dashboard"); 
		                
		            } 
		            else
		            {
		            	  ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
		            	  
		            	  ps.setString(1, user);
		            	  ps.setString(2, pass);
		            	  
		            	  rs = ps.executeQuery();
		            	  
		            	  if (rs.next()) 
		                    {
		            		  	
		                        response.sendRedirect("Main.jsp"); // Redirect normal user
		                    } 
		                    else 
		                    {
		                    	message= "Invalid Username and Passwords Please Try Again !";
		                    	request.setAttribute("msg", message);
		                		
		                		RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		                		rd.forward(request, response);
		                		
		                    }
		            }
		        
		            rs.close();
		            con.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
	}

}
