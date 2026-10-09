package com.lake.camping;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lake.entities.Contact;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/DisplayContact")
public class DisplayContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		Connection con = null;
		PreparedStatement ps=null;
		ResultSet rs = null;
		
		final String DB_URL = "jdbc:postgresql://localhost/ajdb19";
		final String DB_USER= "postgres";
		final String DB_PWD = "Root";
		
		String qry = "SELECT * FROM contact";
		
		List<Contact> L =  new ArrayList<Contact>();
		
		
		try
		{
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
			ps = con.prepareStatement(qry);
			rs = ps.executeQuery(); 
			
			
						
			while(rs.next())
			{
				String name = rs.getString("name");
				String email = rs.getString("email");
				String message = rs.getString("message");
				
				Contact C = new Contact(name , email , message);
					
				L.add(C);
				request.setAttribute("Contact", L);
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		finally
		{
			try
			{
				rs.close();
				con.close();
				
				
			}
			catch(Exception e)
			{
				e.printStackTrace();
				
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher("DisplayContact.jsp");
        rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request,response);
		
	}
	
	
	
}

