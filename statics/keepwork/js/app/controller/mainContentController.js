define([
    'app',
    'text!statics/keepwork/html/maincontent.html',
], function (app, htmlContent) {
   
    app.registerController("mainContentController", ['$rootScope','$scope', function ($rootScope, $scope) {
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

    return htmlContent;
});