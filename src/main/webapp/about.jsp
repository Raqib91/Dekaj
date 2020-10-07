<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
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
	font-size: 15px;
	color: #000;
	font-family: 'Poppins', sans-serif;
}

.list:hover {
	transform: scale(1.1);
	transition: 300ms;
}

.pad {
	height: 130px;
}

.content {
	font-size: 70px;
	padding-left: 50px;
	padding-right: 50px;
}

.content h1 {
	font-size: 40px;
}

.content p, ul {
	font-size: 20px;
	list-style: none;
}

.row {
	margin-top: 50px;
}

.col-sm-4 {
	margin-bottom: 20px;
}

.end {
	font-size: 100px;
}

.o2 {
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	width: 100%;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.9);
	color: #fff;
	position: absolute;
	display: none;
}

.o2 span {
	float: right;
	margin: 20px;
	margin-right: 50px;
}

.o2 span:hover {
	cursor: pointer;
}

.vd {
	height: 80px;
}

.o2 a {
	margin-bottom: 20px;
	color: #fff;
	display: block;
}

.o2 a:hover {
	transform: scale(1.1);
	transition: 500ms;
	text-decoration: none;
	color: #fff;
}

.mnbar {
	color: #000;
	display: none;
}

.mnbar:hover {
	cursor: pointer;
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
	.content h1 {
		font-size: 35px;
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
	.content h1 {
		font-size: 30px;
	}
	.row h3 {
		font-size: 20px;
	}
	.end {
		font-size: 60px;
	}
}

@media screen and (max-width: 600px) {
	.mn {
		padding: 5px 30px;
	}
	.mn .logo {
		font-size: 20px;
	}
	.mn ul {
		display: none;
	}
	.mnbar {
		display: block;
	}
	.btn {
		font-size: 12px;
	}
	.pad {
		height: 120px;
	}
	.content h1 {
		font-size: 30px;
	}
	.row h3 {
		font-size: 20px;
	}
	.end {
		font-size: 60px;
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
				<li class="list"><a href="browseJob.jsp">Browse Jobs</a></li>
				<li class="list"><a href="contact.jsp">Contact</a></li>
				<li class="list"><a href="login.jsp">Login</a></li>
			</ul>
			
			<span class="mnbar"><i class="fa fa-bars"></i></span>
			
			<div class="o2">
				<span class="hd">x</span>
				<div class="vd"></div>
				<center>
					<a href="index.jsp">Home</a>
					<a href="browseJob.jsp">Browse Jobs</a>
					<a href="contact.jsp">Contact</a>
					<a href="login.jsp">Login</a>
				</center>
			</div>

		</div>

		<section class="content">

			<div class="pad"></div>

			<center>
				<h1>DeKaj</h1>
				<p>Dekaj is an online job portal. You can join either as an
					employer or an employee. As an employer you will be able to post
					jobs and find employees for your job. On the other hand, being an
					employee you can see available jobs and apply for them.</p>
				<br>

				<h1>Technologies Used</h1>
				<div class="row">
					<div class="col-sm-4" style="background-color: lavender;">
						<h3>Frontend:</h3>
						<ul>
							<li>HTML5</li>
							<li>CSS3</li>
							<li>Javascript</li>
							<li>JQuery</li>
							<li>Bootstrap</li>
						</ul>
					</div>
					<div class="col-sm-4" style="background-color: lavenderblush;">
						<h3>Backend:</h3>
						<ul>
							<li>Java</li>
							<li>Maven</li>
							<li>Spring MVC</li>
							<li>JSP</li>
						</ul>
					</div>
					<div class="col-sm-4" style="background-color: lavender;">
						<h3>Database:</h3>
						<ul>
							<li>MySQL</li>
						</ul>
					</div>
				</div>
			</center>

		</section>

		<center>
			<h1 class="end">...</h1>
		</center>

		<%@include file="footer.jsp"%>

	</div>
	
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		$(function() {

			$('.mnbar').on('click', function(){
				$('.o2').slideDown(800);
			});

			$('.hd').on('click', function(){
				$('.o2').slideUp(800);
			});

		});
	</script>

</body>
</html>