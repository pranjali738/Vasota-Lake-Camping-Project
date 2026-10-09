<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vasota Camping Portal</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	text-align: center;
}

.container {
	max-width: 500px;
	margin: 30px auto;
	background: rgb(153, 204, 248);
	padding: 40px;
	border-radius: 10px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
}

h2 {
	color: #333;
}

label {
	display: block;
	text-align: left;
	font-weight: bold;
	margin: 10px 0 5px;
}

input, select, button {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
}

button {
	background-color: #007bff;
	color: white;
	cursor: pointer;
	border: none;
	font-size: 18px;
}

button:hover {
	background-color: #0056b3;
}

.message {
	margin-top: 10px;
	color: green;
	font-weight: bold;
}
</style>
 <script>
        function setMinDates() {
            let today = new Date().toISOString().split('T')[0];
            document.getElementById("arrivals").min = today;
            document.getElementById("departure").min = today;
        }

        function updateDepartureDate() {
            let arrivalDate = document.getElementById("arrivals").value;
            document.getElementById("departure").min = arrivalDate;
        }
        
        function validateForm(event) {
            let name = document.getElementById("name").value;
            let personCount = document.getElementById("adult").value;
            let kidsCount = document.getElementById("kids").value;
            let nameRegex = /^[A-Za-z\s]+$/;

            if (!nameRegex.test(name)) {
                alert("Full Name should contain only letters and spaces.");
                event.preventDefault();
                return false;
            }

            if (personCount < 0 || kidsCount < 0) {
                alert("Number of persons and kids cannot be negative.");
                event.preventDefault();
                return false;
            }

            return true;
        }
    </script>
    
</head>
<body onload="setMinDates()">
	<div class="container">
		<h2>Book Your Camping</h2>

		<form id="bookingForm" method="POST" action="./Bookings ">
			<label for="name">Full Name</label>
			<input type="text" id="name" name="uname" placeholder="Enter your name" required> 
			
			<label for="email">Email</label> 
			<input type="email" id="email" name="email" placeholder="Enter your email" required>
			
			<label for="phone">Phone Number</label> 
			<input type="tel" id="phone" name="phoneNo" placeholder="Enter your phone number" required pattern="[0-9]{10}"> 
			
			<label for="adult">No. Of Persons</label>
			<input type="number" id="adult" name="NoPersons" placeholder="Enter no. of adults" required min="1">
			
			 <label for="kids">No. Of Kids</label>
			 <input type="number" id="kids" name="NoKids" placeholder="Enter no. of kids" required min="0">
			 
			  <label for="date">Arrival Date</label>
			   <input type="date" id="arrivals" name="arrivals" onchange="updateDepartureDate()"  required> 
			   
			   <label for="date">Departure Date</label>
				 <input type="date" id="departure" name="departure"   required>

			<label for="package">Select Tent</label> 
			<select id="package" name="tent" required>
				<option value="101">Regular Tent</option>
				<option value="102">Triangle Tent</option>
				<option value="103">Machan Cottage</option>
				<option value="104">Elevator Cottage</option>
				<option value="105">Glamping</option>
				<option value="106">Ultra Luxury Cottage</option>
			</select>

			<button type="submit">Book Now</button>
		</form>

		<p class="message" id="confirmationMessage"></p>
	</div>
	



	
    

</body>
</html>