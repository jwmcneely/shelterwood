// define angular module/app
var swStaffApp = angular.module('swStaffApp', [
	'ngRoute',
	'swStaffApp'
]);

swStaffApp.config(['$routeProvider',
	function($routeProvider) {
		$routeProvider.
			when('/students', 
			{
				templateUrl: '/staff/students.html',
				controller: 'studentsCtrl'
			}).
			when('/overview/:id_student/:name_student/:weekof',
			{
				templateUrl: '/staff/overview.html',
				controller: 'overviewCtrl'
			}).
			when('/entry/:id_student/:name_student/:weekof/:assessor',
			{
				templateUrl: '/staff/entry.html',
				controller: 'entryCtrl'
			}).
			otherwise({
				redirectTo: '/students'
			});
}]);