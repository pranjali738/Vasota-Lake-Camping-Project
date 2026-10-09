<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login - Vasota Lake Camping</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f4f4f4, #e4edf7);
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 24px;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
            width: 100%;
            max-width: 420px;
            text-align: left;
        }
        .subtitle {
            margin-top: 0;
            color: #555;
            font-size: 14px;
        }
        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
            color: #333;
            font-size: 14px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 6px 0 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        .helper {
            color: #666;
            font-size: 12px;
            margin: 5px 0 0;
        }
        .form-footer {
            margin-top: 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
        }
        .form-footer a {
            color: #0056b3;
            text-decoration: none;
        }
        .form-footer a:hover {
            text-decoration: underline;
        }
        button {
            background: #007bff;
            color: white;
            padding: 11px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 14px;
            font-size: 15px;
            font-weight: bold;
        }
        button:hover {
            background: #0056b3;
        }
        .features {
            margin: 18px 0 0;
            padding-left: 18px;
            color: #444;
            font-size: 13px;
        }
        .features li {
            margin: 6px 0;
        }
        .error-msg {
            color: #b00020;
            font-weight: bold;
            margin: 10px 0 0;
            min-height: 18px;
        }
        .account-link {
            margin-top: 18px;
            font-size: 14px;
            text-align: center;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Welcome Back to Vasota Lake Camping</h2>
        <p class="subtitle">Sign in to manage your bookings, campsite preferences, and trip details.</p>
        <form method="POST" action="${pageContext.request.contextPath}/Login">
            <label for="username">Username</label>
            <input id="username" type="text" name="username" placeholder="Enter your username" autocomplete="username" required>
            <p class="helper">Use the username you created during registration.</p>

            <label for="password">Password</label>
            <input id="password" type="password" name="password" placeholder="Enter your password" autocomplete="current-password" required>

            <div class="form-footer">
                <span>Need help? Contact support desk.</span>
                <a href="SignUp.jsp">Create account</a>
            </div>

            <button type="submit">Login</button>
            <p class="error-msg">${empty msg ? "" : msg}</p>
        </form>

        <ul class="features">
            <li>Track upcoming reservations in one place.</li>
            <li>Review payment and booking history quickly.</li>
            <li>Access campsite updates and important notices.</li>
        </ul>

        <p class="account-link">Don't have an account? <a href="SignUp.jsp">Sign up here</a></p>
    </div>

    

</body>
</html>
