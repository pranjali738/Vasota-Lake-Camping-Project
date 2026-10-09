package com.lake.camping;

import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailUtil {

	private EmailUtil() {
	}

	/**
	 * Option 1 (no environment variables): set SMTP details here.
	 * For Gmail you must use an "App Password" (not your normal password).
	 */
	private static final String SMTP_HOST = "smtp.gmail.com";
	private static final String SMTP_PORT = "587";
	private static final String SMTP_USERNAME = "YOUR_EMAIL_HERE@gmail.com";
	private static final String SMTP_PASSWORD = "YOUR_APP_PASSWORD_HERE";
	private static final String SMTP_FROM_EMAIL = "YOUR_EMAIL_HERE@gmail.com";

	public static boolean sendBookingConfirmation(
			String toEmail,
			String customerName,
			int bookingId,
			String arrivalDate,
			String departureDate,
			String tentName,
			int persons,
			int kids,
			int totalCost) {

		// Prefer environment variables if present; otherwise use the constants above.
		String host = getEnv("SMTP_HOST", SMTP_HOST);
		String port = getEnv("SMTP_PORT", SMTP_PORT);
		String username = getEnv("SMTP_USERNAME", SMTP_USERNAME);
		String password = getEnv("SMTP_PASSWORD", SMTP_PASSWORD);
		String fromEmail = getEnv("SMTP_FROM_EMAIL", SMTP_FROM_EMAIL);

		if (username.isBlank() || password.isBlank() || fromEmail.isBlank() || toEmail == null || toEmail.isBlank()) {
			return false;
		}

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);

		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
			message.setSubject("Camping Booking Confirmation - #" + bookingId);

			String content = "Hello " + customerName + ",\n\n"
					+ "Your booking is confirmed.\n\n"
					+ "Booking ID: " + bookingId + "\n"
					+ "Arrival Date: " + arrivalDate + "\n"
					+ "Departure Date: " + departureDate + "\n"
					+ "Tent Type: " + tentName + "\n"
					+ "No. of Persons: " + persons + "\n"
					+ "No. of Kids: " + kids + "\n"
					+ "Total Amount: Rs. " + totalCost + "\n\n"
					+ "Thank you for choosing Vasota Lake Camping.";

			message.setText(content);
			Transport.send(message);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private static String getEnv(String key, String defaultValue) {
		String value = System.getenv(key);
		return (value == null || value.isBlank()) ? defaultValue : value;
	}
}
