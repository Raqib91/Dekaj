<%@page import="com.raqib91.Models.Recruiter"%>
<%@page import="com.raqib91.Models.Job"%>
<%@page import="com.raqib91.Dao.MyJobViewDao"%>
<%@page
	import="org.springframework.context.annotation.AnnotationConfigApplicationContext"%>
<%@page
	import="org.springframework.context.support.AbstractApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Current Job</title>
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
	box-sizing: border-box;
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

.container {
	width: 70%;
}

.card {
	box-shadow: 3px 5px 10px #000;
}

.card-body {
	padding-left: 50px;
	padding-right: 50px;
}

.card-footer {
	padding-left: 50px;
	padding-right: 50px;
}

.val {
	padding-left: 30px;
	font-weight: 350;
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
	.btn {
		font-size: 15px;
	}
	.pad {
		height: 60px;
	}
	.container {
		width: 80%;
	}
	.card {
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
		font-size: 15px;
	}
	.btn {
		font-size: 12px;
	}
	.pad {
		height: 60px;
	}
	.container {
		width: 90%;
	}
	.card {
		font-size: 12px;
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
		height: 50px;
	}
	.container {
		width: 90%;
	}
	.card {
		font-size: 12px;
	}
}
</style>

</head>
<body>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setHeader("Expires", "0"); //Proxies

	if (session.getAttribute("mail") == null || !session.getAttribute("role").equals("Employee")) {
		response.sendRedirect("login.jsp");
	}

	String com = request.getParameter("comName");
	String job = request.getParameter("comJob");

	AbstractApplicationContext appContext = new AnnotationConfigApplicationContext(MyJobViewDao.class);
	MyJobViewDao jvd = appContext.getBean(MyJobViewDao.class);
	Job j = jvd.viewJob(com, job);
	Recruiter r = jvd.viewRec(com);

	appContext.close();
	%>

	<div class="wrapper">

		<div class="mn">

			<a href="index.jsp" class="logo">DeKaj</a>

			<ul>
				<li class="list"><a href="allJobs.jsp">Home</a></li>
				<li class="list"><a href="editEmployee.jsp">Profile</a></li>
				<li>
					<form action="logout" method="post">
						<button type="submit" class="btn btn-danger lg">Logout</button>
					</form>
				</li>
			</ul>
			
			<span class="mnbar"><i class="fa fa-bars"></i></span>
			
			<div class="o2">
				<span class="hd">x</span>
				<div class="vd"></div>
				<center>
					<a href="allJobs.jsp">Home</a>
					<a href="editEmployee.jsp">Profile</a>
					<form action="logout" method="post">
						<button type="submit" class="btn btn-danger lg">Logout</button>
					</form>
				</center>
			</div>

		</div>

		<section class="content">

			<div class="pad"></div>

			<div class="container">
				<div class="card">
					<center>
						<div class="card-header">
							<h3><%=job%></h3>
							<h5>
								(<%=request.getParameter("com")%>)
							</h5>
						</div>
					</center>

					<div class="card-body">

						<h6>Vacancy</h6>
						<div class="val">
							<%=j.getJobVacancy()%>
						</div>
						<br>

						<h6>Job Responsibilities</h6>
						<div class="val">
							<%=j.getJobRes()%>
						</div>
						<br>

						<h6>Employment Status</h6>
						<div class="val">
							<%=j.getJobStatus()%>
						</div>
						<br>

						<h6>Workplace</h6>
						<div class="val">
							<%=j.getJobWorkplace()%>
						</div>
						<br>

						<h6>Educational Requirement</h6>
						<div class="val">
							<%=j.getJobEducation()%>
						</div>
						<br>

						<h6>Experience Required</h6>
						<div class="val">
							<%=j.getJobExp()%>
						</div>
						<br>

						<h6>Additional Requirement</h6>
						<div class="val">
							<%=j.getJobAdditional()%>
						</div>
						<br>

						<h6>Job Location</h6>
						<div class="val">
							<%=j.getJobLocation()%>
						</div>
						<br>

						<h6>Salary</h6>
						<div class="val">
							<%=j.getJobSalary()%>
						</div>
						<br>

						<center>
							<a href="mailto:<%=j.getJobCom()%>">
								<button type="button" class="btn btn-info">
									<i class="fa fa-location-arrow"></i>&nbsp Apply
								</button>
							</a><br> <br> Deadline:
							<%=j.getJobDeadline()%><br> <br>
						</center>

					</div>

					<div class="card-footer">
						<h5>Company Info</h5>
						Name:
						<%=request.getParameter("com")%><br> Address:
						<%=r.getComAddress()%><br> Website: <a
							href="<%=r.getComWebsite()%>" target="_blank"><%=r.getComWebsite()%></a><br>
						<br>
					</div>

				</div>
			</div>

		</section>
		
		<%@include file="footer.jsp" %>

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
