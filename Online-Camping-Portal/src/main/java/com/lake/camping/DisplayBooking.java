package com.lake.camping;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lake.entities.BookingEntities;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;




@WebServlet("/DisplayBooking")
public class DisplayBooking extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		final String DB_URL = "jdbc:postgresql://localhost/ajdb19";
		final String DB_USER = "postgres";
		final String DB_PWD = "Root";

		List<BookingEntities> bookings = new ArrayList<>();
		String qry = "select * from bookings";

		try {
			Class.forName("org.postgresql.Driver");

			try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD);
					PreparedStatement ps = con.prepareStatement(qry);
					ResultSet rs = ps.executeQuery()) {

				while (rs.next()) {
					int id = rs.getInt("id");
					String name = rs.getString("name");
					String email = rs.getString("email");
					long phone = rs.getLong("phone");
					int persons = rs.getInt("no_of_persons");
					int kids = rs.getInt("no_of_kids");
					String arrival = rs.getString("arrival_date");
					String depture = rs.getString("departure_date");
					int tentId = rs.getInt("tent_id");

					String tentName = null;
					try (PreparedStatement psTent = con.prepareStatement(
							"select tent_name from tents where tent_id = ?")) {
						psTent.setInt(1, tentId);
						try (ResultSet rsTent = psTent.executeQuery()) {
							if (rsTent.next()) {
								tentName = rsTent.getString(1);
							}
						}
					}

					BookingEntities b = new BookingEntities(id, name, email, phone, persons, kids, arrival, depture, tentName);
					bookings.add(b);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Always set the attribute (empty list => "No Data Found" in JSP)
		request.setAttribute("listofstudents", bookings);
		RequestDispatcher rd = request.getRequestDispatcher("DisplayBooking.jsp");
		rd.forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	
	
	
	
	
	

}
