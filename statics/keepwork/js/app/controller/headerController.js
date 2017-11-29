define([
    'text!statics/keepwork/html/header.html',
], function (htmlContent) {
    
    app.registerController("headerController", ['$rootScope','$scope', function ($rootScope, $scope) {
        $scope.asd = "asdasd";
        $('#__header__').html(htmlContent);
    }]);

    //return htmlContent;
});