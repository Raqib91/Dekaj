<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Recruiter Account</title>
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

	<div class="wrapper">

		<div class="mn">

			<a href="index.jsp" class="logo">DeKaj</a>

			<ul>
				<li><a href="browseJob.jsp">Browse Jobs</a></li>
				<li><a href="about.jsp">About</a></li>
				<li><a href="contact.jsp">Contact</a></li>
				<li><a href="login.jsp">Login</a></li>
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

		<div class="container">
			<div class="card">
				<div class="card-header">
					<span>Recruiter Registration Form</span>
				</div>
				<div class="card-body">

					<form action="recReg" method="post">

						<div class="row">

							<div class="col-lg-6">

								<div class="form-group">
									<label>Company Name<span class="req">*</span>:
									</label> <input type="text" class="form-control"
										placeholder="Enter valid company name" name="comName" required>
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

						<div class="row">
							<div class="col-lg-6">

								<div class="form-group">
									<label>Business/ Trade License No:</label> <input type="text"
										class="form-control" placeholder="License no." name="comTrade">
								</div>

							</div>
							<div class="col-lg-6">

								<div class="form-group">
									<label>Company Address<span class="req">*</span>:
									</label>
									<textarea class="form-control" rows="3"
										placeholder="Address in detail" name="comAddress" required></textarea>
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-lg-12">

								<div class="form-group">
									<label>Website URL:</label> <input type="text"
										class="form-control" placeholder="Official website address"
										name="comWebsite">
								</div>

							</div>
						</div>

						<div class="row">
							<div class="col-lg-6">

								<div class="form-group">
									<label>Official Email<span class="req">*</span>:
									</label> <input type="Email" class="form-control"
										placeholder="Official email" name="comEmail" required>
								</div>

							</div>

							<div class="col-lg-6">

								<div class="form-group">
									<label>Password<span class="req">*</span>:
									</label> <input type="Password" class="form-control"
										placeholder="Enter login password" name="comPassword" required>
								</div>

							</div>

						</div>

						<button type="submit" class="btn btn-primary">Submit</button>

					</form>

				</div>
			</div>
		</div>
		
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