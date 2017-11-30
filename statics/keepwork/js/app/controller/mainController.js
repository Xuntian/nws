
define([
    'text!statics/keepwork/html/header.html',
    'text!statics/keepwork/html/maincontent.html',
], function (headerHtmlContent, maincontentHtmlContent) {
    /*
    app.registerController("mainController", ['$rootScope', '$compile','$scope', function ($rootScope, $compile, $scope) {
        app.ng_objects.$rootScope = $rootScope;
        app.ng_objects.$compile = $compile;

        // $scope.list = ["<div>{{message}}</div><input ng-model='message'>", "<div>{{message}}</div><input ng-model='message'>"];
        //
        // var newList = ["<div>{{message}}</div><input ng-model='message'>", "<div>{{message}}</div><input ng-model='message'>","<div>{{message}}</div><input ng-model='message'>"];
        //
        // setTimeout(function () {
        //     $scope.list = newList;
        //     $scope.$apply();
        // },2000);

        var md = markdown();
        $("#editor").html($compile(md.render("# test"))($scope));
        setTimeout(function () {
            $scope.$apply();
        });
    }]);
    */

    app.registerController("mainController", ['$rootScope','$scope', function ($rootScope, $scope) {
        $scope.asd = "asdasd1";
        $('#__header__').html(headerHtmlContent);
        $('#__mainContent__').html(maincontentHtmlContent);

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

});