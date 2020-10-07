<%@page import="com.raqib91.Models.Employee"%>
<%@page import="com.raqib91.Dao.AdminSelectedEDao"%>
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
<title>Employee Profile</title>
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

li:hover {
	transform: scale(1.1);
	transition: 500ms;
}

.container {
	margin-top: 70px;
	margin-bottom: 50px;
}

.card {
	box-shadow: 5px 8px 10px #000;
}

.card-header {
	text-align: center;
	font-size: 35px;
}

.col-lg-6 {
	margin-bottom: 15px;
}

.col-lg-6 label {
	font-weight: 500;
}

.input-group-text img {
	width: 25px;
	height: 25px;
}

.req {
	color: red;
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
	.card-header {
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
		font-size: 15px;
	}
	.card-header {
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
	.mn ul {
		display: none;
	}
	.mnbar {
		display: block;
	}
	.card-header {
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
	
		String email = String.valueOf(session.getAttribute("mail"));
		String pass = String.valueOf(session.getAttribute("pass"));
	
		AbstractApplicationContext appContext = new AnnotationConfigApplicationContext(AdminSelectedEDao.class);
		AdminSelectedEDao ased = appContext.getBean(AdminSelectedEDao.class);
		Employee emp = ased.viewDetails(email, pass);
	
		appContext.close();
	%>

	<div class="wrapper">

		<div class="mn">

			<a href="index.jsp" class="logo">DeKaj</a>

			<ul>
				<li class="list"><a href="allJobs.jsp">Home</a></li>
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
					<form action="logout" method="post">
						<button type="submit" class="btn btn-danger lg">Logout</button>
					</form>
				</center>
			</div>

		</div>

		<div class="container">

			<form action="updateEmp" method="post">
				<div class="card">
					<div class="card-header">
						<span><i class="fa fa-user-circle"></i> Hello Employee!</span>
					</div>
					<div class="card-body">

						<div class="row">

							<div class="col-lg-6">

								<div class="form-group">
									<label>Name<span class="req">*</span>:
									</label> <input type="text" class="form-control"
										placeholder="Your name" name="empName"
										value="<%=emp.getEmpName() %>">
								</div>

							</div>

							<div class="col-lg-6">

								<label>Gender<span class="req">*</span>:
								</label><br>

								<div class="form-check-inline">
									<input type="radio" class="form-check-input" name="empGender"
										value="Male" checked>Male
								</div>

								<div class="form-check-inline">
									<input type="radio" class="form-check-input" name="empGender"
										value="Female">Female
								</div>

								<div class="form-check-inline">
									<input type="radio" class="form-check-input" name="empGender"
										value="Others">Others
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-lg-6">

								<div class="form-group">
									<label>Title of your desired job<span class="req">*</span>:
									</label> <input type="text" class="form-control"
										placeholder="Example: Software Engineer" name="empJob"
										value="<%=emp.getEmpJob()%>">
								</div>

							</div>
							<div class="col-lg-6">

								<div class="form-group">
									<label>Experience<span class="req">*</span>:
									</label> <select class="form-control" name="empExperience">
										<option value="N/A">N/A</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="13">13</option>
										<option value="14">14</option>
										<option value="15">15</option>
										<option value="16">16</option>
										<option value="17">17</option>
										<option value="18">18</option>
										<option value="19">19</option>
										<option value="20">20</option>
										<option value="20+">20+</option>
									</select>
								</div>

							</div>
						</div>

						<div class="row">

							<div class="col-lg-6">

								<div class="form-group">
									<label>Skills:</label> <input type="text" class="form-control"
										placeholder="Example: c++, java etc." name="empSkills"
										value="<%=emp.getEmpSkills()%>">
								</div>

							</div>

							<div class="col-lg-6">

								<label>Are you working currently<span class="req">*</span>:
								</label><br>

								<div class="form-check-inline">
									<input type="radio" class="form-check-input" name="empStatus"
										value="Yes">Yes
								</div>

								<div class="form-check-inline">
									<input type="radio" class="form-check-input" name="empStatus"
										value="No" checked>No
								</div>

							</div>

						</div>
						
						<script type="text/javascript">
						    $('[name=empExperience]').val('<%=emp.getEmpExperience()%>');
						    $("input[name=empGender][value='<%=emp.getEmpGender()%>']").attr('checked', true);
						    $("input[name=empStatus][value='<%=emp.getEmpStatus()%>']").attr('checked', true);
						</script>

						<div class="row">

							<div class="col-lg-6">

								<div class="form-group">
									<label>Age<span class="req">*</span>:
									</label> <input type="number" class="form-control"
										placeholder="Your age" name="empAge"
										value="<%=emp.getEmpAge()%>">
								</div>

							</div>

							<div class="col-lg-6">

								<label>Contact No:</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"><img alt=""
											src="images/bd.png">+88</span>
									</div>
									<input type="text" class="form-control"
										placeholder="01XXXXXXXXX" name="empMobile"
										value="<%=emp.getEmpMobile()%>">
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-lg-6">

								<div class="form-group">
									<label>Email<span class="req">*</span>:
									</label> <input type="Email" class="form-control"
										placeholder="Your email" name="empEmail"
										value="<%=emp.getEmpEmail()%>" readonly>
								</div>

							</div>
							<div class="col-lg-6">

								<div class="form-group">
									<label>Password<span class="req">*</span>:
									</label> <input type="text" class="form-control"
										placeholder="Login pasword" name="empPassword"
										value="<%=emp.getEmpPassword()%>" readonly>
								</div>

							</div>
						</div>



					</div>

					<div class="card-footer">
						<center>
							<button type="submit" class="btn btn-info">
								<i class="fa fa-edit"></i>&nbsp Update
							</button>
							<button type="button" class="btn btn-danger" data-toggle="modal"
								data-target="#myModal">
								<i class="fa fa-trash"></i>&nbsp Delete
							</button>
						</center>
					</div>

				</div>

			</form>

		</div>
		
		<%@include file="footer.jsp" %>

	</div>

	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal body -->
				<div class="modal-body">Are you sure?</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<form action="dltEmp" method="post">
						<input type="hidden" name="email" value="<%=emp.getEmpEmail()%>">
						<input type="hidden" name="pass" value="<%=emp.getEmpPassword()%>">
						<button type="submit" class="btn btn-warning">Yes</button>
					</form>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">No</button>
				</div>

			</div>
		</div>
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