// define angular module/app
var swAdminApp = angular.module('swAdminApp', [
	'ngRoute',
	'swAdminApp'
]);

swAdminApp.filter('phoneformat', function() {
	return function(nmb) 
	{
		if( ! nmb)
		{
			return nmb;
		}
		else if( isValidNumber(nmb, "US") )
		{
			return formatLocal("US", nmb);
		}
		else
		{
			return "invalid number";
		}
	}
});
	
swAdminApp.filter('phonevalid', function() 
{
	return function(nmb)
	{
		if(nmb)
		{
			return (isValidNumber(nmb, "US")? "": "Please enter a valid phone number");
		}
	}
});

swAdminApp.config(['$routeProvider',
	function($routeProvider) {
		$routeProvider.
			when('/students', 
			{
				templateUrl: '/admin/students.html',
				controller: 'studentsCtrl'
			}).
			when('/student/:id', 
			{
				templateUrl: '/admin/students.html',
				controller: 'studentSelectCtrl'
			}).
			when('/options',
			{
				templateUrl: '/admin/options.html',
				controller: 'optionsCtrl'
			}).
			when('/passwords',
			{
				templateUrl: '/admin/passwords.html',
				controller: 'passwordsCtrl'
			}).
			when('/reports',
			{
				templateUrl: 'admin/reports.html',
				controller: 'reportsCtrl'
			}).
			otherwise({
				redirectTo: '/students'
			});
}]);