
//define Modules...
//var BookApp = angular.module('BookApp', ['ngRoute','ngAnimate','ui.bootstrap','pascalprecht.translate','ngCookies','']);

var BookApp = angular.module('BookApp', ['ngRoute','ngAnimate','ui.bootstrap','pascalprecht.translate','ngCookies','angularUtils.directives.dirPagination','ngSanitize','ngHtmlCompile','filters','timer'],function($httpProvider){

 $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

 // Override $http service's default transformRequest
  $httpProvider.defaults.transformRequest = [function(data)
  {
    /**
     * The workhorse; converts an object to x-www-form-urlencoded serialization.
     * @param {Object} obj
     * @return {String}
     */
    var param = function(obj)
    {
      var query = '';
      var name, value, fullSubName, subName, subValue, innerObj, i;
      
      for(name in obj)
      {
        value = obj[name];
        
        if(value instanceof Array)
        {
          for(i=0; i<value.length; ++i)
          {
            subValue = value[i];
            fullSubName = name + '[' + i + ']';
            innerObj = {};
            innerObj[fullSubName] = subValue;
            query += param(innerObj) + '&';
          }
        }
        else if(value instanceof Object)
        {
          for(subName in value)
          {
            subValue = value[subName];
            fullSubName = name + '[' + subName + ']';
            innerObj = {};
            innerObj[fullSubName] = subValue;
            query += param(innerObj) + '&';
          }
        }
        else if(value !== undefined && value !== null)
        {
          query += encodeURIComponent(name) + '=' + encodeURIComponent(value) + '&';
        }
      }
      
      return query.length ? query.substr(0, query.length - 1) : query;
    };
    
    return angular.isObject(data) && String(data) !== '[object File]' ? param(data) : data;
  }];	
});



//----------------------------------------------------------------------


//define some constant

BookApp.constant('WebConfing',
                     {url:'localhost/preview/books',
                     title:'book',
                     language:'ar'
                     });

//----------------------------------------------------------------------------




//Configure languages
BookApp.config(function($translateProvider) {
	
  $translateProvider.useStaticFilesLoader({
  prefix: '/preview/books/language/',
  suffix: '.json'
});
 
  $translateProvider.preferredLanguage('ar_EG');
});

////////////


BookApp.directive("passwordVerify", function() {
   return {
      require: "ngModel",
      scope: {
        passwordVerify: '='
      },
      link: function(scope, element, attrs, ctrl) {
        scope.$watch(function() {
            var combined;

            if (scope.passwordVerify || ctrl.$viewValue) {
               combined = scope.passwordVerify + '_' + ctrl.$viewValue; 
            }                    
            return combined;
        }, function(value) {
            if (value) {
                ctrl.$parsers.unshift(function(viewValue) {
                    var origin = scope.passwordVerify;
                    if (origin !== viewValue) {
                        ctrl.$setValidity("passwordVerify", false);
                        return undefined;
                    } else {
                        ctrl.$setValidity("passwordVerify", true);
                        return viewValue;
                    }
                });
            }
        });
     }
   };
});

 
 

BookApp.run(function($rootScope,api){
	
	
 //console.log("Application is Running...............");
});
