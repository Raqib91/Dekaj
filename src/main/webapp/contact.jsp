<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact</title>
<link rel="icon" href="images/ticon.png">
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
	height: 80px;
}

.last {
	width: 100%;
}

.new {
	width: 100%;
}

.new h5 {
	margin-top: 15px;
}

.new img {
	width: 45px;
	height: 45px;
	margin-right: 10px;
	border-radius: 50%;
}

.new img:hover {
	width: 42px;
	height: 42px;
	transition: 300ms;
	border: 2px solid mediumspringgreen;
}

.pic {
	width: 130px;
	height: 130px;
	background-image: url(images/me.jpg);
	background-position: center;
	background-size: cover;
	border-radius: 50%;
	margin-top: 30px;
}

.pic:hover {
	transform: scale(1.1);
	border: 5px solid mediumspringgreen;
	transition: 300ms;
	cursor: pointer;
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
	.pad {
		height: 60px;
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
		height: 60px;
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
				<li class="list"><a href="about.jsp">About</a></li>
				<li class="list"><a href="login.jsp">Login</a></li>
			</ul>
			
			<span class="mnbar"><i class="fa fa-bars"></i></span>
			
			<div class="o2">
				<span class="hd">x</span>
				<div class="vd"></div>
				<center>
					<a href="index.jsp">Home</a>
					<a href="browseJob.jsp">Browse Jobs</a>
					<a href="about.jsp">About</a>
					<a href="login.jsp">Login</a>
				</center>
			</div>

		</div>

		<div class="last">
			<div class="pad"></div>
			<div class="new">
				<center>
					<div class="pic"></div>

					<h5>MD. RAQIBUR RAHMAN</h5>
					<em><span>J2EE Developer</span></em><br> <br> <a
						href="https://www.facebook.com/raqib91" target="_blank"><img
						alt="" src="images/fb.png"></a> <a
						href="https://github.com/Raqib91" target="_blank"><img alt=""
						src="images/git.png"></a> <a
						href="https://www.linkedin.com/in/raqib91/" target="_blank"><img
						alt="" src="images/in.png"></a> <br> <br> <a
						href="mailto:mdraqiburrahman0@gmail.com"><button type="button"
							class="btn btn-info">Contact Me</button></a>

				</center>
			</div>
		</div>

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
