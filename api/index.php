<?php
///////////////////////
//ap/index.php
//Jim McNeely
//12/15/2014
/////////////////
//REST api using SLIM framework
////////////////////////
require "cfg.php";
require 'Slim/Slim.php';
$response_code = null;

//connect to MySQL

$connection = @mysql_connect($host,$user,$pw);
if( ! $connection )
{
	//can't connect to mysql database
	http_response_code(500);
	$output['error'] = 1;
	$output['errorMessage'] = "Can't connect to MySQL: " . mysql_error();
	$api_result = json_encode($output);
	echo $api_result;
	exit;
}

$db = @mysql_select_db($db, $connection );
if( ! $db )
{
	//can't select mysql database
	http_response_code(500);
	$output['error'] = 1;
	$output['errorMessage'] = "Can't select database: " . mysql_error();
	$api_result = json_encode($output);
	echo $api_result;
	exit;
}
/////////////////////////////////
//route incoming request
/////////////////////////////////

\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();
global $response_status;

$app->get('/readstudents', function () {
	$result = read_students();
	echo $result;
	});
$app->post('/readstudentsstaff', function () {
	$result = read_students_staff($_POST['weekof_submit']);
	echo $result;
	});
		
$app->post('/updatestudent', function() {
	$result = update_student($_POST);
	echo $result;
	});
	
$app->post('/deletestudent', function() {
	$result = delete_student($_POST['id']);
	echo $result;
	});
	
$app->get('/readoptions', function() {
	$result = read_options();
	echo $result;
});

$app->post('/readselections', function() {
	$result = read_selections_active($_POST['id_student'], $_POST['weekof_submit'], $_POST['assessor'], $_POST['dimension'], $_POST['capability']);
	echo $result;
});

$app->post('/readselectionsoverview', function() {
	$result = read_selections_overview($_POST['id_student'], $_POST['weekof_submit'], $_POST['assessor']);
// 	$result = read_selections_overview('7', '2015-01-07', 'Counselor');
	echo $result;
});

$app->post('/updateoption', function() {
	$result = update_option($_POST);
	echo $result;
});
	
$app->post('/update-admin-auth', function() {
	$result = updateAdminAuth($_POST['user'], $_POST['pw1']);
	echo $result;
});

$app->post('/update-staff-auth', function() {
	$result = updateStaffAuth($_POST['user'], $_POST['pw1']);
	echo $result;
});

$app->post('/setselection', function() {
	$result = set_selection($_POST['id_option'], $_POST['id_student'], $_POST['score'], $_POST['active'], $_POST['assessor'], $_POST['dimension'], $_POST['capability'], $_POST['weekof_submit']);
	echo $result;
});

$app->post('/checkcounts', function() {
	$result = check_counts($_POST['id_student'], $_POST['assessor'], $_POST['weekof_submit']);
	echo $result;
});

$app->run();

/////////////////////////////////////////////////
//Read Whole Student List
/////////////////////////////////////////////////
function read_students()
{
	global $app;
	
	$query = "select * from student WHERE deleted != 1";
	$result = @mysql_query($query);
	if ( ! $result )
	{
		// check for a mysql error and return 1 and mysql error if found here
		$app->response->setStatus(500);
		$output['error'] = 1;
		$output['errorMessage'] = "Bad query response MySQL: " . mysql_error();
	}
	else
	{
		while($row = mysql_fetch_array($result)) 
			{
				$outputline = array(
				'id' => $row['id'],
				'name_first' => $row['name_first'],
				'name_last' => $row['name_last'],
				'active' => $row['active'],
				'date_create' => $row['date_create'],
				'date_modify' => $row['date_modify'],
				'p1_name_first' => $row['p1_name_first'],
				'p1_name_last' => $row['p1_name_last'],
				'p1_carrier' => $row['p1_carrier'],
				'p1_mobile' => $row['p1_mobile'],
				'p1_email' => $row['p1_email'],
				'p2_name_first' => $row['p2_name_first'],
				'p2_name_last' => $row['p2_name_last'],
				'p2_carrier' => $row['p2_carrier'],
				'p2_mobile' => $row['p2_mobile'],
				'p2_email' => $row['p2_email']);
		
				$output[] = $outputline;
			}
	}
	return json_encode($output);
}

