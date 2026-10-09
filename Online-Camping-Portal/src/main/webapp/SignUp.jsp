<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Signup - Vasota Lake Camping</title>
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
            max-width: 450px;
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
        input[type="password"],
        input[type="email"],
        input[type="tel"] {
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
        .info-box {
            margin-top: 16px;
            background: #f7fbff;
            border: 1px solid #d6e8ff;
            border-radius: 8px;
            padding: 12px;
            color: #35506b;
            font-size: 13px;
        }
        .guide-box {
            margin-top: 16px;
            background: #fffdf5;
            border: 1px solid #ffe8a8;
            border-radius: 8px;
            padding: 12px 14px;
            color: #5c4b21;
            font-size: 13px;
        }
        .guide-box h4 {
            margin: 0 0 8px 0;
            font-size: 14px;
            color: #4a3e1f;
        }
        .guide-box ul {
            margin: 0;
            padding-left: 18px;
        }
        .guide-box li {
            margin: 6px 0;
            line-height: 1.35;
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
        <h2>Create Your Vasota Lake Camping Account ⛺</h2>
        <p class="subtitle">Join the portal to reserve campsites faster and manage your outdoor adventures.</p>
        <form method="POST" action="./SignUp" >
            <label for="username">Username</label>
            <input id="username" type="text" name="username" placeholder="Choose a username" required>
            <p class="helper">Use 4 to 20 characters. You can include letters, numbers, underscore (_) and dot (.).</p>

            <label for="password">Password</label>
            <input id="password" type="password" name="password" placeholder="Create a strong password" required>
            <p class="helper">Use at least 8 characters with uppercase, lowercase, number, and a special character.</p>

            <button type="submit">Signup</button>
        </form>
        <div class="guide-box">
            <h4>Account Creation Tips</h4>
            <ul>
                <li><strong>Good username:</strong> short, unique, and easy to remember (example: <em>rahul_camp24</em>).</li>
                <li><strong>Avoid in username:</strong> spaces, personal phone numbers, or very long text.</li>
                <li><strong>Strong password example:</strong> combine words + number + symbol (example pattern: <em>Camp@2026Trail</em>).</li>
                <li><strong>Security tip:</strong> do not reuse your email or social media password here.</li>
            </ul>
        </div>
        <div class="info-box">
            By signing up, you can manage bookings, view reservation history, and receive trip updates from the camping team.
        </div>
        <p class="account-link">Already have an account? <a href="Login.jsp">Login here</a></p>
    </div>

 

</body>
</html>

