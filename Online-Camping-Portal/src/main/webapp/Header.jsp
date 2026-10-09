<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
      integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
      crossorigin="anonymous">
<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
      crossorigin="anonymous"></script>

<html>
<head>
    <meta charset="UTF-8">
    <title>Vasota Lake Camping</title>
    <link rel="stylesheet" href="Index.css">
    <style>
        .header {
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            padding: 10px;
            height: 200px;
        }

        .header img {
            width: 100px;
            height: auto;
            position: absolute;
            left: 10px;
            top: 10px;
        }

        #heading {
            margin: 0 auto;
            position: absolute;
            left: 400px;
            top: 20px;
            font-family: 'Pacifico', cursive;
            font-weight: bold;
            font-size: 45px;
            color: rgb(0, 0, 255);
            text-shadow: 2px 2px 4px gray;
        }

        .holder {
            margin-top: 100px;
        }

        /* Login Button */
        .login-btn {
            position: absolute;
            top: 20px;
            right: 50px;
            background: red;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .login-btn:hover {
            background: red;
        }

        /* Admin Button */
        .admin-btn {
            position: absolute;
            top: 20px;
            right: 140px;
            background: #0d6efd;
            color: white;
            border: none;
            padding: 10px 16px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.3s ease;
        }

        .admin-btn:hover {
            background: #0b5ed7;
        }
    </style>
</head>

<body>

    <header class="header">
        <img src="./images/vlogo.png" alt="logo" style="height: 100px; width: 100px; position: absolute; top: 20px; left: 150px;">
        <h1 id="heading">Vasota Lake Camping</h1>

        <!-- Login Button (Top-Right) -->
        <a href="${pageContext.request.contextPath}/Dashboard" class="admin-btn">Admin Panel</a>
        <a href="${pageContext.request.contextPath}/Login.jsp" class="login-btn">Login</a>

        <nav class="holder">
            <ul class="contents">
                <li><a href="./Main.jsp">Home</a></li>
                <li><a href="./Offers.jsp">Offers</a></li>
                <li><a href="./Gallery.jsp">Gallery</a></li>
                <li><a href="./Bookings.jsp">Bookings</a></li>
                <li><a href="./Contact.jsp">Contact</a></li>
            </ul>
        </nav>
    </header>

</body>
</html>
