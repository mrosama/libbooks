BookApp.controller('LibraryController', ['$scope','BookCache','api','$routeParams', function ($scope,b,api,$routeParams) {
	
//

// console.log($routeParams.cat);

var cat = 0;
if($routeParams.cat != undefined){
cat = $routeParams.cat;
} else {
cat = 0;	
}



var msgerror =0;

  //get category
 var Page_Url="api/server/data/public/library.php";
 var param = {category : cat};
 api.Query(Page_Url,param,function(response){
 	// console.log(response);
 	 if(response != 'NOCAT'){
 		$scope.viewcat =true;
  	 $scope.bookcat = response.data;
  	 $scope.bookcatTotal = response.total;
  	msgerror =0; 
 	}  else {
 		$scope.viewcat =false;
 		 msgerror =1; 
 	} 
 	
 });








//get books
 
 var Page_Url2="api/server/data/public/library.php";
 var param = {cat : cat};
 api.Query(Page_Url2,param,function(response){
 	  //console.log(response);
 	if(response != "NOBOOK"){
 		$scope.viewbook = true;
  	$scope.gridbook = response;
  	 msgerror = 0; 
 	} else {
 		/*if( $scope.catfound == false){
 			$scope.TPLMessage_ERROR =true;
 		}*/
 		
 		 msgerror +=1; 
 		$scope.viewbook =false;
 	}
 	
 	if(msgerror ==2){
 		$scope.TPLMessage_ERROR =true;
 	}
 	else {
 	$scope.TPLMessage_ERROR = false;	
 	}
 	
 	//console.info(msgerror);
 });

 




/////////////













/////////////////////////////////////////////////////////


 
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
 