<?php
	require 'auth.php';
?>

<!DOCTYPE html>
<html>
	<head>
	<!-- Include meta tag to ensure proper rendering and touch zooming -->
		<meta http-equiv="Content-type" content="text/html; charset=utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
	<!-- LOAD JQUERY -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	<!-- LOAD ANGULAR AND ANGULAR-ROUTE -->
		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular.min.js"></script>
		<script src="/includes/js/angular-route.js"></script>
	<!-- LOAD MOMENT.JS for date handling -->
		<script src="/includes/js/moment.js"></script>
    <!-- Include bootstrap stylesheets -->
    	<link rel="stylesheet" href="/includes/css/bootstrap/css/bootstrap.min.css">
	<!-- Include custom stylesheet -->
    	<link rel="stylesheet" href="/includes/css/style.css">
    	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
	<!-- Include site's angular components -->
		<script src="/staff/app.js"></script>
		<script src="/staff/controller.js"></script>
	</head>
<body>

<div class="container">
	<div class="row">
		<div class="col-sm-12 text-center">
			<span class="h1">&nbsp</span><br>
			<span class="h1">&nbsp</span><br>
		</div>
	</div>
	
	<div ng-app="swStaffApp">
		<div ng-view></div>
	</div>
</div>
<?php
	require 'nav.php';
?>


</body>
</html>