BookApp.controller('ListController', ['$scope','BookCache','api','$routeParams','$window', 
function ($scope,b,api,$routeParams,$window) {
	
var cat = $routeParams.cat;
var id = $routeParams.id;

if(($routeParams.cat == undefined) || ($routeParams.id == undefined)){
	//console.info('error........');
	
	
}
////



$scope.classbtn = "btn btn-danger";

 var Page_Url="api/server/data/public/library.php";
 var param = {view:'list',cats:cat,ids:id};
 api.Query(Page_Url,param,function(response){
 	 //console.info(response[0]);
 	if(response != "NOBOOK"){
 		$scope.viewbook =true;
 		$scope.TPLMessage_ERROR =false;
 		 $scope.gridbook = response[0];
 		
 	} else {
 		$scope.TPLMessage_ERROR =true;
 		$scope.viewbook =false;
 	}
 	
  
 });


//----------------------------------

$scope.download = function(id){
	//console.info('download...'+id); 
 	 var Page_Url="api/server/data/public/download.php";
	var param = {param:id};
	 api.Query(Page_Url,param,function(response){
	 	$scope.downfiles =false;
	 	$scope.val1 = "";
	 	 	if(response != "NOBOOK"){
	 	 		var data = response[0];
	 	 		$scope.downfiles =true;
	 	 		$scope.val1 = "template/attach/upload/" + data.filename;
	 	 		$scope.downfiles =false;
	 	 	} else {
	 	 		$scope.downfiles =false;
	 	 	}
	 	  
	 	 
	 	
	 });
	 
	 
	
}











$scope.isDisabled = true;
  
$scope.callbackTimer = function(){
	$scope.classbtn = "btn btn-success";
	$scope.isDisabled = false;
	//console.info('timeend...');
	 $scope.$apply();
}









//-----------------------------

 var Page_Url2="api/server/data/public/library.php";
 var param = {bread : cat};
 api.Query(Page_Url2,param,function(response){
 	// console.log(response);
 	 if(response.length !=0){
 	 	//console.log(response);
 	  $scope.breadKey  =	 $scope.reverse(response.keys);
 	  $scope.breadVal  =	  response.vals;	
 	 	
 	 	
 	 }
 	 
 	
 });



 $scope.reverse = function(array) {
            var copy = [].concat(array);
            return copy.reverse();
        }







//
}]); 






