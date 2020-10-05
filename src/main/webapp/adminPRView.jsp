<%@page import="com.raqib91.Models.Recruiter"%>
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
<title>Pending Recruiters</title>
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

.content ul li {
	margin-bottom: 30px;
}

.card {
	box-shadow: 3px 5px 10px #000;
}

.f {
	width: 50%;
	height: 100%;
	float: left;
	text-align: left;
	padding-left: 100px;
}

.l {
	width: 50%;
	height: 100%;
	float: left;
	text-align: left;
	padding-left: 100px;
}

.f span, .l span {
	font-weight: 700;
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
	.f {
		padding-left: 10px;
		padding-right: 20px;
	}
	.l {
		padding-left: 40px;
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
	.f {
		padding-left: 10px;
	}
	.l {
		padding-left: 40px;
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
	.pad {
		height: 70px;
	}
	.f {
		padding-left: 10px;
		padding-right: 20px;
	}
	.l {
		padding-left: 40px;
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
	
		if (session.getAttribute("mail") == null || !session.getAttribute("role").equals("Admin")) {
			response.sendRedirect("login.jsp");
		}
	
		AbstractApplicationContext appContext = new AnnotationConfigApplicationContext(AdminViewDao.class);
		AdminViewDao avd = appContext.getBean(AdminViewDao.class);
		ArrayList<Recruiter> emp = avd.viewRecruiterData("pending_recruiter");
	
		appContext.close();
	%>

	<div class="wrapper">

		<div class="mn">

			<a href="index.jsp" class="logo">DeKaj</a>
			
			<input class="form-control" id="myInput" type="text" placeholder="Search anything...">

			<ul>
				<li><i class="fa fa-user-circle"></i>&nbsp Hello Admin!</li>
			</ul>

		</div>

		<section class="content">

			<div class="pad"></div>

			<ul class="inner" id="myCard">

			</ul>

		</section>

	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>

	<script type="text/javascript">
	
		$(function() {
			
			<%for (int i = 0; i < emp.size(); i++) {%>
			
				$('.inner').append('<li><div class="container"><div class="card"><div class="card-body"><div class="f"><span>Name:</span>&nbsp' + "<%=emp.get(i).getComName()%>" + '<br><span>Type:</span>&nbsp' + "<%=emp.get(i).getComType()%>" + '<br><span>Trade No:</span>&nbsp' + "<%=emp.get(i).getComTrade()%>" + '<br><span>Address:</span>&nbsp' + "<%=emp.get(i).getComAddress()%>" + '</div><div class="l"><span>Website:</span>&nbsp<a href="<%=emp.get(i).getComWebsite()%>" target="_blank">' + "<%=emp.get(i).getComWebsite()%>" + '</a><br><span>Email:</span>&nbsp' + "<%=emp.get(i).getComEmail()%>" + '<br><span>Password:</span>&nbsp' + "<%=emp.get(i).getComPassword()%>" + '</div></div><div class="card-footer"><center><form action="approvePR" method="post"><input type="hidden" name="com_mail" value="<%=emp.get(i).getComEmail()%>"><input type="hidden" name="com_pwd" value="<%=emp.get(i).getComPassword()%>"><button type="submit" class="btn btn-info btn1"><i class="fa fa-sign-in"></i>&nbsp Approve</button></form><form action="deletePR" method="post"><input type="hidden" name="com_mail" value="<%=emp.get(i).getComEmail()%>"><input type="hidden" name="com_pwd" value="<%=emp.get(i).getComPassword()%>"><button type="submit" class="btn btn-danger btn2"><i class="fa fa-trash"></i>&nbsp Reject</button></form></center></div></div></div></li>');
			
			<%}%>

			$("#myInput").on("keyup", function() {
			    var value = $(this).val().toLowerCase();
			    $("#myCard li").filter(function() {
			      	$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			    });
			});
			
		});
	</script>

</body>
</html>