<?php
// Start the session
session_start();

if($_SESSION['auth_status'] != 'authorized')
{
	if( $_SESSION['user_correct'] == '' || $_SESSION['pw_correct'] == '' )
	{
		//initial login attempt has not been made
		// Set session auth credentials; get this from a database query
		
		require "../api/cfg.php";

		//connect to MySQL

		$connection = mysql_connect($host,$user,$pw) or die("auth.php: could not connect to mysql server");
		$db = @mysql_select_db($db, $connection ) or die("auth.php: could connect to mysql server, but could not connect to database");
		
		$query = "SELECT * FROM user WHERE role = 'admin'";
		
		$result = mysql_query($query) or die("auth.php: could connect to server and database, but could not query database.");
		$row = mysql_fetch_array($result);
		$_SESSION["user_correct"] = $row['user'];
		$_SESSION["pw_correct"] = $row['password'];
	}
	
	//check auth attempt
	if( $_POST['user'] === $_SESSION['user_correct'] && $_POST['pw'] === $_SESSION['pw_correct'] )
	{
		//authorized!
		//echo "auth attempt auth'd! branch<br>\n";
		$_SESSION['auth_status'] = 'authorized';
	
		$auth = 'authorized';
	}
	else if( ! $_SESSION['touched'] )
	{
		$_SESSION['auth_status'] = 'uninitialized';
	}
	else
	{
		$auth = 'unauthorized';
		$_SESSION['auth_status'] = 'unauthorized';
	}
	
	$_SESSION['touched'] = "yes";

	if($auth != 'authorized')
	{
		header("Location: http://{$_SERVER['SERVER_NAME']}:{$_SERVER['SERVER_PORT']}/admin/login.php");
	}
	else
	{
		header("Location: http://{$_SERVER['SERVER_NAME']}:{$_SERVER['SERVER_PORT']}/admin");
	}
}
?>