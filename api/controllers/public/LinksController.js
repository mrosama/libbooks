
BookApp.controller('LinksController', ['$scope','$http', function ($scope,$http) {
 
 
  //  var site = "http://www.w3schools.com";
    var page = "api/server/data/public/weblinks.php";
    $http.get(page)
    .success(function(response) { $scope.names = response;
    	//console.info(response);
    	});
 
 
 
 
}]);