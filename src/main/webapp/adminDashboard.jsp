<%@page
	import="org.springframework.context.annotation.AnnotationConfigApplicationContext"%>
<%@page
	import="org.springframework.context.support.AbstractApplicationContext"%>
<%@page import="com.raqib91.Dao.AdminDashboardDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="icon" href="images/ticon.png">
<meta charset="utf-8">
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
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	margin: 0;
	padding: 0;
	overflow-x: hidden;
}

.wrapper {
	width: 100%;
	height: 100vh;
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

.tab {
	float: left;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
	width: 20%;
	height: 100vh;
	margin-top: 58px;
}

/* Style the buttons inside the tab */
.tab button {
	display: block;
	background-color: inherit;
	color: black;
	padding: 22px 16px;
	width: 100%;
	border: none;
	outline: none;
	text-align: left;
	cursor: pointer;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	float: left;
	padding: 0;
	border: 1px solid #ccc;
	width: 80%;
	border-left: none;
	height: 100vh;
	margin-top: 58px;
}

.pad {
	height: 100px;
}

.row {
	width: 100%;
	margin: 0;
}

.col-md-6 {
	padding: 0;
	height: 300px;
	margin-bottom: -60px;
}

.container a {
	text-decoration: none;
	color: #000;
}

.card {
	width: 80%;
	text-align: center;
	font-weight: 400;
	box-shadow: 3px 5px 10px #000;
}

.card:hover {
	box-shadow: 5px 8px 10px #000;
}

.card-header {
	font-size: 20px;
}

.pend {
	background-color: #ffff00;
}

.app {
	background-color: #66ff33;
}

.card-body {
	font-size: 50px;
}

.fau {
	margin-top: 55px;
	height: auto;
	background-color: #161E2C;
	color: #fff;
}

.r3 {
	padding-bottom: 10px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.3);
}

.sp {
	height: 30px;
}

.colf1 {
	padding-left: 90px;
	padding-right: 90px;
}

.colf1 h2 {
	font-family: 'Lobster', cursive;
}

.colf {
	padding-right: 20px;
}

.colf a {
	text-decoration: none;
	color: #fff;
}

.colf a:hover {
	color: cyan;
}

.colf i {
	font-size: 30px;
	margin-right: 10px;
}

