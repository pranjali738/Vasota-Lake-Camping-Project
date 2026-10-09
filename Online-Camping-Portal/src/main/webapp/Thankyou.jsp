<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You - Vasota Lake Camping</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
            padding: 50px;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
            display: inline-block;
            text-align: left;
        }

        h2 {
            color: #007bff;
            text-align: center;
        }

        .content {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .qr-container {
            text-align: center;
            margin-right: 20px;
        }

        .qr-code {
            width: 150px; /* Increased size */
            height: 150px;
            display: block;
            margin: 0 auto;
            border: 5px solid #ff9800; /* Added border for better visibility */
            border-radius: 10px;
        }

        .pay-text {
            font-size: 18px;
            font-weight: bold;
            color: #ff9800; /* Attractive Orange */
            margin-top: 8px;
            text-transform: uppercase;
            letter-spacing: 1px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .pay-text::before {
           
            font-size: 22px;
            margin-right: 8px;
        }

        .msg-container {
            display: flex;
            flex-direction: column;
        }

        p {
            font-size: 20px;
            color: red;
            font-weight: bolder;
            margin-bottom: 10px;
        }

        .payment-info {
            font-size: 16px;
            font-weight: bold;
            color: #333;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .payment-card {
            margin-top: 18px;
            padding: 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background: #f9fbff;
        }

        .payment-card h3 {
            margin: 0 0 12px 0;
            color: #0a58ca;
        }

        .payment-option {
            display: block;
            margin-bottom: 10px;
            font-size: 16px;
            color: #333;
        }

        .pay-now-btn {
            margin-top: 8px;
            padding: 10px 16px;
            border: none;
            border-radius: 6px;
            background: #198754;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

        .pay-now-btn:hover {
            background: #146c43;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        a:hover {
            background: #0056b3;
        }

        .booking-full-msg {
            font-size: 20px;
            color: #b42318;
            font-weight: bold;
            text-align: center;
            margin: 20px 0;
        }
    </style>
</head>
<body>

    <div class="container">
        <%
            Boolean isBookingFull = (Boolean) request.getAttribute("bookingFull");
            if (isBookingFull != null && isBookingFull) {
        %>
        <h2>Bookings Full</h2>
        <p class="booking-full-msg">${msg}</p>
        <div class="button-container">
            <a href="Bookings.jsp">Try Another Date or Tent</a>
            <a href="Main.jsp" style="margin-left: 10px;">Back to Home</a>
        </div>
        <%
            } else {
        %>
        <h2>Your Booking Is Confirmed!!</h2>
        <div class="content">
            <div class="qr-container">
                <img src="./images/qr.jpeg" alt="QR Code" class="qr-code">
                <div class="pay-text">PAY ON ME</div>
            </div>
            <div class="msg-container">
                <p>${msg}</p>
                <p class="payment-info">${emailStatus}</p>
                <p class="payment-info">When Your Payment is done, please send a payment screenshot to 7666692287 and @vasotalakecamping.com Gmail ID.</p>
                <div class="payment-card">
                    <h3>Choose Payment Method</h3>
                    <form method="post" action="${pageContext.request.contextPath}/ProcessPayment">
                        <input type="hidden" name="bookingId" value="${bookingId}">
                        <input type="hidden" name="amount" value="${totalCost}">
                        <label class="payment-option"><input type="radio" name="paymentMethod" value="UPI" required> UPI</label>
                        <label class="payment-option"><input type="radio" name="paymentMethod" value="CARD" required> Credit / Debit Card</label>
                        <label class="payment-option"><input type="radio" name="paymentMethod" value="CASH" required> Pay at campsite</label>
                        <button class="pay-now-btn" type="submit">Complete Payment</button>
                    </form>
                </div>
            </div>
        </div>
        <div class="button-container">
            <a href="Main.jsp">Back to Home</a>
        </div>
        <%
            }
        %>
    </div>

</body>
</html>
