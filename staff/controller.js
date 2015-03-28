//////////////////////////////////////////
//students page
//////////////////////////////////////////
swStaffApp.controller('studentsCtrl', function($scope, $http) {
	
	$scope.formData = {};
	$scope.formData.weekof = moment().format("MM/DD/YYYY");
	
	$scope.formData.weekof_submit = moment($scope.formData.weekof, "MM/DD/YYYY").format("YYYY-MM-DD");
	
	$scope.dateToWednesday = function()
	{
		var d = moment($scope.formData.weekof,"MM/DD/YYYY").format("d");
		if(d < 3)
		{
			var ddd = moment($scope.formData.weekof,"MM/DD/YYYY").day(-4).format("MM/DD/YYYY");
		}
		else
		{
			var ddd = moment($scope.formData.weekof,"MM/DD/YYYY").day(3).format("MM/DD/YYYY");
		}
		$scope.formData.weekof = ddd;
		$scope.formData.weekof_submit = moment($scope.formData.weekof, "MM/DD/YYYY").format("YYYY-MM-DD");
	};
	
	$scope.dtw_refresh = function()
	{
		console.log("initiating dtw_fresh()");
		$scope.dateToWednesday();
		console.log("about to getStudents()");
		$scope.getStudents();
		console.log("should have gotten students");
	}
	
	$scope.getStudents = function()
	{
		$http({
			method  : 'POST',
			url     : '/api/index.php/readstudentsstaff',
			data    : $.param($scope.formData),  // pass in data as strings
			headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
		})
			.success(function(data) {
				// console.log(data);
	
				if (! data.length ) {
					// if not successful, bind errors to error variables
					$scope.errorNumber = data.error;
					$scope.errorMessage = data.errorMessage;
					$scope.result = "invalid submission";
					console.log("no query results");
// 					console.log(data);
				} else {
					// if successful, bind success message to message
					$scope.json_students = data;
					console.log($scope.json_students);
				}
			})
			.error(function(data){
				$scope.result = "http error";
				$scope.message = "There was an error, and your quote could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
				console.log("error: " + data.errorMessage);
				});
	};
 	
});


//////////////////////////////////////////
//overview page
//////////////////////////////////////////
swStaffApp.controller('overviewCtrl', function($scope, $http, $routeParams, $sce) {
 	
	$scope.select = {};
	$scope.select.id_student = $routeParams.id_student;
 	$scope.name_student = $routeParams.name_student.replace("_", " ");
	console.log($scope.name_student);
	$scope.select.weekof = moment($routeParams.weekof, "YYYY-MM-DD").format("MM/DD/YYYY");
	$scope.select.weekof_submit = moment($scope.weekof, "MM/DD/YYYY").format("YYYY-MM-DD");
	$scope.select.assessor = $routeParams.assessor;
	$scope.html_selections = "";
	
	$scope.dateToWednesday = function()
	{
		var d = moment($scope.select.weekof,"MM/DD/YYYY").format("d");
		console.log(d);
		if(d < 3)
		{
			var ddd = moment($scope.select.weekof,"MM/DD/YYYY").day(-4).format("MM/DD/YYYY");
		}
		else
		{
			var ddd = moment($scope.select.weekof,"MM/DD/YYYY").day(3).format("MM/DD/YYYY");
		}
		$scope.select.weekof = ddd;
		$scope.select.weekof_submit = moment($scope.select.weekof, "MM/DD/YYYY").format("YYYY-MM-DD");
	};
	
	$scope.change_week = function(direction)
	{
		$scope.select.weekof = moment($scope.select.weekof,"MM/DD/YYYY").add( (direction == "next" ? 7 : -7 ), 'days' ).format("MM/DD/YYYY");
		$scope.refresh_selections();
	};
	
	
	
	$scope.get_selections = function()
	{
		$http({
			method  : 'POST',
			url     : '/api/index.php/readselectionsoverview',
			data    : $.param($scope.select),  // pass in data as strings
			headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
		})
			.success(function(selectionsdata) {
				console.log(selectionsdata);
	
				if (! selectionsdata ) {
					//nothing returned
					$scope.json_selections = {};
				} else {
					// successful
					$scope.html_selections = selectionsdata;
					console.log("successful submission");
					console.log(selectionsdata);
				}
			})
			.error(function(selectionsdata){
				$scope.result = "http error";
				$scope.message = "There was an error, and your quote could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
				console.log("error: " + selectionsdata.errorMessage);
				});
	}
	
	$scope.refresh_selections = function()
	{
		console.log("refreshing selections now.");
		$scope.dateToWednesday();
		$scope.get_selections();
	}
	
	$scope.renderHtml = function(html_code)
	{
		return $sce.trustAsHtml(html_code);
	};
	
 	
});

