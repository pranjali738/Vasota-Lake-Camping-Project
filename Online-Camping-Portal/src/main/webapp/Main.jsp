<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="Header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Vasota Lake Camping</title>
    <style>
        .banner {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
            padding: 20px;
            flex-direction: column;
        }

        .photo-content {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .photo {
            flex: 1;
        }

        .photo img {
            width: 100%;
            max-width: 500px;
            height: auto;
            border-radius: 10px;
            border: 2px solid red;
           }

        .content {
            flex: 2;
            text-align: left;
        }

        .center-img {
            display: block;
            margin: 0 auto;
        }

        h2 {
            display: block;
            text-align: center;
            font-weight: bold;
             font-family: Georgia, serif;
   			color: white;
            background-color:rgb(49, 92, 105);
            padding: 10px;
            border-radius: 5px;
            margin-top: 30px
        }
       
        
    </style>
</head>
<body>
     
    <div class="banner">
        <h2>About Us</h2>
        <div class="photo-content">
            <div class="photo">
                <img src="./images/vasota.jpg" alt="Vasota Lake Camping">
            </div>
            <div class="content">
                <p>At Vasota Lake Camping, we believe in the magic of nature, adventure, and unforgettable experiences. Nestled amidst
                    the breathtaking landscapes of the Sahyadri ranges and the serene backwaters of the Shivsagar Lake, our campsite offers
                    the perfect escape for nature lovers, trekkers, and thrill-seekers alike. With a passion for outdoor adventure, we
                    provide a well-organized and safe camping experience that combines trekking, boating, bonfires, and stargazing—all under
                    the vast open sky. Our team is dedicated to ensuring you enjoy the raw beauty of Vasota Fort and the surrounding wilderness
                    while experiencing comfort, safety, and eco-friendly hospitality. Whether you're a solo traveler, a group of friends, or a
                    family looking for a unique getaway, Vasota Lake Camping promises an adventure filled with memories that will last a lifetime.
                    Join us for an immersive journey into nature!</p>
            </div>
        </div>
    </div>

    <h2>Celebrate Your Holi With Your Friends And Family With Us On 14th-15th March</h2>
    <img style="border: 2px solid red;" src="./images/holi.jpg" class="center-img" height="700px" width="900px">

    <h2>Schedule At Vasota Camping</h2>
    <img style="border: 2px solid red;" src="./images/schedule.jpg" class="center-img" height="700px" width="900px">

    <%@ include file="Footer.jsp" %>
</body>
</html>
