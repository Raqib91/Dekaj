<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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

.container {
	width: 40%;
	margin-top: 70px;
}

.card {
	box-shadow: 2px 5px 10px #000;
}

.card-header {
	text-align: center;
	font-size: 2em;
	font-family: 'Lobster', cursive;
}

.card-body label {
	font-weight: 500;
}

.req {
	color: red;
}

@media screen and (max-width: 1200px) {
	.container {
		width: 50%;
	}
	.card-header {
		font-size: 30px;
	}
}

@media screen and (max-width: 1000px) {
	.container {
		width: 58%;
	}
	.card-header {
		font-size: 30px;
	}
}

@media screen and (max-width: 800px) {
	.container {
		width: 67%;
	}
	.card-header {
		font-size: 30px;
	}
}

@media screen and (max-width: 600px) {
	.container {
		width: 85%;
	}
	.card-header {
		font-size: 30px;
	}
}
</style>

</head>
<body>

	<div class="container">
		<div class="card">

			<form action="login" method="post">

				<div class="card-header">

					<span class="logo">DeKaj</span>

				</div>
				<div class="card-body">

					<div class="form-group">
						<label>Select Role<span class="req">*</span>:
						</label> <select class="form-control" name="role">
							<option>Employee</option>
							<option>Recruiter</option>
							<option>Admin</option>
						</select>
					</div>

					<div class="form-group">
						<label>Email<span class="req">*</span>:
						</label> <input type="Email" class="form-control"
							placeholder="Enter email" name="email" required>
					</div>

					<div class="form-group">
						<label>Password<span class="req">*</span>:
						</label> <input type="Password" class="form-control"
							placeholder="Enter password" name="password" required>
					</div>

					<a href="">Forgot password?</a>

				</div>

				<div class="card-footer">
					<center>
						<button type="submit" class="btn btn-primary">Login</button>
					</center>
				</div>

			</form>

		</div>
	</div>

	<br>
	<br>

</body>
</html>
