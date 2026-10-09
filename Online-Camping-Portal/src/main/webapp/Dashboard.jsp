<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%
	if (request.getAttribute("totalBookings") == null && request.getAttribute("dbError") == null) {
		response.sendRedirect(request.getContextPath() + "/Dashboard");
		return;
	}
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Admin Dashboard</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
		.stat-value {
			font-size: 2.5rem;
			font-weight: bold;
			color: #dc3545;
			line-height: 1.2;
			min-height: 3rem;
		}
	</style>
</head>
<body>

<%@ include file="AdminHeader.jsp" %>

<div class="container" style="margin-top: 100px;">
	<h2 class="text-center mb-5 text-primary">Dashboard Overview</h2>

	<% if (request.getAttribute("dbError") != null) { %>
		<div class="alert alert-danger text-center" role="alert">
			Database connection failed: <%= request.getAttribute("dbError") %>
		</div>
	<% } %>

	<div class="row justify-content-center g-4">
		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="card h-100 shadow-sm">
				<div class="card-body border border-black p-4 bg-primary-subtle text-center">
					<h5 class="card-title text-danger-emphasis mb-3">Logins</h5>
					<div class="stat-value">${totalLogins != null ? totalLogins : 0}</div>
				</div>
			</div>
		</div>

		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="card h-100 shadow-sm">
				<div class="card-body border border-black p-4 bg-primary-subtle text-center">
					<h5 class="card-title text-danger-emphasis mb-3">Bookings</h5>
					<div class="stat-value">${totalBookings != null ? totalBookings : 0}</div>
				</div>
			</div>
		</div>

		<div class="col-sm-6 col-md-4 col-lg-3">
			<div class="card h-100 shadow-sm">
				<div class="card-body border border-black p-4 bg-primary-subtle text-center">
					<h5 class="card-title text-danger-emphasis mb-3">Enquiries</h5>
					<div class="stat-value">${totalEnquiries != null ? totalEnquiries : 0}</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
