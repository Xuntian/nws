define([
    'app',
    'text!statics/keepwork/html/maincontent.html',
], function (app, htmlContent) {
   
    app.registerController("mainContentController", ['$rootScope','$scope', function ($rootScope, $scope) {
        
    }]);

    return htmlContent;
});