/////////////////////////////////////////////////
//Read Whole Student List for Staff interface
/////////////////////////////////////////////////
function read_students_staff($weekof)
{
	global $app;
	
	$query = "SELECT stu.name_first, stu.name_last, stu.id, sel1.active as counselor, sel2.active as house_director, sel3.active as mentor, sel4.active as teacher 
		FROM student stu 
		LEFT JOIN selection sel1 ON stu.id = sel1.id_student AND '$weekof' = sel1.weekof AND 'Counselor' = sel1.assessor AND '1' = sel1.active 
		LEFT JOIN selection sel2 ON stu.id = sel2.id_student AND '$weekof' = sel2.weekof AND 'House Director' = sel2.assessor AND '1' = sel2.active 
		LEFT JOIN selection sel3 ON stu.id = sel3.id_student AND '$weekof' = sel3.weekof AND 'Mentor' = sel3.assessor AND '1' = sel3.active 
		LEFT JOIN selection sel4 ON stu.id = sel4.id_student AND '$weekof' = sel4.weekof AND 'Teacher' = sel4.assessor AND '1' = sel4.active 
		WHERE stu.active = 1
		GROUP BY stu.id ORDER BY stu.name_last, stu.name_first";
		
// 		echo $query;
		
	$result = @mysql_query($query);
	if ( ! $result )
	{
		// check for a mysql error and return 1 and mysql error if found here
		$app->response->setStatus(500);
		$output['error'] = 1;
		$output['errorMessage'] = "Bad query response MySQL: " . mysql_error();
	}
	else
	{
		while($row = mysql_fetch_assoc($result)) 
			{
				$outputline = $row;
				if(! $row['counselor'] || ! $row['house_director'] || ! $row['mentor'] || ! $row['teacher'])
				{
					$outputline['assessor_code'] = 'all_open ';
				}
				if(! $row['counselor'])
				{
					$outputline['assessor_code'] .= 'counselor_open ';
				}
				if(! $row['house_director'])
				{
					$outputline['assessor_code'] .= 'house_director_open ';
				}
				if(! $row['mentor'])
				{
					$outputline['assessor_code'] .= 'mentor_open ';
				}
				if(! $row['teacher'])
				{
					$outputline['assessor_code'] .= 'teacher_open ';
				}
				
				$output[] = $outputline;
			}
	}
	return json_encode($output);
}




