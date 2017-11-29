/*


*/
define([
	'angular'
], function (angular) {
	var app_dashboard = angular.module("App_Dashboard", []);
	
	return app_dashboard;
});

/*
	app_dashboard.controller('mainCtrl', ["$scope", "$http", function($scope, $http){
		$scope.asd = "asd";	
		$scope.stageView = "manager";	
		$scope.showManagerView = function(){
			$scope.stageView = "manager";
		}
		$scope.showUserView = function(){
			$scope.stageView = "user";
		}
		$scope.showWebsiteView = function(){
			$scope.stageView = "website";
		}
		$scope.showDomainView = function(){
			$scope.stageView = "domain";
		}
		$scope.showVIPView = function(){
			$scope.stageView = "VIP";
		}
		$scope.showBigFileView = function(){
			$scope.stageView = "bigfile";
		}
		$scope.showSensitiveWordsView = function(){
			$scope.stageView = "sensitivewords";
		}
		$scope.showOauthView = function(){
			$scope.stageView = "oauth";
		}
		$scope.showTemplateView = function(){
			$scope.stageView = "template";
		}
		$scope.showDemoView = function(){
			$scope.stageView = "demo";
		}
	}]);
	*/