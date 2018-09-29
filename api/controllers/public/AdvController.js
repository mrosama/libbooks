
BookApp.controller('AdvController', ['$rootScope','api', function ($rootScope,api) {
  var url="api/server/data/public/adv.php";
  	
 
 $rootScope.$watch('Advert_Right()', function () { 
 	 var param={cat : 'RIGHT'};
 	  api.Query(url,param,function(response){
 	  	 if (response.length != 0) {
 	  	 	
 	  	 $rootScope.ADV_RIGHT =  response;
 	  	 }
 	  	
 	  });
 	 
 	
 	});
 //----------------------------------------
   $rootScope.$watch('Advert_Left()', function () { 
 	 var param={cat : 'LEFT'};
 	  api.Query(url,param,function(response){
 	  	 if (response.length != 0) {
 	  	 	
 	  	 $rootScope.ADV_LEFT =  response;
 	  	 }
 	  	
 	  });
 	 
 	
 	});
  	
  ///////////////////////////// 
  		  
  	
 
 
 
 
 
 
  
 
 
 
}]);