/////////////////////////////////////////////////
//Update Selected Student
/////////////////////////////////////////////////
function update_student($student_data)
{
	global $app;
	
	if(! $student_data['id'])
	{
		$query = "INSERT INTO student (name_first, name_last, active, p1_name_first, p1_name_last, p1_carrier, p1_mobile, p1_email, p2_name_first, p2_name_last, p2_carrier, p2_mobile, p2_email) VALUES(";
		$query .= "'" . mysql_real_escape_string($student_data['name_first']) . "', ";
		$query .= "'" . mysql_real_escape_string($student_data['name_last']) . "', ";
		$query .= "'{$student_data['active']}', ";
		$query .= "'" . mysql_real_escape_string($student_data['p1_name_first']) . "', ";
		$query .= "'" . mysql_real_escape_string($student_data['p1_name_last']) . "', ";
		$query .= "'{$student_data['p1_carrier']}', ";
		$query .= "'{$student_data['p1_mobile']}', ";
		$query .= "'{$student_data['p1_email']}', ";
		$query .= "'" . mysql_real_escape_string($student_data['p2_name_first']) . "', ";
		$query .= "'" . mysql_real_escape_string($student_data['p2 _name_last']) . "', ";
		$query .= "'{$student_data['p2_carrier']}', ";
		$query .= "'{$student_data['p2_mobile']}', ";
		$query .= "'{$student_data['p2_email']}')";
	}
	else
	{
		$query = "UPDATE student SET ";
		$query .= "name_first = '" . mysql_real_escape_string($student_data['name_first']) . "',";
		$query .= "name_last = '" . mysql_real_escape_string($student_data['name_last']) . "',";
		$query .= "active = '" . ($student_data['active'] ? 1 : 0 ) . "',";
		$query .= "date_create = '{$student_data['date_create']}',";
		$query .= "date_modify = '{$student_data['date_modify']}',";
		$query .= "p1_name_first = '" . mysql_real_escape_string($student_data['p1_name_first']) . "',";
		$query .= "p1_name_last = '" . mysql_real_escape_string($student_data['p1_name_last']) . "',";
		$query .= "p1_carrier = '{$student_data['p1_carrier']}',";
		$query .= "p1_mobile = '{$student_data['p1_mobile']}',";
		$query .= "p1_email = '{$student_data['p1_email']}',";
		$query .= "p1_name_first = '" . mysql_real_escape_string($student_data['p2_name_first']) . "',";
		$query .= "p1_name_last = '" . mysql_real_escape_string($student_data['p2_name_last']) . "',";
		$query .= "p2_carrier = '{$student_data['p2_carrier']}',";
		$query .= "p2_mobile = '{$student_data['p2_mobile']}',";
		$query .= "p2_email = '{$student_data['p2_email']}' ";
		$query .= "WHERE id = '{$student_data['id']}'";
	}
	
	
	$result = @mysql_query($query);
	if ( ! $result )
	{
		// check for a mysql error and return 1 and mysql error if found here
		$app->response->setStatus(500);
		$output['result'] = 1;
		$output['errorMessage'] = "Bad query response MySQL: " . mysql_error();
		
	}
	else
	{
		$output['error'] = 0;
		$output['result'] = "Student {$student_data['id']} has been successfully updated";
	}
	return json_encode($output);
}

/////////////////////////////////////////////////
//Mark a Student as Deleted
/////////////////////////////////////////////////
function delete_student($id)
{
	global $app;
	
	$query = "UPDATE student SET deleted = '1' WHERE id = '$id'";
	
	$result = @mysql_query($query);
	if ( ! $result )
	{
		// check for a mysql error and return 1 and mysql error if found here
		$app->response->setStatus(500);
		$output['result'] = 1;
		$output['errorMessage'] = "Bad query response MySQL: " . mysql_error();
		
	}
	else
	{
		$output['error'] = 0;
		$output['result'] = "Student {$student_data['id']} has been successfully updated";
	}
	return json_encode($output);
}

/////////////////////////////////////////////////
//Read Whole Option List
/////////////////////////////////////////////////
function read_options()
{
	global $app;
	
	$query = "SELECT * from `option` WHERE `deleted` <> 1";
	
	mysql_set_charset('UTF8'); //if you don't do this, records with option_text with foreign characters like é or ñ return null.	
	$result = @mysql_query($query);
	if ( ! $result )
	{
		// check for a mysql error and return 1 and mysql error if found here
		$app->response->setStatus(500);
		$output['error'] = 1;
		$output['errorMessage'] = "Bad query response MySQL: " . mysql_error();
	}
	else
	{
		while($row = mysql_fetch_assoc($result)) 
			{
				$outputline = $row;
				$outputline['filter_str'] = str_replace(' ', '_', $row['dimension']) . '_' . $row['capability'];
				$output[] = $outputline;
			}
	}
	return json_encode($output);
}

/////////////////////////////////////////////////
//Read Selection List
/////////////////////////////////////////////////
function read_selections_active($id_student, $weekof, $assessor, $dimension, $capability)
{
	global $app;
	
	$query = "SELECT o.id id_option, o.option_text, s.active selection_active from `option` o 
		LEFT JOIN selection s ON 
		o.id = s.id_option AND 
		{$id_student} = s.id_student AND 
		'{$weekof}' = s.weekof AND 
		'{$assessor}' = s.assessor 
		WHERE 
		o.dimension = '{$dimension}' AND 
		o.capability = '{$capability}' AND 
		o.active = 1 AND 
		o.deleted <> 1 
		ORDER BY o.id";
	
	mysql_set_charset('UTF8'); //if you don't do this, records with option_text with foreign characters like é or ñ return null.	
	$result = @mysql_query($query);
	if ( ! $result )
	{
		// check for a mysql error and return 1 and mysql error if found here
		$app->response->setStatus(500);
		$output['error'] = 1;
		$output['errorMessage'] = "Bad query response MySQL: " . mysql_error();
	}
	else
	{
		while($row = mysql_fetch_assoc($result)) 
			{
				$outputline = $row;
// 				$outputline['filter_str'] = str_replace(' ', '_', $row['dimension']) . '_' . $row['capability'];
				$output[] = $outputline;
			}
	}
	return json_encode($output);
}


