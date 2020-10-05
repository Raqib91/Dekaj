<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Denied!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	margin: 0;
	padding: 0;
}

.wrapper {
	height: 60vh;
}

.mn {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	transition: 0.6s;
	padding: 5px 100px;
	z-index: 5;
	border-bottom: 1px solid #000;
	background-color: #fff;
}

.mn .logo {
	position: relative;
	font-family: 'Lobster', cursive;
	color: #000;
	text-decoration: none;
	font-size: 2em;
	transition: 0.6s;
	margin-right: 20px;
}

.mn ul {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0;
}

.mn ul li {
	position: relative;
	list-style: none;
}

.mn ul li a {
	position: relative;
	margin: 0 15px;
	text-decoration: none;
	color: #000;
	font-family: 'Poppins', sans-serif;
}

.list:hover {
	transform: scale(1.1);
	transition: 300ms;
}

.pad {
	height: 150px;
}

.content {
	font-size: 70px;
}

.content h1 {
	font-size: 40px;
}

.content h2 {
	margin-top: 30px;
	font-size: 30px;
}

@media screen and (max-width: 1000px) {
	.mn {
		padding: 5px 50px;
	}
	.mn .logo {
		font-size: 30px;
	}
	.mn ul li a {
		margin: 0 8px;
		font-size: 15px;
	}
	.content {
		font-size: 60px;
	}
	.content h1 {
		font-size: 35px;
	}	
	.content h2 {
		font-size: 25px;
	}
}

@media screen and (max-width: 800px) {
	.mn {
		padding: 5px 40px;
	}
	.mn .logo {
		font-size: 25px;
	}
	.mn ul li a {
		margin: 0 7px;
		font-size: 12px;
	}
	.content {
		font-size: 40px;
	}
	.content h1 {
		font-size: 30px;
	}
	.content h2 {
		font-size: 20px;
	}
}

@media screen and (max-width: 600px) {
	.mn {
		padding: 5px 30px;
	}
	.mn .logo {
		font-size: 20px;
	}
	.mn ul li a {
		margin: 0 5px;
		font-size: 12px;
	}
	.btn {
		font-size: 12px;
	}
	.pad {
		height: 120px;
	}
	.content {
		font-size: 40px;
	}
	.content h1 {
		font-size: 30px;
	}
	.content h2 {
		font-size: 20px;
	}
}
</style>
</head>
<body>

	<div class="wrapper">

		<div class="mn">

			<a href="index.jsp" class="logo">DeKaj</a>

			<ul>
				<li class="list"><a href="index.jsp">Home</a></li>
				<li class="list"><a href="about.jsp">About</a></li>
				<li class="list"><a href="contact.jsp">Contact</a></li>
				<li class="list"><a href="login.jsp">Login</a></li>
			</ul>

		</div>

		<section class="content">

			<div class="pad"></div>

			<center>
				<u><h1>Login denied!</h1></u>
				<h2>Please check your credentials or try again later.</h2>
				<a href="login.jsp"><button type="button" class="btn btn-info">Go
						Back</button></a>
			</center>

		</section>

		<%@include file="footer.jsp" %>

	</div>

</body>
</html>