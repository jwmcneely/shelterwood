//////////////////////////////////////////
//student list page
//////////////////////////////////////////
swAdminApp.controller('studentsCtrl', function($scope, $http) {
 	
	$scope.message = "students";
	$scope.studentselectid = null;
	angular.element('#name_filter').focus();
	$scope.stsel = {};
	$scope.stsel.active = 1;
	
	$scope.stsel_original = angular.copy($scope.stsel);
	
	
	$scope.getStudents = function()
	{
		$http({
			method  : 'GET',
			url     : '/api/index.php/readstudents',
// 			data    : $.param($scope.formData),  // pass in data as strings
			headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
		})
			.success(function(data) {
				// console.log(data);
	
				if (! data[0].name_first ) {
					// if not successful, bind errors to error variables
					$scope.errorNumber = data.error;
					$scope.errorMessage = data.errorMessage;
					$scope.result = "invalid submission";
// 					console.log("invalid submission");
// 					console.log(data);
				} else {
					// if successful, bind success message to message
					$scope.json_students = data;
// 					$scope.message = "Thank you for submitting your gospel quote. It will be reviewed and its distinctiveness will assimilated into the collective."
					console.log("successful submission");
				}
			})
			.error(function(data){
				$scope.result = "http error";
				$scope.message = "There was an error, and your quote could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
				console.log("error: " + data.errorMessage);
				});
	};
		
	$scope.selectstudent = function (val)
	{
		console.log(angular.equals($scope.stsel, $scope.stsel_original));
		console.log($scope.stsel);
		console.log($scope.stsel_original);
		
		if(! angular.equals($scope.stsel, $scope.stsel_original))
		{
			//changes have been made which were not saved
			console.log($scope.stsel);
			console.log($scope.stsel_original);
			$scope.save_msg = "Please save your changes before selecting another student, or reload the page to discard the changes.";
		}
		else{
			//no unsaved changes, so select the student
			$scope.stsel_original = angular.copy(val);
			$scope.studentselectid = angular.copy(val.id);
			$scope.stsel = angular.copy(val);
		}
	};
	
	$scope.newstudent = function() //doesn't submit a student, just resets the form to blank, active = 1, deleted = 0
	{
				
		if(! angular.equals($scope.stsel, $scope.stsel_original))
		{
			//changes have been made which were not saved
			$scope.save_msg = "Please save your changes before creating a student, or reload the page to discard the changes.";
		}
		else{
			$scope.studentselectid = '';
			$scope.stsel = {};
			$scope.stsel.active = 1;
			$scope.stsel_original = angular.copy($scope.stsel);
			$scope.formy.$setPristine();
			$scope.save_msg = "";
		}
	};
	
	$scope.updateStudent = function()
	{
		$scope.stsel.p1_mobile = formatLocal("US", $scope.stsel.p1_mobile);
		$scope.stsel.p2_mobile = formatLocal("US", $scope.stsel.p2_mobile);
		
		$http({
			method  : 'POST',
			url     : '/api/index.php/updatestudent',
			data    : $.param($scope.stsel),  // pass in data as strings
			headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
		})
			.success(function(updata) {
				// console.log(updata);
	
				if (! updata.result ) {
					// not successful, bind errors to error variables
					$scope.errorNumber = updata.error;
					$scope.errorMessage = updata.errorMessage;
					$scope.result = "invalid submission";
					console.log("invalid submission");
					console.log(updata);
				} else {
					// successful, bind success message to message
					$scope.update_result = updata;
					$scope.result = "Student has been updated";
					$scope.stsel_original = angular.copy($scope.stsel);
					$scope.formy.$setPristine();
					$scope.save_msg = "";
					console.log("successful submission");
					$scope.getStudents();
				}
			})
			.error(function(updata){
				$scope.result = "http error";
				$scope.message = "There was an error, and your quote could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
				console.log("error: " + updata.errorMessage);
				});
	}; 
		
	$scope.deletestudent = function()
	{
		r = confirm("Are you sure you want to delete this student");
		if( r ){
		$http({
			method  : 'POST',
			url     : '/api/index.php/deletestudent',
			data    : $.param($scope.stsel),  // pass in data as strings
			headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
		})
			.success(function(deldata) {
				// console.log(updata);
	
				if (! deldata.result ) {
					// not successful, bind errors to error variables
					$scope.errorNumber = deldata.error;
					$scope.errorMessage = deldata.errorMessage;
					$scope.result = "invalid submission";
					console.log("invalid submission");
					console.log(deldata);
				} else {
					// successful, bind success message to message
					$scope.delete_result = deldata;
					$scope.result = "Student has been deleted";
					$scope.stsel_original = angular.copy($scope.stsel);
					$scope.stsel = {};
					$scope.stsel_original = {};
					$scope.formy.$setPristine();
					$scope.save_msg = "";
					console.log("student updated as deleted = 1");
					$scope.getStudents();
				}
			})
			.error(function(updata){
				$scope.result = "http error";
				$scope.message = "There was an error, and your quote could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
				console.log("error: " + updata.errorMessage);
				});
		}
	};
	
	$scope.phone1validfunction = function()
	{
		if( $scope.stsel.p1_mobile )
		{
			if( isValidNumber($scope.stsel.p1_mobile, "US") )
			{
				$scope.formy.p1_mobile.$setValidity("p1_mobile", true);
				$scope.stsel.p1_mobile = formatLocal("US", $scope.stsel.p1_mobile);
			}
			else
			{
				$scope.formy.p1_mobile.$setValidity("p1_mobile", false);
			}
		}
		else
		{
			$scope.formy.p1_mobile.$setValidity("p1_mobile", true);
		}
	};
	
	$scope.phone2validfunction = function()
	{
		if( $scope.stsel.p2_mobile )
		{
			if( isValidNumber($scope.stsel.p2_mobile, "US") )
			{
				$scope.formy.p2_mobile.$setValidity("p2_mobile", true);
				$scope.stsel.p2_mobile = formatLocal("US", $scope.stsel.p2_mobile);
			}
			else
			{
				$scope.formy.p2_mobile.$setValidity("p2_mobile", false);
			}
		}
		else
		{
			$scope.formy.p2_mobile.$setValidity("p2_mobile", true);
		}
	};
	
});

