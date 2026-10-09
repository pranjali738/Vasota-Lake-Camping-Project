package com.lake.camping;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ProcessPayment")
public class ProcessPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final String DB_URL = "jdbc:postgresql://localhost/ajdb19";
	private static final String DB_USER = "postgres";
	private static final String DB_PWD = "Root";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookingIdParam = request.getParameter("bookingId");
		String paymentMethod = request.getParameter("paymentMethod");
		String amountParam = request.getParameter("amount");

		if (paymentMethod == null || paymentMethod.isBlank()) {
			request.setAttribute("paymentMessage", "Please select a payment method.");
			request.getRequestDispatcher("Thankyou.jsp").forward(request, response);
			return;
		}

		int bookingId = 0;
		int amount = 0;

		try {
			bookingId = Integer.parseInt(bookingIdParam);
			amount = Integer.parseInt(amountParam);
		} catch (NumberFormatException e) {
			request.setAttribute("paymentMessage", "Invalid booking/payment details.");
			request.getRequestDispatcher("Thankyou.jsp").forward(request, response);
			return;
		}

		String paymentStatus = "PAID";
		String message = "Payment successful via " + paymentMethod.toUpperCase()
				+ ". Booking ID " + bookingId + " is confirmed for Rs. " + amount + ".";

		try {
			Class.forName("org.postgresql.Driver");
			try (Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PWD)) {
				updateBookingPayment(con, bookingId, paymentMethod, paymentStatus);
			}
		} catch (SQLException sqlEx) {
			if (!isMissingColumnError(sqlEx)) {
				message = "Booking exists, but payment could not be saved. Please contact support.";
			}
		} catch (Exception e) {
			message = "Payment could not be completed due to server error.";
		}

		request.setAttribute("paymentMessage", message);
		request.getRequestDispatcher("PaymentStatus.jsp").forward(request, response);
	}

	private void updateBookingPayment(Connection con, int bookingId, String paymentMethod, String paymentStatus)
			throws SQLException {
		String qry = "UPDATE bookings SET payment_method = ?, payment_status = ? WHERE id = ?";
		try (PreparedStatement ps = con.prepareStatement(qry)) {
			ps.setString(1, paymentMethod.toUpperCase());
			ps.setString(2, paymentStatus);
			ps.setInt(3, bookingId);
			ps.executeUpdate();
		}
	}

	private boolean isMissingColumnError(SQLException ex) {
		String msg = ex.getMessage();
		return msg != null && msg.toLowerCase().contains("column") && msg.toLowerCase().contains("does not exist");
	}
}
