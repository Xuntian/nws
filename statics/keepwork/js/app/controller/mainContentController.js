define([
    'text!statics/keepwork/html/maincontent.html',
], function (htmlContent) {
   
    app.registerController("mainContentController", ['$rootScope','$scope', function ($rootScope, $scope) {
        $scope.asd = "asdasd";
        $('#__mainContent__').html(htmlContent);
    }]);

    return htmlContent;
});