//////////////////////////////////////////
//options management page
//////////////////////////////////////////
swAdminApp.controller('optionsCtrl', function($scope, $http) {
 	
	$scope.dimensions = "Physical Wellbeing";
	$scope.capabilities = "Reaction";
	$scope.change_log = [];
	$scope.delete_log = [];
	$scope.new_id = 0;
	
	$scope.filterx = function(x,y)
	{
		z = x.replace(" ", "_") + "_" + y;
		return z;
	}
	
	$scope.getOptions = function()
	{
		$http({
			method  : 'GET',
			url     : '/api/index.php/readoptions',
// 			data    : $.param($scope.formData),  // pass in data as strings
			headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
		})
			.success(function(optionsdata) {
				// console.log(optionsdata);
	
				if (! optionsdata[0].id ) {
					//not successful; nothing returned
					$scope.errorNumber = optionsdata.error;
					$scope.errorMessage = optionsdata.errorMessage;
					$scope.result = "invalid submission";
				} else {
					// successful
					$scope.json_options = optionsdata;
					console.log("successful submission");
					console.log(optionsdata);
				}
			})
			.error(function(optionsdata){
				$scope.result = "http error";
				$scope.message = "There was an error, and your quote could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
				console.log("error: " + optionsdata.errorMessage);
				});
	};
	
	$scope.record_change = function(id)
	{
		if( $.inArray(id, $scope.change_log) == -1 )
		{
			$scope.change_log.push(id);
		}
	};
	
	$scope.record_change_delete = function(id)
	{
		if( $.inArray(id, $scope.delete_log) == -1 )
		{
			$scope.delete_log.push(id);
		}
		else
		{
			var index = $scope.delete_log.indexOf(id)
  			$scope.delete_log.splice(index, 1); 
		}
		$scope.record_change(id);
	};
	
	$scope.save_option_changes = function()
	{
// 		console.log("start save_option_changes");
		for( i = 0; i < $scope.json_options.length; i++)
		{
// 			console.log("this id: " + $scope.json_options[i].id + " is in " + $scope.change_log);
			
			if( $.inArray($scope.json_options[i].id, $scope.change_log) > -1 )
			{
				if($.inArray($scope.json_options[i].id, $scope.delete_log) > -1)
				{
					$scope.json_options[i].deleted = 1;
				}
				$http({
					method  : 'POST',
					url     : '/api/index.php/updateoption',
					data    : $.param($scope.json_options[i]),  // pass in data as strings
					headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
				})
					.success(function(optionupdatedata) {
						// console.log(optionupdatedata);

						if (! optionupdatedata.result ) {
							// if not successful, bind errors to error variables
							$scope.errorNumber = optionupdatedata.error;
							$scope.errorMessage = optionupdatedata.errorMessage;
							$scope.result = "invalid submission";
							console.log("invalid submission");
							console.log(optionupdatedata);
						} else {
							// if successful, bind success message to message
							$scope.errorMessage = "";
							$scope.json_optionupdateresult = optionupdatedata;
		// 					$scope.message = "Thank you for submitting your option. It will be reviewed and its distinctiveness will assimilated into the collective."
							console.log("successful submission");
							console.log(optionupdatedata);
							$scope.change_log = [];
							$scope.delete_log = [];
							$scope.getOptions();
						}
					})
					.error(function(optionupdatedata){
						$scope.result = "http error";
						$scope.errorMessage = "There was an error, and your option change could not be submitted. You live in a fallen world full of failures and frustrations, and this is one of them."
						console.log("error: " + optionupdatedata.errorMessage);
						});
			}
		}
		
	};
	
	$scope.add_new_option = function(index)
	{
		console.log("adding new option option row.");
		$scope.new_id++;
		$scope.json_options.push(
			{ id: "new_" + $scope.new_id,
			  option_text: "",
			  active: 1,
			  deleted: 0,
			  dimension: $scope.dimensions,
			  capability: $scope.capabilities,
			  filter_str: $scope.dimensions.replace(" ", "_") + '_' + $scope.capabilities
			  });
		console.log($scope.json_options);
		console.log("focus: " + "#textarea_new_" + $scope.new_id);
// 		angular.element("#textarea_new_" + $scope.new_id).focus();
// 		$("#textarea_new_" + $scope.new_id).focus();
	};
 	
});

