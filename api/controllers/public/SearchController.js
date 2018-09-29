BookApp.controller('SearchController', ['$scope', 'api', '$routeParams','$location',
function($scope, api, $routeParams,$location) {
	

$scope.searchbook = function(){	
//console.info($scope.q);	
if( $scope.q != null || angular.isUndefined($scope.q)){
$location.path('/search/'+$scope.q);
}

}

/*
$scope.$on('$routeChangeSuccess', function (ev, current, prev) {
});
*/


if($routeParams.param != null || $routeParams.param !='undefined'  ){
  $scope.q = $routeParams.param;	
	//console.info($routeParams.param);	
	
	
	 var Page_Url="api/server/data/public/library.php";
 var param = {search:'list',param:$scope.q};
 api.Query(Page_Url,param,function(response){
 	 //console.info(response);
 	if(response != "NOBOOK"){
 		$scope.viewbook =true;
 		 $scope.TPLMessage_ERROR =false;
 		 $scope.gridbook = response;
 		
 	} else {
 		 $scope.TPLMessage_ERROR =true;
 		$scope.viewbook =false;
 	}
 	
  
 });
	
	
 
}






/////
}]); 