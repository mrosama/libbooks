
dashboardApp.controller('MainController', ['$scope','api','Auth','Profile','$location','$rootScope','Auth', function ($scope,api, Auth, Profile,$location,$rootScope,Auth) {
   //Auth.AuthSession();
 $scope.login = function(){
 	var username = $scope.userlogin;
		var password = $scope.passlogin;
		Auth.login(username, password).then(function() {
			var val = Auth.data();
				if (val.length != 0) {
					if (val.login == "success") {
						Profile.setProfile(val);
						var Dataprofile = Profile.getProfile();
						 $rootScope.ProfileName = Dataprofile[0].data.email;
					$location.path('page/list');
					}
					
					 if (val.login == "failed") {
				 	$scope.TPLMessage_ERROR =true;
				 	
				 }
					
				}
				
				});
		
//console.info('Login Call');
 	
 }
 
 //
 
 
 ////////////////////////////////
 
 
 	// [Auth Logout Function]----------------------------------------
	
	$scope.logout = function() {
		Auth.logout().then(function() {
			var val = Auth.data();
			Profile.unsetProfile();
            $location.path('/');
		});

	}
 
 
 
 
 
 
 
 // [Auth Check Login Function]----------------------------------------
	
		$scope.$watch('CheckLogin()', function() {
				Auth.AuthCheck().then(function() {
					var val = Auth.data();
					if (val.length != 0) {
						Profile.setProfile(val);
						 
							var Dataprofile =Profile.getProfile();
						 //console.info(Dataprofile.length); 
					 //console.info(Dataprofile); 
					      $rootScope.ProfileName = Dataprofile[0].data.email;
							//console.info(val);
					}
					
				
				});
			 
		});
 
  
 
 
 
 
 
 
 
 /////
}]);