//////////////////////////////////////////
//passwords management page
//////////////////////////////////////////
swAdminApp.controller('passwordsCtrl', function($scope, $http) {
	$scope.admin = {};
	$scope.staff = {};
	
	$scope.updateAdminAuth = function()
	{
		console.log("beginning submission");
		$http({
			method  : 'POST',
			url     : '/api/index.php/update-admin-auth',
			data    : $.param($scope.admin),  // pass in data as strings
			headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
		})
			.success(function(admindata) {	
				if (! admindata.result ) {
					// if not successful, bind errors to error variables
					$scope.errorNumber = admindata.error;
					$scope.messageAdmin = "submission error: " + admindata.result;
					$scope.result = "invalid submission";
					console.log("submission error: " + admindata.result);
					console.log(admindata);
				} else {
					// if successful, bind success message to message
// 					$scope.update-admin-auth-result = admindata;
					$scope.messageAdmin = "Admin user/password has been updated";
					$scope.result = "successful submission";
					console.log("successful submission");
				}
			})
			.error(function(admindata){
				$scope.result = "http error";
				$scope.messageAdmin = "There was an error, and the user/pw could not be updated. You live in a fallen world full of failures and frustrations, and this is one of them."
				console.log("error: " + admindata.errorMessage);
				});
	};
	
	$scope.updateStaffAuth = function()
	{
		$http({
			method  : 'POST',
			url     : '/api/index.php/update-staff-auth',
			data    : $.param($scope.staff),  // pass in data as strings
			headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
		})
			.success(function(staffdata) {	
				if (! staffdata.result ) {
					// if not successful, bind errors to error variables
					$scope.errorNumber = staffdata.error;
					$scope.messageStaff = staffdata.errorMessage;
					$scope.result = "invalid submission";
					console.log("submission error: " + staffdata.errorMessage);
					console.log(staffdata);
				} else {
					// if successful, bind success message to message
					$scope.update_result = staffdata;
					$scope.messageStaff = "staff user/password has been updated"
					$scope.result = "successful submission"
					console.log("successful submission");
				}
			})
			.error(function(staffdata){
				$scope.result = "http error";
				$scope.messageStaff = "There was an error, and the user/pw could not be updated. You live in a fallen world full of failures and frustrations, and this is one of them."
				console.log("error: " + staffdata.errorMessage);
				});
	};
 	
});

//////////////////////////////////////////
//reports dashboard page
//////////////////////////////////////////
swAdminApp.controller('reportsCtrl', function($scope, $http) {
 	
	$scope.message = "reports";
 	
});