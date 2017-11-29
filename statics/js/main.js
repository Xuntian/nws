/**
 * Created by wuxiangan on 2016/12/19.
 */

'use strict';

(function (win) {
  
	require.config({
        paths: {
            "domReady": "lib/domReady",
            "angular": "lib/angular",
            "app": "app",
        }
    });	

    /*
	require(['domReady'], function (domReady) {
        
		domReady(function () {
			// ***在angular启动之前加载页面内容，目的是内容js完全兼容之前angular书写方式，否则angular启动后，之前书写方式很多功能失效***
			require(['angular','app'], function(angular, app){
				alert("3");
                angular.bootstrap(document, ['app_dashboard']);
				
			});
		});
    });
    require(['angular','app'], function(angular, app){
        alert("3");
        $(function () {
            angular.bootstrap(document, ['app_dashboard']);
        })
    });*/
    require(['angular', 'app'],function ($, angular){
        $(function () {
            angular.bootstrap(document,["App_Dashboard"]);
        })
    });
    
})(window);