/////////////////////////////////////////////////
//Update Selection Option Entry
/////////////////////////////////////////////////
function update_option($option_data)
{
	global $app;
	
	if( substr($option_data['id'],0,3) == "new" )
	{
		$query = "INSERT INTO `option` ( option_text, active, dimension, capability, deleted ) VALUES (";
		$query .= "'" . mysql_real_escape_string($option_data['option_text']) . "',";
		$query .= "'{$option_data['active']}',";
		$query .= "'{$option_data['dimension']}',";
		$query .= "'{$option_data['capability']}',";
		$query .= "'{$option_data['deleted']}')";
	}
	else
	{
		$query = "UPDATE `option` SET ";
		$query .= "option_text = '" . mysql_real_escape_string($option_data['option_text']) . "',";
		$query .= "active = '{$option_data['active']}',";
		$query .= "deleted = '{$option_data['deleted']}' ";
		$query .= "WHERE id = '{$option_data['id']}'";
	}
	
	
	$result = @mysql_query($query);
	if ( ! $result )
	{
		// check for a mysql error and return 1 and mysql error if found here
		$app->response->setStatus(500);
		$output['result'] = 1;
		$output['errorMessage'] = "Bad query response MySQL: " . mysql_error();
		
	}
	else
	{
		$output['error'] = 0;
		$output['result'] = "Selection option {$option_data['id']} has been successfully updated";
	}

	return json_encode($output);
}

/////////////////////////////////////////////////////
//update admin user/pw
/////////////////////////////////////////////////////
function updateAdminAuth($user, $pw)
{

	global $app;
	
	$query = "UPDATE user SET user = '$user', password = '$pw' WHERE role = 'admin'";
	
	$result = @mysql_query($query);
	if ( ! $result )
	{
		// check for a mysql error and return 1 and mysql error if found here
		$app->response->setStatus(500);
		$output['error'] = 1;
		$output['result'] = "Bad query response MySQL: " . mysql_error();
	}
	else
	{
		$output['error'] = 0;
		$output['result'] = "Student {$student_data['id']} has been successfully updated";
	}
	return json_encode($output);
}

/////////////////////////////////////////////////////
//update admin user/pw
/////////////////////////////////////////////////////
function updateStaffAuth($user, $pw)
{

	global $app;
	
	$query = "UPDATE user SET user = '$user', password = '$pw' WHERE role = 'staff'";
	
	$result = @mysql_query($query);
	if ( ! $result )
	{
		// check for a mysql error and return 1 and mysql error if found here
		$app->response->setStatus(500);
		$output['error'] = 1;
		$output['result'] = "Bad query response MySQL: " . mysql_error();
		
	}
	else
	{
		$output['error'] = 0;
		$output['result'] = "Student {$student_data['id']} has been successfully updated";
	}
	return json_encode($output);
}

//////////////////////////////////////////////////////
//set selection active for a single option
//////////////////////////////////////////////////////
function set_selection($id_option, $id_student, $score, $active, $assessor, $dimension, $capability, $weekof)
{
	global $app;
	
	$query = "REPLACE INTO selection( id_student, id_option, score, active, assessor, dimension, capability, weekof ) VALUES (";
	$query .= "'$id_student', '$id_option', '$score', '$active', '$assessor', '$dimension', '$capability', '$weekof') ";
// 	$query .= "ON DUPLICATE KEY UPDATE SET id_student = '$id_student', id_option = '$id_option', score = '$score', ";
// 	$query .= "active = '$active', assessor = '$assessor', dimension = '$dimension', capability = '$capability', weekof = '$weekof'";
	
// 	echo "$query\n";
	
	$result = @mysql_query($query);
	if ( ! $result )
	{
		// check for a mysql error and return 1 and mysql error if found here
		$app->response->setStatus(500);
		$output['error'] = 1;
		$output['result'] = "Bad query response MySQL: " . mysql_error();
		
	}
	else
	{
		$output['error'] = 0;
		$output['result'] = "Selection has been successfully updated";
	}
	return json_encode($output);
}

