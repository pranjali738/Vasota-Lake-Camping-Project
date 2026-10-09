<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment Status</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	text-align: center;
	padding: 60px 20px;
}

.card {
	max-width: 700px;
	margin: 0 auto;
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 2px 12px rgba(0, 0, 0, 0.15);
}

h2 {
	color: #007bff;
}

p {
	font-size: 18px;
	margin-top: 12px;
}

a {
	display: inline-block;
	margin-top: 20px;
	padding: 10px 20px;
	background: #007bff;
	color: #fff;
	text-decoration: none;
	border-radius: 6px;
}

a:hover {
	background: #0056b3;
}
</style>
</head>
<body>
	<div class="card">
		<h2>Payment Result</h2>
		<p>${paymentMessage}</p>
		<a href="Main.jsp">Back to Home</a>
	</div>
</body>
</html>
