<!DOCTYPE html>
<%@page import="com.raqib91.Dao.AdminDashboardDao"%>
<%@page import="org.springframework.context.annotation.AnnotationConfigApplicationContext"%>
<%@page import="org.springframework.context.support.AbstractApplicationContext"%>
<html>
<head>
<title>Welcome to DeKaj</title>
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
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&family=Montserrat:wght@600&display=swap"
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

.mn {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	display: flex;
	justify-content: space-between;
	align-items: center;
	transition: 0.6s;
	padding: 20px 100px;
	z-index: 5;
	border-bottom: 1px solid rgba(255, 255, 255, 0.5);
	/*background-color: rgba(0, 0, 0, 0.5);*/
}

.mn.sticky {
	padding: 5px 100px;
	background-color: #fff;
	border-bottom: 1px solid #000;
}

.mn .logo {
	position: relative;
	font-family: 'Lobster', cursive;
	color: #fff;
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
	color: #fff;
	font-family: 'Poppins', sans-serif;
}

li:hover {
	transform: scale(1.1);
	transition: 500ms;
}

.mn.sticky .logo, .mn.sticky span, .mn.sticky ul li a {
	color: #000;
}

.back {
	width: 100%;
	height: 100vh;
	background-image: url('images/bg.jpg');
	background-size: cover;
	background-position: center;
	background-attachment: fixed;
	display: flex;
	flex-direction: column;
	justify-content: center;
	/*align-items: center;*/
	position: relative;
}

.header-content {
	width: 46%;
	z-index: 1;
	padding-left: 5%;
	display: none;
}

.header-content h1 {
	margin: 0px;
	color: white;
	font-size: 47px;
	font-family: 'Montserrat', sans-serif;
	z-index: 1;
}

.header-content h3 {
	margin: 0px;
	color: white;
	font-family: 'Montserrat', sans-serif;
	z-index: 1;
	font-size: 18px;
}

.header-content button {
	font-size: 20px;
	margin-right: 15px;
	padding: 10px 15px;
	font-weight: 500;
	outline: none;
}

.header-content button:hover {
	transform: scale(1.05);
	transition: 500ms;
}

.btn1 {
	background-color: cyan;
	border: none;
	color: #000;
}

.btn2 {
	background: none;
	border: 2px solid #fff;
	color: #fff;
}

.btn2:hover {
	background-color: rgba(0, 0, 0, 0.5);
}

.overlay {
	position: absolute;
	width: 100%;
	height: 100vh;
	background: linear-gradient(45deg, red, blue, violet);
	opacity: 0.6;
}

.counters {
	overflow: hidden;
	color: #161E2C;
}

.c1, .c2, .c3 {
	height: 200px;
	padding: 0;
	text-align: center;
	color: #000;
}

.fau {
	margin-top: 20px;
	height: auto;
	background-color: #161E2C;
	color: #fff;
}

