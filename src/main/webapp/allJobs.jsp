<%@page import="com.raqib91.Dao.EditRecruiterDao"%>
<%@page import="com.raqib91.Models.Job"%>
<%@page import="com.raqib91.Dao.AdminViewDao"%>
<%@page import="java.util.ArrayList"%>
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
<title>Available Jobs</title>
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

.mn input {
	width: 40%;
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
	height: 70px;
}

.hd {
	margin-bottom: 20px;
}

.content ul li {
	margin-bottom: 30px;
}

.container {
	width: 70%;
}

.container a {
	text-decoration: none;
	color: #000;
}

.card {
	box-shadow: 3px 5px 10px #000;
}

.card:hover {
	transform: scale(1.01);
	transition: 300ms;
}

.f {
	width: 70%;
	height: 100%;
	float: left;
	text-align: left;
	padding-left: 100px;
	line-height: 30px;
}

.l {
	width: 20%;
	height: 100%;
	float: left;
	text-align: center;
	padding-left: 0px;
	background-color: #003366;
	color: #fff;
	border-radius: 10px;
	margin-right: 20px;
	line-height: 30px;
}

.f span, .l span {
	font-weight: 700;
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
	.hd {
		font-size: 30px;
	}
	.container {
		width: 80%;
	}
	.card {
		font-size: 15px;
	}
	.f {
		padding-left: 10px;
		padding-right: 20px;
		width: 80%;
	}
	.l {
		margin-right: 0px;
		width: 20%;
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
	.f {
		padding-left: 10px;
		line-height: 20px;
		width: 80%;
	}
	.l {
		margin-right: 0px;
		width: 20%;
		line-height: 20px;
	}
	.hd {
		font-size: 25px;
	}
}

@media screen and (max-width: 600px) {
	.mn {
		padding: 5px 30px;
	}
	.mn .logo {
		font-size: 20px;
	}
	.mn input {
		width: 60%;
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
	.f {
		padding-left: 10px;
		padding-right: 20px;
		line-height: 20px;
		width: 75%;
	}
	.l {
		width: 25%;
		margin-right: 0px;
		font-size: 10px;
		line-height: 20px;
	}
	.hd {
		font-size: 20px;
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
	
		AbstractApplicationContext appContext = new AnnotationConfigApplicationContext(AdminViewDao.class);
		AdminViewDao avd = appContext.getBean(AdminViewDao.class);
		ArrayList<Job> j = avd.viewPJobData("approved_job");
	
		AbstractApplicationContext appContext2 = new AnnotationConfigApplicationContext(EditRecruiterDao.class);
		EditRecruiterDao erd = appContext2.getBean(EditRecruiterDao.class);
	
		appContext.close();
	%>

	<div class="wrapper">

		<div class="mn">

			<a href="index.jsp" class="logo">DeKaj</a>
			
			<input class="form-control" id="myInput" type="text" placeholder="Search anything...">

			<ul>
				<li class="list"><a href="">Home</a></li>
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
					<a href="">Home</a>
					<a href="editEmployee.jsp">Profile</a>
					<form action="logout" method="post">
						<button type="submit" class="btn btn-danger lg">Logout</button>
					</form>
				</center>
			</div>

		</div>

		<section class="content">

			<div class="pad"></div>
			
			<center><h2 class="hd">Available Jobs</h2></center>

			<ul class="inner" id="myCard">

			</ul>

		</section>

	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
	
		$(function() {
			
			<%for (int i = 0; i < j.size(); i++) {%>
			
				$('.inner').append('<li><div class="container"><a href="curJob.jsp?com=<%=erd.comName(j.get(i).getJobCom())%>&comName=<%=j.get(i).getJobCom()%>&comJob=<%=j.get(i).getJobTitle()%>" target="_blank"><div class="card"><div class="card-body"><div class="f"><h5 style="color: #003366;">' + "<%=j.get(i).getJobTitle()%>" + '</h5><h6>' + "<%=erd.comName(j.get(i).getJobCom())%>" + '</h6>&nbsp<i class="fa fa-map-marker"></i>&nbsp&nbsp&nbsp' + "<%=j.get(i).getJobLocation()%>" + '<br><i class="fa fa-university"></i>&nbsp&nbsp' + "<%=j.get(i).getJobEducation()%>" + '<br><i class="fa fa-briefcase"></i>&nbsp&nbsp&nbsp' + "<%=j.get(i).getJobExp()%>" + '</div><br><br><div class="l">' + "<%=j.get(i).getJobStatus()%>" + '<br><i class="fa fa-hourglass-end"></i>&nbsp&nbsp' + "<%=j.get(i).getJobDeadline()%>" + '<br></div></div></div></a></div></li>');
	
			<%}%>

			$("#myInput").on("keyup", function() {
			    var value = $(this).val().toLowerCase();
			    $("#myCard li").filter(function() {
			      	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			    });
			});

			$('.mnbar').on('click', function(){
				$('.o2').slideDown(800);
			});

			$('.hd').on('click', function(){
				$('.o2').slideUp(800);
			});
		});
	</script>

	<%
		appContext2.close();
	%>

</body>
</html>
