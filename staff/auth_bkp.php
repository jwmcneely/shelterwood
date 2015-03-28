<?php
// Start the session
session_start();

if($_SESSION['auth_status_staff'] != 'authorized')
{
	if( $_SESSION['user_correct_staff'] == '' || $_SESSION['pw_correct_staff'] == '' )
	{
		//initial login attempt has not been made
		// Set session auth credentials; get this from a database query
		
		require "../api/cfg.php";

		//connect to MySQL

		$connection = mysql_connect($host,$user,$pw) or die("auth.php: could not connect to mysql server");
		$db = @mysql_select_db($db, $connection ) or die("auth.php: could connect to mysql server, but could not connect to database");
		
		$query = "SELECT * FROM user WHERE role = 'staff'";
		
		$result = mysql_query($query) or die("auth.php: could connect to server and database, but could not query database.");
		$row = mysql_fetch_array($result);
		
		$_SESSION["user_correct_staff"] = $row['user'];
		$_SESSION["pw_correct_staff"] = $row['password'];
	}
	
	//check auth attempt
	if( $_POST['user'] === $_SESSION['user_correct_staff'] && $_POST['pw'] === $_SESSION['pw_correct_staff'] )
	{
		//authorized!
		//echo "auth attempt auth'd! branch<br>\n";
		$_SESSION['auth_status_staff'] = 'authorized';
	
		$auth = 'authorized';
	}
	else if( ! $_SESSION['touched_staff'] )
	{
		$_SESSION['auth_status_staff'] = 'uninitialized';
	}
	else
	{
		$auth = 'unauthorized';
		$_SESSION['auth_status_staff'] = 'unauthorized';
	}
	
	$_SESSION['touched_staff'] = "yes";

	if($auth != 'authorized')
	{
		header("Location: http://bigfresh.net/staff/login.php");
	}
	else
	{
		header("Location: http://bigfresh.net/staff");
	}
}
?>