//////////////////////////////////////////////////////
//check selection counts per student/week/assessor
//////////////////////////////////////////////////////
function check_counts($id_student, $assessor, $weekof)
{
	global $app;
	
	$query = "SELECT count(*) AS selection_count, sum(score) AS selection_score_ttl, ROUND(sum(score) / count(*), 2) AS selection_score_average, '1' as yes FROM selection where id_student = '$id_student' AND assessor = '$assessor' AND weekof = '$weekof' AND active = '1'";
	
// 	echo $query;
	
	mysql_set_charset('UTF8'); //if you don't do this, records with option_text with foreign characters like é or ñ return null.	
	$result = @mysql_query($query);
	if ( ! $result )
	{
		// check for a mysql error and return 1 and mysql error if found here
		$app->response->setStatus(500);
		$output['error'] = 1;
		$output['errorMessage'] = "Bad query response MySQL: " . mysql_error();
		$output['query'] = $query;
	}
	else
	{
		while($row = mysql_fetch_assoc($result)) 
			{
				$outputline = $row;
				$output[] = $outputline;
			}
	}
	return json_encode($output);
}

function read_selections_overview($id_student, $weekof, $assessor)
{
	global $app;
	
	$query = "SELECT sl.assessor,  sl.dimension, sl.capability, st.name_first, st.name_last, st.id, o.option_text ";
	$query .= "FROM selection sl ";
	$query .= "LEFT JOIN student st ON sl.id_student = st.id ";
	$query .= "LEFT JOIN `option` o ON sl.id_option = o.id ";
	$query .= "WHERE ";
	$query .= "sl.weekof = '$weekof' ";
	$query .= "AND ";
	$query .= "st.id = '$id_student' ";
	$query .= "AND ";
	$query .= "sl.assessor = '$assessor' ";
	$query .= "AND sl.active = 1 ";
	$query .= "ORDER BY FIELD(sl.dimension, 'Physical Wellbeing', 'Spiritual Mindfulness', 'Mental Toughness', 'Emotional Insight', 'Family Unity'), ";
	$query .= "FIELD(sl.capability, 'Reaction', 'Rejection', 'Reflection', 'Resolution', 'Adaption', 'Exhaustion', 'Activation', 'Integration')";

	$dimension = array('Physical Wellbeing', 'Spiritual Mindfulness', 'Mental Toughness', 'Emotional Insight', 'Family Unity');
	$capability = array('Reaction', 'Rejection', 'Reflection', 'Resolution', 'Adaption', 'Exhaustion', 'Activation', 'Integration');


	mysql_set_charset('UTF8'); //if you don't do this, records with option_text with foreign characters like é or ñ return null.	
	$result = @mysql_query($query);
	if ( ! $result )
	{
		// check for a mysql error and return 1 and mysql error if found here
		$app->response->setStatus(500);
		$output['error'] = 1;
		$output['errorMessage'] = "Bad query response MySQL: " . mysql_error();
	}
	else
	{
		while($row = mysql_fetch_assoc($result)) 
		{
			$testy = $data_hash[$row['dimension']][$row['capability']];
			$data_hash[$row['dimension']][$row['capability']] = ($testy ? $testy . "\n<hr>\n" : "") . $row['option_text'];
		}
			
		foreach($dimension as $d)
		{
			$output .= "<tr><td><b>$d</b></td>";
			foreach($capability as $c)
			{
				$output .= "<td>";
				$output .= $data_hash[$d][$c] ? $data_hash[$d][$c] . "" : "";
				$output .= "</td>";
			}
			$output .= "</tr>";
		}
	}
	return $output;
}

?>