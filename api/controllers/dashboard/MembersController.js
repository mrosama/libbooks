
dashboardApp.controller('MembersController', ['$scope','$rootScope','$routeParams','api','$location','Upload','$modal','Auth', function ($scope,$rootScope,$routeParams,api,$location,Upload,$modal,Auth) {
   Auth.AuthSession(); 
  
 
 $scope.urlparam = $routeParams.param;
	var Page_Url = "../api/server/data/dashboard/member.php";
	
 switch($scope.urlparam) {
 	
 case "add":
 
  $scope.BreadTitle = "    جديد";
 //get Country Data
			var url = "../api/server/data/public/country.php";
			var param = false;
			api.Query(url, param, function(response) {
				$scope.Listcountry = response;
				// default selected

			});
			//end---------------------------------------------
 
     
			$scope.TPLMessage_ERROR = false;
			$scope.TPLMessage_success = false;
			 
			$scope.gender = 'male';
			$scope.checkCountry = 'ae';
			$scope.country = 'ae';
			$scope.admin ="0";
			$scope.submitForm = function() {
					var email = $scope.email;
				var password = $scope.pass;
				var country = $scope.country;
				var gender = $scope.gender;
				var FavSc = $scope.FavSc;
				var FavIT = $scope.FavIT;
				var FavAd = $scope.FavAd;
				var FavPo = $scope.FavPo;
				var FavHis = $scope.FavHis;
				var admin = $scope.admin;
				
				
				
					var datasend = {
					register:'y',
					email : email,
					password : password,
					country : country,
					gender : gender,
					FavSc : FavSc,
					FavIT : FavIT,
					FavAd : FavAd,
					FavPo : FavPo,
					FavHis : FavHis,
                    admin : $scope.admin
				};
				
				
					$scope.TPLMessage_ERROR = false;
					$scope.TPLMessage_success = false;
				var param = datasend;
					api.Submit(Page_Url, param, function(data) {
						
						if (data == 'ADDUSER') {
							$scope.TPLMessage_success = true;
							 
							$scope.TPLMessage_ERROR = false;
						 $scope.email = "";
						 $scope.pass="";
						}

						if (data == 'ERRORINSERT') {
							$scope.TPLMessage_success = false;
						 
							$scope.TPLMessage_ERROR = true;
						 
						}
						if (data == 'EMAILERROR') {
							$scope.TPLMessage_success = false;
						 
							$scope.TPLMessage_ERROR = true;
						 
						}

						if (data == 'ERROR') {
							$scope.TPLMessage_success = false;
						 
							$scope.TPLMessage_ERROR = true;
						 
						}
						
					});
				
				
				
				
				
				
			};
			
			
			
 
  
 break;
 
 case "edit":
 
    var user_ID = $routeParams.id;

			if (user_ID == undefined) {
				$location.path('member/list');
			}
		
		if(user_ID==0 || user_ID=="" || user_ID == undefined){
			$location.path('member/list');
		}
 
    $scope.BreadTitle = "    تعديل";

   //get Country Data
			var url = "../api/server/data/public/country.php";
			var param = false;
			api.Query(url, param, function(response) {
				$scope.Listcountry = response;
				// default selected

			});
			//end---------------------------------------------
 
   $scope.getUser= function(){
   	
        var param = {getdatauser:'list',id:user_ID};
        api.Query(Page_Url,param,function(response){
        			
			//console.info(response[0].admin);
		
			$scope.email = response[0].email;
			$scope.pass = response[0].password;
			$scope.cpass = response[0].password;
			$scope.country = response[0].country;
			$scope.gender = response[0].gender;

			$scope.FavIT = response[0].FavIT;
			$scope.FavAd = response[0].FavAd;
			$scope.FavHis = response[0].FavHis;
			$scope.FavPo = response[0].FavPo;
			$scope.FavSc = response[0].FavSc;
        	  $scope.admin =  response[0].Admin;
        	// $scope.role=response[0].admin;
        	$scope.checkCountry = $scope.country;
        	$scope.oldpass =response[0].password;
        });
   	
   }
   
   
   
   
   	$scope.submitForm = function() {
   		 var datasend = {
				ID : user_ID,
				email : $scope.email,
				password : $scope.pass,
				oldpassword : $scope.oldpass,
				country : $scope.country,
				gender : $scope.gender,
				FavSc : $scope.FavSc,
				FavIT : $scope.FavIT,
				FavAd : $scope.FavAd,
				FavPo : $scope.FavPo,
				FavHis : $scope.FavHis,
               admin :  $scope.admin,
               edituser:'y'
			};
   		
   		            $scope.TPLMessage_ERROR = false;
					$scope.TPLMessage_success = false;
   		
   			var param = datasend;
   			
   			api.Submit(Page_Url, param, function(data) {
   				
   				if (data == 'UpdateUSER') {
							$scope.TPLMessage_success = true;
						 
							$scope.TPLMessage_ERROR = false;
						 
						}

						if (data == 'ERRORUPDATE') {
							$scope.TPLMessage_success = false;
						 
							$scope.TPLMessage_ERROR = true;
						 
						}
						if (data == 'EMAILERROR') {
							$scope.TPLMessage_success = false;
						 
							$scope.TPLMessage_ERROR = true;
						 
						}

						if (data == 'ERROR') {
							$scope.TPLMessage_success = false;
						 
							$scope.TPLMessage_ERROR = true;
							 
						}

   				
   				
   			});
   		
   		
   		
   		
   		
   		
   		
   		
   		
   		
   	}
   	
   	
   	////
   
   
   
   
   
   
   
   
   
   $scope.getUser();
   
   
 break;
 default:
 
   $scope.BreadTitle = "    قائمة الاعضاء";
	$scope.updateSelection = function(selectionValue) {
				for (var i = 0; i < 20; i++) {
					var el = document.getElementById('px_' + i);
					if (el != null) {
						el.checked = selectionValue;
					}

				}

			}; 
 
 /////////////////////////////////////////
 
 
 
 	
 	$scope.deletePage = function (){
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
						mytype:'delete',
						IDremove : IDSelected
					};
 		 
 		 	api.Submit(Page_Url, param, function(data) {
 		 		
 		 	 $scope.refresh();
 		 		 
 		 	});
 		 	//
 		 	
 		 }
 		 
 		  
 		  
 	}
 	
 	//end delete
 
 
 ///////////////
 
 
 
 
 	
 	$scope.changeRole = function (val){
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
					if(val=='0'){
						var param = {
						myrole:'role',
						val:0,
						IDremove : IDSelected
					};
					} else {
							var param = {
						myrole:'role',
						val:1,
						IDremove : IDSelected
					};
						
					}
					
 		 
 		 	api.Submit(Page_Url, param, function(data) {
 		 		
 		 	 $scope.refresh();
 		 		 
 		 	});
 		 	//
 		 	
 		 }
 		 
 		  
 		  
 	}
 	
 	//end role
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  ////////////////////////////////////
  $scope.refresh = function(){
 	
 		
        var param = {list:'list'};
        api.Query(Page_Url,param,function(response){
     //console.info(response);
 	    if(response != 'NODATA'){
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
 
 
 
 
 
 
 
 
 
 
 
 
  
 //
}]);







 