.r3 {
	padding-bottom: 40px;
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

.r1 {
	background-color: #F7F7F7;
	border-bottom: 1px solid rgba(0, 0, 0, 0.3);
}

.col-sm-4 h1 {
	font-size: 70px;
}

.mid { 
	color: #161E2C;
}

.mid h1 {
	margin-top: 80px;
	margin-bottom: 60px;
	font-size: 50px;
}

.card {
	text-align: center;
	margin-bottom: 20px;
	box-shadow: 3px 5px 10px #000;
}

.card:hover {
	transform: scale(1.01);
	transition: 300ms;
}

.card-body h3 {
	
}

.card-footer {
	font-size: 18px;
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
	text-decoration: none;
	margin-bottom: 20px;
	color: #fff;
	display: block;
}

.o2 a:hover {
	transform: scale(1.1);
	transition: 500ms;
}

.mnbar {
	color: #fff;
	display: none;
}

.mnbar:hover {
	cursor: pointer;
}

@media screen and (max-width: 1000px) {
	.mn {
		padding: 5px 50px;
	}
	.mn.sticky {
		padding: 5px 50px;
	}
	.mn .logo {
		font-size: 30px;
	}
	.mn ul li a {
		margin: 0 8px;
		font-size: 15px;
	}
	.header-content {
		width: 56%;
	}
	.header-content h1 {
		font-size: 35px;
	}
	.header-content h3 {
		font-size: 15px;
	}
}

@media screen and (max-width: 800px) {
	.mn {
		padding: 5px 40px;
	}
	.mn.sticky {
		padding: 5px 40px;
	}
	.mn .logo {
		font-size: 25px;
	}
	.mn ul li a {
		margin: 0 7px;
		font-size: 12px;
	}
	.back {
		align-items: center;
	}
	.header-content {
		width: 70%;
		text-align: center;
	}
	.header-content h1 {
		font-size: 30px;
	}
	.header-content h3 {
		font-size: 15px;
	}
	.header-content button {
		width: 200px;
		margin-bottom: 10px;
		padding: 5px 15px;
	}
	.c1, .c2, .c3 {
		height: 150px;
	}
	.sp {
		height: 15px;
	}
	.c1 h1 {
		font-size: 50px;
	}
	.c2 h1 {
		font-size: 50px;
	}
	.c3 h1 {
		font-size: 50px;
	}
	.mid h1 {
		font-size: 50px;
	}
	.colf {
		padding-left: 90px;
	}
}

@media screen and (max-width: 600px) {
	.mn {
		padding: 5px 30px;
	}
	.mn.sticky {
		padding: 5px 30px;
	}
	.mn .logo {
		font-size: 20px;
	}
	.mn ul {
		display: none;
	}
/* 	.mn ul li a { */
/* 		margin: 0 5px; */
/* 		font-size: 12px; */
/* 	} */
	.mnbar {
		display: block;
	}
	.back {
		align-items: center;
	}
	.header-content {
		width: 70%;
		text-align: center;
	}
	.header-content h1 {
		font-size: 25px;
	}
	.header-content h3 {
		font-size: 15px;
	}
	.header-content button {
		width: 200px;
		margin-bottom: 10px;
		padding: 5px 15px;
	}
	.c1, .c2, .c3 {
		height: 150px;
	}
	.sp {
		height: 20px;
	}
	.c1 h1 {
		font-size: 50px;
	}
	.c2 h1 {
		font-size: 50px;
	}
	.c3 h1 {
		font-size: 50px;
	}
	.mid h1 {
		font-size: 40px;
	}
	.colf {
		padding-left: 90px;
	}
}
</style>

</head>
<body>

	<%
		AbstractApplicationContext appContext = new AnnotationConfigApplicationContext(AdminDashboardDao.class);
		AdminDashboardDao add = appContext.getBean(AdminDashboardDao.class);
		int[] data = add.dashboardData();
	
		appContext.close();
	%>

	<div class="wrapper">

		<div class="mn">

			<a href="" class="logo">DeKaj</a>

			<ul>
				<li><a href="browseJob.jsp">Browse Jobs</a></li>
				<li><a href="about.jsp">About</a></li>
				<li><a href="contact.jsp">Contact</a></li>
				<li><a href="login.jsp">Login</a></li>
				<li><a href="" data-toggle="modal" data-target="#myModal">Signup</a></li>
			</ul>
			
			<span class="mnbar"><i class="fa fa-bars"></i></span>
			
			<div class="o2">
				<span class="hd">x</span>
				<div class="vd"></div>
				<center>
					<a href="browseJob.jsp">Browse Jobs</a>
					<a href="about.jsp">About</a>
					<a href="contact.jsp">Contact</a>
					<a href="login.jsp">Login</a>
				</center>
			</div>

		</div>

		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h5>Signup as</h5>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<center>
							<a href="companySignup.jsp"><button type="button"
									class="btn btn-primary">Recruiter</button></a> <a
								href="employeeSignup.jsp"><button type="button"
									class="btn btn-secondary">Employee</button></a>
						</center>
					</div>

				</div>
			</div>
		</div>

		<div class="back">

			<div class="header-content">

				<h1>Hire the best employees for your company.</h1>
				<br>
				<h3>It's never been easier!</h3>
				<br> <a href="companySignup.jsp"><button class="btn1">Hire
						an Employee</button></a> <a href="employeeSignup.jsp"><button class="btn2">I
						Want to Work</button></a>

			</div>

			<div class="overlay"></div>

		</div>

		<div class="counters">

			<div class="row r1">
				<div class="col-sm-4 c1">
					<div class="sp"></div>
					<h1><%=data[1] %></h1>
					<h3>Companies</h3>
				</div>
				<div class="col-sm-4 c2">
					<div class="sp"></div>
					<h1><%=data[3] %></h1>
					<h3>Jobs</h3>
				</div>
				<div class="col-sm-4 c3">
					<div class="sp"></div>
					<h1><%=data[5] %></h1>
					<h3>Employees</h3>
				</div>
			</div>

			<div class="mid">
				<center>
					<h1>JOIN US TODAY</h1>
				</center>
				<div class="row">
					<div class="col-md-4">
						<div class="container">
							<div class="card">
								<div class="card-body">
									<h3>
										<i class="fa fa-building"></i>
									</h3>
									<h4>Be an employer</h4>
								</div>
								<div class="card-footer">
									<span>Register as recruiter. Let employees know about
										your company.</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="container">
							<div class="card">
								<div class="card-body">
									<h3>
										<i class="fa fa-briefcase"></i>
									</h3>
									<h4>Post a job</h4>
								</div>
								<div class="card-footer">
									<span>Post a job letting employees know about your
										requirements. </span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="container">
							<div class="card">
								<div class="card-body">
									<h3>
										<i class="fa fa-users"></i>
									</h3>
									<h4>Be an employee</h4>
								</div>
								<div class="card-footer">
									<span>See available jobs. Match your profile and skills.
										Apply for the job</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		
		<center><h1 class="end">...</h1></center>
		
		<div class="fau">

			<div class="row r3">
				<div class="col-md-6 colf1">
					<div class="sp"></div>
					<h2>DeKaj</h2>
					<span>DeKaj is an online job portal. You can join us as an
						employer, post jobs and find employees for your job. Or you can be
						an employee. You can see available jobs and apply for them.</span>
				</div>
				<div class="col-md-3 colf">
					<div class="sp"></div>
					<h5>About</h5>
					<a href="about.jsp" target="_blank"><span>About System</span></a>
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

	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		$(function() {

			//Sticky navbar
			$(window).on('scroll', function() {
				if ($(window).scrollTop()) {
					$('.mn').addClass('sticky');
				} else {
					$('.mn').removeClass('sticky');
				}
			});

			//Header content animation
			$('.header-content').slideDown(1500);

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