.cp {
	text-align: center;
	padding-top: 20px;
	padding-bottom: 20px;
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
	.tab {
		width: 25%;
		margin-top: 56px;
	}
	.tabcontent {
		width: 75%;
		margin-top: 56px;
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
	.tab {
		width: 30%;
		margin-top: 48px;
	}
	.tabcontent {
		width: 70%;
		margin-top: 48px;
	}
	.pad {
		height: 30px;
	}
	.col-md-6 {
		margin-bottom: -80px;
	}
	.colf {
		padding-left: 90px;
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
	.tab {
		width: 35%;
		margin-top: 40px;
	}
	.tabcontent {
		width: 65%;
		margin-top: 40px;
	}
	.pad {
		height: 30px;
	}
	.col-md-6 {
		margin-bottom: -100px;
	}
	.colf {
		padding-left: 90px;
	}
}
</style>

</head>
<body>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setHeader("Expires", "0"); //Proxies
	
		if (session.getAttribute("mail") == null || !session.getAttribute("role").equals("Admin")) {
			response.sendRedirect("login.jsp");
		}
	
		AbstractApplicationContext appContext = new AnnotationConfigApplicationContext(AdminDashboardDao.class);
		AdminDashboardDao add = appContext.getBean(AdminDashboardDao.class);
		int[] data = add.dashboardData();
	
		appContext.close();
	%>

	<div class="wrapper">

		<div class="mn">

			<a href="index.jsp" class="logo">DeKaj</a>

			<ul>
				<li><i class="fa fa-user-circle"></i>&nbsp Hello Admin!</li>
			</ul>

		</div>

		<section class="content">

			<div class="tab">
				<button class="tablinks" onclick="switchOption(event, 'rec')"
					id="defaultOpen">
					<i class="fa fa-user-plus"></i>&nbsp Recruiters
				</button>
				<button class="tablinks" onclick="switchOption(event, 'job')">
					<i class="fa fa-briefcase"></i>&nbsp Jobs
				</button>
				<button class="tablinks" onclick="switchOption(event, 'emp')">
					<i class="fa fa-user"></i>&nbsp Employees
				</button>

				<form action="logout" method="post">
					<button type="submit" class="tablinks">
						<i class="fa fa-sign-out"></i>&nbsp Logout
					</button>
				</form>
			</div>

			<div id="rec" class="tabcontent">
				<div class="pad"></div>
				<div class="row">
					<div class="col-md-6">
						<center>
							<div class="container">
								<a href='adminPRView.jsp' target="_blank">
									<div class="card">
										<div class="card-header pend">Pending Recruiters</div>
										<div class="card-body"><%=data[0]%></div>
									</div>
								</a>
							</div>
						</center>
					</div>
					<div class="col-md-6">
						<center>
							<div class="container">
								<a href='adminARView.jsp' target="_blank">
									<div class="card">
										<div class="card-header app">Approved Recruiters</div>
										<div class="card-body"><%=data[1]%></div>
									</div>
								</a>
							</div>
						</center>
					</div>
				</div>
			</div>

			<div id="job" class="tabcontent">
				<div class="pad"></div>
				<div class="row">
					<div class="col-md-6">
						<center>
							<div class="container">
								<a href='adminPJView.jsp' target="_blank">
									<div class="card">
										<div class="card-header pend">Pending Jobs</div>
										<div class="card-body"><%=data[2]%></div>
									</div>
								</a>
							</div>
						</center>
					</div>
					<div class="col-md-6">
						<center>
							<div class="container">
								<a href='adminAJView.jsp' target="_blank">
									<div class="card">
										<div class="card-header app">Approved Jobs</div>
										<div class="card-body"><%=data[3]%></div>
									</div>
								</a>
							</div>
						</center>
					</div>
				</div>
			</div>

			<div id="emp" class="tabcontent">
				<div class="pad"></div>
				<div class="row">
					<div class="col-md-6">
						<center>
							<div class="container">
								<a href='adminPEView.jsp' target="_blank">
									<div class="card">
										<div class="card-header pend">Pending Employees</div>
										<div class="card-body"><%=data[4]%></div>
									</div>
								</a>
							</div>
						</center>
					</div>
					<div class="col-md-6">
						<center>
							<div class="container">
								<a href='adminAEView.jsp' target="_blank">
									<div class="card">
										<div class="card-header app">Approved Employees</div>
										<div class="card-body"><%=data[5]%></div>
									</div>
								</a>
							</div>
						</center>
					</div>
				</div>
			</div>

		</section>

	</div>

	<div class="fau">

		<div class="row r3">
			<div class="col-md-6 colf1">
				<div class="sp"></div>
				<h2>Dekaj</h2>
				<span>Dekaj is an online job portal. You can join us as an
					employer, post jobs and find employees for your job. Or you can be
					an employee. You can see available jobs and apply for them.</span>
			</div>
			<div class="col-md-3 colf">
				<div class="sp"></div>
				<h5>About</h5>
				<a href=""><span>About Developer</span></a>
			</div>
			<div class="col-md-3 colf">
				<div class="sp"></div>
				<h5>Contact</h5>
				<a href="https://www.facebook.com/raqib91/" target="_blank"><i class="fa fa-facebook-square"></i></a> 
				<a href="https://github.com/Raqib91" target="_blank"><i class="fa fa-github-square"></i></a> 
				<a href="https://www.linkedin.com/in/raqib91/" target="_blank"><i class="fa fa-linkedin-square"></i></a>
			</div>
		</div>

		<div class="cp">
			<span>&copy Copyright MD. RAQIBUR RAHMAN</span>
		</div>

	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		function switchOption(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");

			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}

			tablinks = document.getElementsByClassName("tablinks");

			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}

			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>

</body>

</html>
