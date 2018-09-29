
dashboardApp.controller('AdvController', ['$scope','$rootScope','$routeParams','api','$location','Upload','$modal','Auth', function ($scope,$rootScope,$routeParams,api,$location,Upload,$modal,Auth) {
 
  Auth.AuthSession();
 
 $scope.urlparam = $routeParams.param;
	var Page_Url = "../api/server/data/dashboard/adv.php";
	
 switch($scope.urlparam) {
 case "add":
  $scope.BreadTitle = "    جديد";
  
 
  
 	
  
$scope.setFile = function(element,index){
   
Upload.setFile(element,index);
}
 
 
   $scope.formbookadd = true;
$scope.SendAdvert =function(){
	
	var data  = {
 		name:$scope.advname,
 		links:$scope.advlink,
 		max_h: $scope.advheight,
 		max_w:$scope.advwidth,
 		cat : $scope.cat,
 		type: 'post'
 		};
	
		Upload.Submit(Page_Url,data).then(function(response) {
			
			//console.info(response);
			
				switch(response.data){
					
					case "ADD_ADVERT":
					$scope.formbookadd        = false;
					$scope.TPLMessage_success        = true;
					break;
					
					
					case "ERROR_ADVERT":
						$scope.formbookadd        = false;
						$scope.TPLMessage_ERROR1 =true;
					break;
					
					case "MISSING_FILE":
					$scope.formbookadd        = false;
						$scope.TPLMessage_ERROR2 =true;
					break;
					
					case "MISSING_FILE_Extension":
					$scope.formbookadd        = false;
						$scope.TPLMessage_ERROR3 =true;
					break;
					
					
					
					
					
				}
			
			
			
		});
	
	
	
	
	
	
}
 //
 
 
 
 
 
 
 
 //
 break;
 
 case "edit":
  
  		var Page_Url="../api/server/data/dashboard/adv.php";
 		var Advert_ID = $routeParams.id;
 	
 	
 	 $scope.preview = function (elm) {
    var modalInstance = $modal.open({
      templateUrl: '../template/dashboard/preview.html',
     controller: 'ModalInstanceCtrl',
       resolve: {
         getadv: function () {
           return elm;
         }
       }
    });
 }
 	
 	$scope.setFile = function(element,index){
   
Upload.setFile(element,index);
}
 	
 	if(Advert_ID == undefined){
 		$location.path('adv/list');
 	}
 	//////////
  
  $scope.EditAdvert =function(){
  	
	var data  = {
 		name:$scope.advname,
 		links:$scope.advlink,
 		max_h: $scope.advheight,
 		max_w:$scope.advwidth,
 		cat : $scope.cat,
 		updateedit: 'post',
 		id:Advert_ID,
 		img:$scope.imgadvert
 		};
 		
 		
 		//
 		
 Upload.Submit(Page_Url,data).then(function(response) {
 	// console.info(response);		
 				
 			switch(response.data){
					
					case "ADD_ADVERT":
					//$scope.formbookadd        = false;
					$scope.TPLMessage_success        = true;
					break;
					
					
					case "ERROR_ADVERT":
					//	$scope.formbookadd        = false;
						$scope.TPLMessage_ERROR1 =true;
					break;
					
				 
					
					case "MISSING_FILE_Extension":
				     	//$scope.formbookadd        = false;
						$scope.TPLMessage_ERROR3 =true;
					break;
					
					
					
					
					
				}
				
 		//		
 });
 		
 		
 		
  	
  }
  
  
  
  
  /////////////
   	$scope.getAdvert = function(){
 		var param = {edit:'list',id:Advert_ID};
 		  api.Query(Page_Url,param,function(response){
 		  //	console.info(response);
 		 
 				$scope.advname=response[0].name;
 				$scope.advlink=response[0].links;
 				$scope.cat=response[0].cat;
 				$scope.advheight=response[0].max_h;
 				$scope.advwidth	 =response[0].max_w;
 				$scope.imgadvert = response[0].img;
 		  });
 	}
 	
 	$scope.getAdvert();
  
  
  
  
  
  
  
  
  
 ///
 break;
 default:
 
 //sm  lg
 $scope.preview = function (elm) {
    var modalInstance = $modal.open({
      templateUrl: '../template/dashboard/preview.html',
     controller: 'ModalInstanceCtrl',
       resolve: {
         getadv: function () {
           return elm;
         }
       }
    });
 }
 
 
//////////////////////////





	$scope.updateSelection = function(selectionValue) {
				for (var i = 0; i < 20; i++) {
					var el = document.getElementById('px_' + i);
					if (el != null) {
						el.checked = selectionValue;
					}

				}

			}; 
 
 /////////////////////////////////////////
 
 	
 	/// delete 
 	
 	
 	$scope.deletePage = function (MyVal){
 		$scope.arrid = [];

				for (var i = 0; i < 20; i++) {
					var el = document.getElementById('px_' + i);
					if (el != null) {
						if (el.checked == true) {
							var IdVal = el.value;
							$scope.arrid.push(IdVal);
						}
					}

				}

				if ($scope.arrid.length != 0) {
					var IDSelected = $scope.arrid.join("-");
					var param = {
						IDremove : IDSelected
					};
 		 
 		 	api.Submit(Page_Url, param, function(data) {
 		 		
 		 	 $scope.refresh();
 		 		 
 		 	});
 		 	//
 		 	
 		 }
 		 
 		  
 		  
 	}
 	
 	//end delete
 	
 
 
 ////////////////////////////////////
  $scope.refresh = function(){
 	
 		
        var param = {list:'list'};
        api.Query(Page_Url,param,function(response){
    	//console.info(response);
 	    if(response != 'NOPAGES'){
 	    	 $scope.table1 =true;
 	    $scope.datagride = 	response;
 	    
 	    }
 	     else {
 	          $scope.TPLMessage_ERROR1 = true;
 	          $scope.table1 =false;
 	          }
 	
             });
 	        }
 	        
   $scope.refresh();
 
 ////
 
 }
 
 
 
 
 
 
 
 
 
 
  
 //
}]);







 





