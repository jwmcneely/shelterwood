<?php
// Start the session
session_start();
?>

<!DOCTYPE html>
<html>
<head>
	<!-- LOAD JQUERY -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
	<!-- Include meta tag to ensure proper rendering and touch zooming -->
		<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Include bootstrap stylesheets -->
    	<link rel="stylesheet" href="/includes/css/bootstrap/css/bootstrap.min.css">
    	
	<script>
		 $(document).ready( function() {
			$("#user").focus();
		});
	</script>

</head>

<body>

<div class="container">
	<br />
	<br />
	<div class="row">
		<div class="col-sm-4"></div>
			<div class="col-sm-4 text-center">
				<img src="/images/shelterwood-logo.png"><br>
				<h5>Staff Portal Login</h5>
			</div>
		<div class="col-sm-4"></div>
	</div>
	
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="form-group">
				<form method="post" action="auth.php">
					<label for="user">Username:</label>
					<input id="user" class="form-control" type="text" name='user'>
					<label for="pw">Password:</label>
					<input id="pw" class="form-control" type = "password" name='pw'><br/>
					<input class="btn btn-danger col-sm-12" type="submit">
				</form>
			</div>
		</div>
		<div class="col-sm-4"></div>
	</div>
	
	<?php
		if( $_SESSION['auth_status_staff'] == 'unauthorized')
		{
	?>
		<div class="row">
			<div class="col-sm-4"></div>
			<div class="col-sm-4 text-center text-danger">
				The system could not log you in. Please try again.
			</div>
			<div class="col-sm-4"></div>
		</div>
	<?php
		}
	?>
</div>

</body>
</html>