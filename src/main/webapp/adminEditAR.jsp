<%@page import="com.raqib91.Models.Recruiter"%>
<%@page import="com.raqib91.Dao.AdminSelectedRecruiterDao"%>
<%@page import="org.springframework.context.annotation.AnnotationConfigApplicationContext"%>
<%@page import="org.springframework.context.support.AbstractApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Recruiter</title>
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

li:hover {
	transform: scale(1.1);
	transition: 500ms;
}

.container {
	margin-top: 90px;
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

.col-lg-12, .col-lg-6 label {
	font-weight: 500;
}

.req {
	color: red;
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
		font-size: 12px;
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
	.mn ul li a {
		margin: 0 5px;
		font-size: 12px;
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
	
		if (session.getAttribute("mail") == null || !session.getAttribute("role").equals("Admin")) {
			response.sendRedirect("login.jsp");
		}
	
		String email = request.getParameter("com_mail");
		String pass = request.getParameter("com_pwd");
	
		AbstractApplicationContext appContext = new AnnotationConfigApplicationContext(AdminSelectedRecruiterDao.class);
		AdminSelectedRecruiterDao asrd = appContext.getBean(AdminSelectedRecruiterDao.class);
		Recruiter rec = asrd.viewDetails(email, pass);
	
		appContext.close();
	%>

	<div class="wrapper">

		<div class="mn">

			<a href="index.jsp" class="logo">DeKaj</a>

			<ul>
				<li><i class="fa fa-user-circle"></i>&nbsp Hello Admin!</li>
			</ul>

		</div>

		<div class="container">
			<div class="card">
				<div class="card-header">
					<span>Edit Recruiter</span>
				</div>
				<div class="card-body">

					<form action="editAR" method="post">

						<div class="row">

							<div class="col-lg-6">

								<div class="form-group">
									<label>Company Name<span class="req">*</span>:
									</label> <input type="text" class="form-control"
										placeholder="Enter valid company name" name="comName" value="<%=rec.getComName() %>" required>
								</div>

							</div>

							<div class="col-lg-6">

								<div class="form-group">
									<label>Industry Type<span class="req">*</span>:
									</label> <select class="form-control" name="comType">
										<option value="Agro based Industry">Agro based
											Industry</option>
										<option value="Airline/ Travel/ Tourism">Airline/Travel/Tourism</option>
										<option value="Archi./Engg./Construction">Archi./Engg./Construction</option>
										<option value="Automobile/Industrial Machine">Automobile/Industrial
											Machine</option>
										<option value="Bank/Non-Bank Fin. Institution">Bank/Non-Bank
											Fin. Institution</option>
										<option value="Education">Education</option>
										<option value="Electronics/Consumer Durables">Electronics/Consumer
											Durables</option>
										<option value="Energy/Power/Fuel">Energy/Power/Fuel</option>
										<option value="Entertainment/Recreation">Entertainment/Recreation</option>
										<option value="Fire, Safety & Protection">Fire,
											Safety & Protection</option>
										<option value="Food & Beverage Industry">Food &
											Beverage Industry</option>
										<option value="Garments/Textile">Garments/Textile</option>
										<option value="Govt./Semi-Govt./Autonomous">Govt./Semi-Govt./Autonomous</option>
										<option value="Hospital/Diagnostic Center">Hospital/Diagnostic
											Center</option>
										<option value="Hotel/Restaurant">Hotel/Restaurant</option>
										<option value="Information Technology (IT)">Information
											Technology (IT)</option>
										<option value="Logistics/Transportation">Logistics/Transportation</option>
										<option value="Manufacturing (Heavy Industry)">Manufacturing
											(Heavy Industry)</option>
										<option value="Manufacturing (Light Industry)">Manufacturing
											(Light Industry)</option>
										<option value="Media/Advertising/Event Mgt.">Media/Advertising/Event
											Mgt.</option>
										<option value="NGO/Development">NGO/Development</option>
										<option value="Pharmaceuticals">Pharmaceuticals</option>
										<option value="Real Estate/Development">Real
											Estate/Development</option>
										<option value="Security Service">Security Service</option>
										<option value="Telecommunication">Telecommunication</option>
										<option value="Wholesale/Retail/Export-Import">Wholesale/Retail/Export-Import</option>
										<option value="Others">Others</option>
									</select>
								</div>

							</div>

						</div>
						
						<script type="text/javascript">
						    $('[name=comType]').val('<%=rec.getComType()%>');
						</script>

						<div class="row">
							<div class="col-lg-6">

								<div class="form-group">
									<label>Business/ Trade License No:</label> <input type="text"
										class="form-control" placeholder="License no." name="comTrade" value="<%=rec.getComTrade() %>">
								</div>

							</div>
							<div class="col-lg-6">

								<div class="form-group">
									<label>Company Address<span class="req">*</span>:
									</label>
									<textarea class="form-control" rows="3"
										placeholder="Address in detail" name="comAddress" required><%=rec.getComAddress() %></textarea>
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-lg-12">

								<div class="form-group">
									<label>Website URL:</label> <input type="text"
										class="form-control" placeholder="Official website address"
										name="comWebsite" value="<%=rec.getComWebsite() %>">
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-lg-6">

								<div class="form-group">
									<label>Official Email<span class="req">*</span>:
									</label> <input type="Email" class="form-control"
										placeholder="Official email" name="comEmail" value="<%=rec.getComEmail() %>" readonly>
								</div>

							</div>

							<div class="col-lg-6">

								<div class="form-group">
									<label>Password<span class="req">*</span>:
									</label> <input type="Password" class="form-control"
										placeholder="Enter login password" name="comPassword" value="<%=rec.getComPassword() %>" readonly>
								</div>

							</div>

						</div>

						<button type="submit" class="btn btn-primary"><i class="fa fa-edit"></i>&nbsp Update</button>

					</form>

				</div>
			</div>
		</div>

	</div>

</body>
</html>
