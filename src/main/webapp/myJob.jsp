<%@page import="com.raqib91.Dao.MyJobViewDao"%>
<%@page import="com.raqib91.Dao.EditRecruiterDao"%>
<%@page import="com.raqib91.Models.Job"%>
<%@page
	import="org.springframework.context.annotation.AnnotationConfigApplicationContext"%>
<%@page
	import="org.springframework.context.support.AbstractApplicationContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.raqib91.Dao.AdminViewDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Jobs</title>
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

.pad {
	height: 80px;
}

table {
	text-align: center;
}

.content ul li {
	margin-bottom: 30px;
}

.card {
	box-shadow: 3px 5px 10px #000;
}

.btn1 {
	margin-right: 10px;
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
		font-size: 12px;
	}
	td {
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
	.btn {
		font-size: 10px;
	}
	td {
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
	.mn ul li a {
		margin: 0 5px;
		font-size: 12px;
	}
	.btn {
		font-size: 10px;
		width: 78px;
	}
	.btn1 {
		margin-right: 0;
		margin-bottom: 1px;
	}
	th {
		font-size: 12px;
	}
	td {
		font-size: 12px;
	}
	.pad {
		height: 70px;
	}
}

form {
	display: inline;
}
</style>

</head>
<body>

	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
		response.setHeader("Pragma", "no-cache"); //HTTP 1.0
		response.setHeader("Expires", "0"); //Proxies
	
		if (session.getAttribute("mail") == null || !session.getAttribute("role").equals("Recruiter")) {
			response.sendRedirect("login.jsp");
		}
	
		AbstractApplicationContext appContext = new AnnotationConfigApplicationContext(MyJobViewDao.class);
		MyJobViewDao mjvd = appContext.getBean(MyJobViewDao.class);
		ArrayList<Job> pj = mjvd.viewJobData(String.valueOf(session.getAttribute("mail")));
	
		appContext.close();
	%>

	<div class="wrapper">

		<div class="mn">

			<a href="index.jsp" class="logo">DeKaj</a>
			
			<input class="form-control" id="myInput" type="text" placeholder="Search anything...">

			<ul>
				<li class="list"><a href="allEmployee.jsp">Home</a></li>
				<li class="list"><a href="createJob.jsp">Create Job</a></li>
				<li class="list"><a href="editRecruiter.jsp">Profile</a></li>
				<li>
					<form action="logout" method="post">
						<button type="submit" class="btn btn-danger lg">Logout</button>
					</form>
				</li>
			</ul>

		</div>

		<section class="content">

			<div class="pad"></div>

			<div class="table-responsive">
				<table class="table table-bordered">
					<thead class="thead-dark">
						<tr>
							<th>#</th>
							<th>Job Title</th>
							<th>Deadline</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody class="inner" id="myCard">

					</tbody>
				</table>
			</div>

		</section>

	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		$(function() {
			<%for (int i = 0; i < pj.size(); i++) {%>
		
				$('.inner').append('<tr><td>' + "<%=i + 1 %>" + '</td><td>' + "<%=pj.get(i).getJobTitle() %>" + '</td><td>' + "<%=pj.get(i).getJobDeadline() %>" + '</td><td><a href="editMyJob.jsp?com=<%=pj.get(i).getJobCom()%>&comJob=<%=pj.get(i).getJobTitle()%>" target="_blank"><button type="submit" class="btn btn-info btn1"><i class="fa fa-info-circle"></i>&nbsp Details</button></a><form action="deleteMyJob" method="post"><input type="hidden" name="comName" value="<%=pj.get(i).getJobCom() %>"><input type="hidden" name="comJob" value="<%=pj.get(i).getJobTitle() %>"><button type="submit" class="btn btn-danger btn2"><i class="fa fa-trash"></i>&nbsp Delete</button></form></td></tr>');
				
			<%}%>

			$('.btn2').on('click', function(){
				alert('1 job will be deleted');
			});

			$("#myInput").on("keyup", function() {
			    var value = $(this).val().toLowerCase();
			    $("#myCard tr").filter(function() {
			      	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			    });
			});
			
		});
	</script>

</body>
</html>