
BookApp.controller('MainController', ['$scope','$http','api','Upload','$sce','$rootScope','$location', 'anchorSmoothScroll',
 function ($scope,$http,api,Upload,$sce,$rootScope,$location, anchorSmoothScroll) {



 $scope.gotoElement = function (eID){
      // set the location.hash to the id of
      // the element you wish to scroll to.
      $location.hash('top');
 
      // call $anchorScroll()
      anchorSmoothScroll.scrollTo(eID);
      
    };


//get option

 
  
 var Page_Options="api/server/data/public/options.php";
 var param = {msg:'welcome'};
 api.Query(Page_Options,param,function(response){
 	 //console.log(response[0].msg_title);
 	if(response.length != 0){
 	$scope.optionsVal = response[0];	
 	}
 	
 });
 

/////////////////////////////////////////


//get last 6 book


 var LastBook_Url="api/server/data/public/options.php";
 var param = {product:'last'};
 api.Query(LastBook_Url,param,function(response){
 	// console.log(response);
 	if(response.length != 0){
 	$scope.initbook = response;	
 	}
 	
 });



















/////////////////////////////////


 	var url = "api/server/data/public/category.php";
			var param = {getCategory : 'view'};
			api.Query(url, param, function(response) {
				  var text ;
				//$scope.category = $sce.trustAsHtml(response);
			//	console.log(response);
				// default selected
      // text= $sce.trustAsHtml(response);
     
      $scope.category = response;
 }); 
 
 
 $scope.cat = 1;
$scope.formbookadd = true;

$scope.TPLMessage_CAPATCH = false;
$scope.TPLMessage_ERROR1 = false;
$scope.TPLMessage_ERROR2 = false;
$scope.TPLMessage_ERROR3 = false;
$scope.TPLMessage_ERROR4 = false;
$scope.TPLMessage_success = false;
				 
			 
			
 
 $scope.captch = api.Captcha(7);
$scope.clearFiles = function(model,index){
Upload.clearFile(model,index);
}
 
 
$scope.setFile = function(element,index){
   
Upload.setFile(element,index);
}
 
 
 
 
 $scope.submitBOOK = function() {
 	
 	var data  = {
 		bookname:$scope.bookname,
 		bookdesc:$scope.bookdesc,
 		author: $scope.author,
 		authoremail:$scope.authoremail,
 		cat : $scope.cat,
 		type: 'post'
 		};
 	 var captchinput = $scope.captchinput;
 	 
 	 
 	 if ($scope.captch  == captchinput) {
  $scope.formbookadd = false;
 	 	
 	 	Upload.Submit("api/server/data/public/addbook.php",data).then(function(response) {
 	 	//	console.log(response);
 	 		//console.info(response.data);
 	 			
 	  	//*****	
 	 		switch(response.data){
 	 			case "ADD_BOOK":
 	 			
$scope.formbookadd        = false;
$scope.TPLMessage_CAPATCH = false;
$scope.TPLMessage_ERROR1  = false;
$scope.TPLMessage_ERROR2  = false;
$scope.TPLMessage_ERROR3  = false;
$scope.TPLMessage_ERROR4  = false;
$scope.TPLMessage_success = true;
 	 			
 	 			break;
 	 			
 	 			case "MISSING_INPUT":
 	 			
$scope.formbookadd        = true;
$scope.TPLMessage_CAPATCH = false;
$scope.TPLMessage_ERROR1  = true;
$scope.TPLMessage_ERROR2  = false;
$scope.TPLMessage_ERROR3  = false;
$scope.TPLMessage_ERROR4  = false;
$scope.TPLMessage_success = false;
 	 			
 	 			break;
 	 			
 	 			case "MISSING_FILE":
 	 			
 $scope.formbookadd        = false;
$scope.TPLMessage_CAPATCH = false;
$scope.TPLMessage_ERROR1  = false;
$scope.TPLMessage_ERROR2  = false;
$scope.TPLMessage_ERROR3  = true;
$scope.TPLMessage_ERROR4  = false;
$scope.TPLMessage_success = false;
 	 			
 	 			
 	 			
 	 			break;
 	 			
 	 			
 	 			case "MISSING_FILE_Extension":
 	 			
 $scope.formbookadd        = false;
$scope.TPLMessage_CAPATCH = false;
$scope.TPLMessage_ERROR1  = false;
$scope.TPLMessage_ERROR2  = true;
$scope.TPLMessage_ERROR3  = false;
$scope.TPLMessage_ERROR4  = false;
$scope.TPLMessage_success = false;
 	 			
 	 			break;
 	 			
 	 			case "ERROR_BOOK":
 	 			
 	 			
$scope.formbookadd        = false;
$scope.TPLMessage_CAPATCH = false;
$scope.TPLMessage_ERROR1  = true;
$scope.TPLMessage_ERROR2  = false;
$scope.TPLMessage_ERROR3  = false;
$scope.TPLMessage_ERROR4  = false;
$scope.TPLMessage_success = false;
 	 			
 	 			
 	 			break;
 	 			
 	 			
 	 			 
 	 			
 	 			
 	 		}
 	 		
 	 	//********	
 	 	});
 	 	
 	 	
 	 	
 	 	
 	 }
 	 else {
  $scope.formbookadd = true;
$scope.TPLMessage_CAPATCH = true;
$scope.TPLMessage_ERROR1 = false;
$scope.TPLMessage_ERROR2 = false;
$scope.TPLMessage_ERROR3 = false;
$scope.TPLMessage_ERROR4 = false;
$scope.TPLMessage_success = false;
 	 	
 	 }
 	 
 	 
 	 
 
 	
 }
  
 
 /// 

 
 
 

 
 
 
 
}]);