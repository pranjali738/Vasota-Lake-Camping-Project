package com.lake.camping;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Dashboard")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String DB_URL = "jdbc:postgresql://localhost/ajdb19";
	private static final String DB_USER = "postgres";
	private static final String DB_PWD = "Root";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int totalBookings = 0;
		int totalLogins = 0;
		int totalEnquiries = 0;
		String dbError = null;

		try {
			Class.forName("org.postgresql.Driver");

			try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD)) {
				totalBookings = countRows(con, "SELECT COUNT(*) FROM bookings");
				totalLogins = countRows(con, "SELECT COUNT(*) FROM users");
				totalEnquiries = countRows(con, "SELECT COUNT(*) FROM contact");
			}
		} catch (Exception e) {
			dbError = e.getMessage();
			e.printStackTrace();
		}

		request.setAttribute("totalBookings", totalBookings);
		request.setAttribute("totalLogins", totalLogins);
		request.setAttribute("totalEnquiries", totalEnquiries);
		request.setAttribute("dbError", dbError);

		request.getRequestDispatcher("Dashboard.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private int countRows(Connection con, String query) throws Exception {
		try (PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery()) {
			if (rs.next()) {
				return rs.getInt(1);
			}
		}
		return 0;
	}
}
