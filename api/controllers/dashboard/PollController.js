
dashboardApp.controller('PollController', ['$scope','$rootScope','$routeParams','api','$location','ngDialog','$modal','Auth', function ($scope,$rootScope,$routeParams,api,$location,ngDialog,$modal,Auth) {
 
  Auth.AuthSession(); 
 
 $scope.urlparam = $routeParams.param;
	var Page_Url = "../api/server/data/dashboard/poll.php";
	
 switch($scope.urlparam) {
 case "add":
  $scope.BreadTitle = "    جديد";
  
 
 
 
 $scope.addPoll  = function () {
 	
 var param = {
 	add:'q',
 	q1:$scope.q1,
 	a1:$scope.a1,
 	a2:$scope.a2,
 	a3:$scope.a3,
 	a4:$scope.a4,
 	a5:$scope.a5
 }	
 	///
 	  $scope.TPLMessage_success = false;
 	 	api.Submit(Page_Url, param, function(data) {
 	 	 
 	 		if(data == "add"){
 	  $scope.TPLMessage_success = true;
 	  $scope.q1 = '';
 	 $scope.a1 = '';
 	 $scope.a2 = '';
 	 $scope.a3 = '';
 	 $scope.a4 = '';
 	 $scope.a5 = '';
 	 
 	 		}
 	 		
 	 	 
 	 		
 	 		
 	 	});
 	
 	
 	
   //
 }
 
 
 
 
 
 
 
 
 
 //
 break;
 
 case "edit":
 $scope.BreadTitle = "  تعديل";
 
 	var poll_ID = $routeParams.id;
 	
 	
 	if(poll_ID == undefined){
 		$location.path("poll/list");
 	}
 	
 	//
 	
 	
 	  $scope.TPLMessage_success = false;
 	$scope.editPoll =function(){
 		var param = {update:'list',id:poll_ID,
 	q1:$scope.q1,
 	a1:$scope.a1,
 	a2:$scope.a2,
 	a3:$scope.a3,
 	a4:$scope.a4,
 	a5:$scope.a5,
 	ida:$scope.idQ 
 		};
 		//console.info(param);
 		api.Submit(Page_Url, param, function(data) {
 			  $scope.TPLMessage_success = true;
 			
 		});
 		
 		
 		
 	//	
 	}
 //	
 	
 	
 	
 	
 	
 	
 		$scope.getPoll = function(){
 		var param = {edit:'list',id:poll_ID};
 		  api.Query(Page_Url,param,function(response){
 		 	//console.info(response.q[0].question);
 		 	
 		 	$scope.q1 =response.q[0].question;
 		 	$scope.a1 =response.a[0].answer;
 		 	$scope.a2 =response.a[1].answer;
 		 	$scope.a3 =response.a[2].answer;
 		 	$scope.a4 =response.a[3].answer;
 		 	$scope.a5 =response.a[4].answer;
 		 	
 		 		$scope.idQ =response.a;
 		 	
 		  		   
 		  });
 	}
 	
 	$scope.getPoll();
 	
 	
 	
 	
 	
 	 
 
 ///
 break;
 default:
 
  
 
 
 //$scope.table1 = true;
 $scope.BreadTitle = "     ألارشيف ";
 
 
 
 	$scope.updateSelection = function(selectionValue) {
				for (var i = 0; i < 20; i++) {
					var el = document.getElementById('px_' + i);
					if (el != null) {
						el.checked = selectionValue;
					}

				}

			};
 
 
 
 
 
 $scope.pollActive  =function(id){
 	
 	 var param = {active:'list',s:id};
 	   api.Query(Page_Url,param,function(response){
 	   	$scope.refresh();
 	   	
 	   });
 	 
 	 
 	 
 }
 
 
 
 
 
 
 
 
 	$scope.refresh = function(){
 	
 		
        var param = {list:'list'};
        api.Query(Page_Url,param,function(response){
    	// console.info(response);
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
 	
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 $scope.refresh();
 
 
 ////
 
 }
 
 
 
 
 
 
 
 
 
 
  
 //
}]);