//////////////////////////////////////////
//entry page
//////////////////////////////////////////
swStaffApp.controller('entryCtrl', function($scope, $http, $routeParams) {
 	
 	$scope.id_student = $routeParams.id_student;
 	$scope.name_student = $routeParams.name_student.replace("_", " ");
 	$scope.select = {};
 	$scope.select.id_student = $scope.id_student;
 	$scope.select.assessor = $routeParams.assessor.replace("_", " ");
 	$scope.select.dimension = "Physical Wellbeing";
 	$scope.select.capability = "Reaction";
	$scope.select.weekof = moment($routeParams.weekof, "YYYY-MM-DD").format("MM/DD/YYYY");
	$scope.select.weekof_submit = moment($scope.select.weekof, "MM/DD/YYYY").format("YYYY-MM-DD");
	$scope.count_now = 0;
	$scope.scorelist = {
		"Reaction": 1,
		"Rejection": 2,
		"Resolution": 3,
		"Reflection": 4,
		"Resolution": 5,
		"Adaptation": 6,
		"Exhaustion": 7,
		"Activation": 8,
		"Integration": 9
		};
		
	
	$scope.setsel = {};
	
	$scope.dateToWednesday = function()
	{
		var d = moment($scope.select.weekof,"MM/DD/YYYY").format("d");
		console.log(d);
		if(d < 3)
		{
			var ddd = moment($scope.select.weekof,"MM/DD/YYYY").day(-4).format("MM/DD/YYYY");
		}
		else
		{
			var ddd = moment($scope.select.weekof,"MM/DD/YYYY").day(3).format("MM/DD/YYYY");
		}
		$scope.select.weekof = ddd;
		$scope.select.weekof_submit = moment($scope.select.weekof, "MM/DD/YYYY").format("YYYY-MM-DD");
		$scope.get_selections();
	};
	
	$scope.change_week = function(direction)
	{
		$scope.select.weekof = moment($scope.select.weekof,"MM/DD/YYYY").add( (direction == "next" ? 7 : -7 ), 'days' ).format("MM/DD/YYYY");
		$scope.select.weekof_submit = moment($scope.select.weekof, "MM/DD/YYYY").format("YYYY-MM-DD");
		$scope.get_selections();
	};
	
	$scope.filterx = function(x,y)
	{
		z = x.replace(" ", "_") + "_" + y;
		return z;
	}
	
	 	$scope.get_selections = function()
	{
// 		$scope.select.weekof_submit = moment($scope.select.weekof, "MM/DD/YYYY").format("YYYY-MM-DD");
		console.log("hello get_selections()!");
		$http({
			method  : 'POST',
			url     : '/api/index.php/readselections',
			data    : $.param($scope.select),  // pass in data as strings
			headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
		})
			.success(function(selectionsdata) {
				// console.log(selectionsdata);
	
				if (! selectionsdata[0].id_option ) {
					//nothing returned
					$scope.json_selections = {};
				} else {
					// successful
					$scope.json_selections = selectionsdata;
					console.log("successful submission");
					console.log(selectionsdata);
				}
			})
			.error(function(selectionsdata){
				$scope.result = "http error";
				$scope.message = "There was an error, and your quote could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
				console.log("error: " + selectionsdata.errorMessage);
				});
	};
 	
 	$scope.set_selection_with_countcheck = function(id_option, active)
 	{
 		$http({
			method  : 'POST',
			url     : '/api/index.php/checkcounts',
			data    : $.param($scope.select),  // pass in data as strings
			headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
		})
			.success(function(countdata) {
				// console.log(selectionsdata);
	
				if (! countdata[0].selection_count ) {
					//nothing returned
					//shouldn't have happened, display error somehow
				} else {
					// successful
					console.log("successful count query: " + countdata[0].selection_count + "; active: " + active);
					if(countdata[0].selection_count < 3)
					{
						console.log("Allow selection, less than 3.");
						$scope.set_selection(id_option, active);
						$scope.warning = "";
					}
					else if(active == 1)
					{
						console.log("Allow deselection, active == 1 and setting to 0.");
						$scope.set_selection(id_option, active);
						$scope.warning = "";
					}
					else
					{
						console.log("You cannot select more than three options for a student per week.");
						$scope.warning = "You cannot select more than three options for a student per week.";
					}
				}
			})
			.error(function(countdata){
				$scope.result = "http error";
				$scope.message = "There was an error, and your quote could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
				console.log("error: " + countdata.errorMessage);
				console.log(countdata);
				});
 	};
	
	$scope.set_selection = function(id_option, active)
	{
		console.log(id_option + ": " + active);
		$scope.setsel = angular.copy($scope.select);
		$scope.setsel.id_option = id_option;
		$scope.setsel.active = (active == 1 ? 0 : 1 );
		$scope.setsel.score = $scope.scorelist[$scope.setsel.capability];
		console.log("active: " + $scope.setsel.active);
		console.log($scope.setsel);
	
		$http({
			method  : 'POST',
			url     : '/api/index.php/setselection',
			data    : $.param($scope.setsel),  // pass in data as strings
			headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
		})
			.success(function(selupdatedata) {
				// console.log(selectionsdata);

				if (! selupdatedata.result ) {
					//nothing returned; something went wrong!
					$scope.result = "http error";
					$scope.message = "There was an error, and your quote could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
					console.log("error: " + selupdatedata.errorMessage);
				} else {
					// successful
					console.log("successful submission");
					console.log(selupdatedata);
		// 			if( $scope.check_selection_count. + $scope.setsel.active > 0 ) // to avoid division by zero
// 					{
// 						$scope.score_avg = Math.round( ( ($scope.check_selection_count.selection_count + $scope.setsel.active) / ( $scope.check_selection_count.selection_score_ttl + ($scope.setsel.score * $scope.setsel.active) ) * 10 ) / 10;
// 					}
// 					else
// 					{
// 						$scope.score_avg = 0;
// 					}
					$scope.get_selections(); //refresh things
				}
			})
			.error(function(selupdatedata){
				$scope.result = "http error";
				$scope.message = "There was an error, and your quote could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
				console.log("error: " + selupdatedata.errorMessage);
				});
	};
	
	$scope.check_selection_count = function()
	{
		console.log("hello check_selection_count!");
		$http({
			method  : 'POST',
			url     : '/api/index.php/checkcounts',
			data    : $.param($scope.select),  // pass in data as strings
			headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
		})
			.success(function(checkresult) {
	
				if ( checkresult[0].yes != '1' ) {
					//nothing returned; something went wrong!
					$scope.result = "query error";
					$scope.message = "There was an error, and your quote could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
					console.log("error: " + selupdatedata.errorMessage);
					return -1;
				} else {
					// successful
					console.log("successful submission check_selection_count");
					console.log("checkresult[0].selection_count: " + checkresult[0].selection_count);
					$scope.check_selection_count = checkresult;
					console.log("selection_count var: " + $scope.check_selection_count[0].selection_count);
				}
			})
			.error(function(checkresult){
				$scope.result = "http error";
				$scope.message = "There was an error, and your quote could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
				console.log("error: " + checkresult.errorMessage);
				return -2;
				});
		
	}
});