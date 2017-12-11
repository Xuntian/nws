
define([
], function () {
    app.registerController("mainController", ['$rootScope','$scope', '$http', '$auth', function ($rootScope, $scope, $http, $auth) {
		
		$scope.urlPrefix = "http://127.0.0.1/"
		$scope.username = "";
		$scope.password = "";
		$scope.isLogined = $auth.isAuthenticated();
		$scope.errMsg = "";
		$scope.login = function(){
			if(!$auth.isAuthenticated()){
				if($scope.username != "" && $scope.password != ""){
					$http({
						method: 'POST',
						url: $scope.urlPrefix + 'admin/login',
						data: {
							username: $scope.username,
							password: $scope.password,
						}
					}).then(function successCallback(response) {
						$auth.setToken(response.data.token);
						//Account.setUser();
						if(response.data.error == "登录成功"){
							$scope.isLogined = true;
						}else{
							$scope.errMsg = response.data.error;
						}
					}, function errorCallback(){
						$scope.errMsg = "访问太频繁，请稍后尝试";
					});
				}else{
					$scope.errMsg = "账户名或秘密不能为空";
				}
			}	
		}
		$scope.logout = function(){
			//$scope.isLogined = false;
			$auth.logout();
			$auth.removeToken();
			$scope.isLogined = $auth.isAuthenticated();
			$scope.errMsg = "";
		}

        $scope.asd = "asd111";
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

});