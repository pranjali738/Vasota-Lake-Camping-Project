package com.lake.camping;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Bookings")
public class Bookings extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int MAX_BOOKINGS_PER_TENT = 5;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html");
		
		Connection con = null;
		PreparedStatement ps =  null;
		ResultSet rs = null;
		
		String DB_URL = "jdbc:postgresql://localhost/ajdb19";
		String DB_USER = "postgres";
		String DB_PWD = "Root";
		
		PrintWriter out= response.getWriter();
		
		String message="";
		int totalCost = 0;
		int bookingId = 0;
		String emailStatusMessage = "";
		boolean bookingFull = false;
		
		
		try {
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(DB_URL,DB_USER,DB_PWD);
			
			String name= request.getParameter("uname");
			
			String email = request.getParameter("email");
			
			long phone = Long.parseLong(request.getParameter("phoneNo"));
			
			int no_of_persons = Integer.parseInt(request.getParameter("NoPersons"));
			
			int no_of_kids = Integer.parseInt(request.getParameter("NoKids"));
			
			String arrival_date = request.getParameter("arrivals");
			
			String departure_date = request.getParameter("departure");
			
			int tent_type = Integer.parseInt(request.getParameter("tent"));
			
			
			Date sqlArrivalDate = Date.valueOf(arrival_date);		
			Date sqlDepartureDate = Date.valueOf(departure_date);		
			
			ps = con.prepareStatement(
					"SELECT COUNT(*) FROM bookings WHERE tent_id = ? AND arrival_date < ? AND departure_date > ?");
			ps.setInt(1, tent_type);
			ps.setDate(2, sqlDepartureDate);
			ps.setDate(3, sqlArrivalDate);
			rs = ps.executeQuery();
			
			int existingBookings = 0;
			if (rs.next()) {
				existingBookings = rs.getInt(1);
			}
			
			if (existingBookings >= MAX_BOOKINGS_PER_TENT) {
				bookingFull = true;
				message = "Sorry, bookings are full for the selected tent and dates. Please choose different dates or another tent type.";
			}
			
			if (!bookingFull) {
			ps = con.prepareStatement("insert into bookings(name,email,phone,no_of_persons,no_of_kids,arrival_date,departure_date,tent_id) values(?,?,?,?,?,?,?,?)",
					Statement.RETURN_GENERATED_KEYS);
			
			
			
			ps.setString(1,  name);
			ps.setString(2,  email);
			ps.setLong(3, phone);
			ps.setInt(4, no_of_persons);
			ps.setInt(5, no_of_kids);
			ps.setDate(6, sqlArrivalDate);
			ps.setDate(7, sqlDepartureDate);
			ps.setInt(8, tent_type);
		
			ps.executeUpdate();
			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				bookingId = rs.getInt(1);
			}
		
			//con.close();
			
			ps = con.prepareStatement("select tent_name, tent_price from tents where tent_id = ?");
			ps.setInt(1, tent_type);
			rs = ps.executeQuery();
			
			int tentPrice = 0;
			String tentName = "";
			if(rs.next())			
			{
				tentName = rs.getString("tent_name");
				tentPrice = rs.getInt("tent_price");
			}
			

            if (no_of_persons > 0) 
            {
                totalCost = no_of_persons * tentPrice;
                
                message="Thank You "+ name + " Your Camping trip is Booked for " + arrival_date + " for "+ no_of_persons + " people and " + no_of_kids + " kids. Your total price is " + totalCost + ".";      		   
                boolean mailSent = EmailUtil.sendBookingConfirmation(
                		email,
                		name,
                		bookingId,
                		arrival_date,
                		departure_date,
                		tentName,
                		no_of_persons,
                		no_of_kids,
                		totalCost
                );
                emailStatusMessage = mailSent
                		? "Booking confirmation email sent to " + email + "."
                		: "Booking done, but email could not be sent right now.";
            }
			}
           
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		request.setAttribute("msg", message);
		request.setAttribute("bookingId", bookingId);
		request.setAttribute("totalCost", totalCost);
		request.setAttribute("emailStatus", emailStatusMessage);
		request.setAttribute("bookingFull", bookingFull);
		
		RequestDispatcher rd = request.getRequestDispatcher("Thankyou.jsp");
		rd.forward(request, response);
		
		
                
	}

}
