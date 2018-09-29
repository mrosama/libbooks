BookApp.controller('AuthController', ['$rootScope', '$scope', 'BookCache', 'api', 'Auth', 'Profile',
function($rootScope, $b, api, api, Auth, Profile) {

	$b.form_login = true;
	$b.form_profile = false;
	$b.LoginMSGERR = false;
	$b.login = function() {
		var username = $b.userlogin;
		var password = $b.passlogin;

		Auth.login(username, password).then(function() {
			var val = Auth.data();

			if (val.length != 0) {
				 
				if (val.login == "success") {
					$b.form_login = false;
					$b.form_profile = true;
					$b.LoginMSGERR = false;
					//save data in share

					Profile.setProfile(val);
					// console.info(Profile.getProfile());
					var Dataprofile =Profile.getProfile();
					$b.ProfileName = Dataprofile[0].data.email;

				}

				if (val.login == "failed") {
					$b.form_login   = true;
					$b.form_profile = false;

					$b.LoginMSGERR  = true;
				}
			}

		});

	}
	
	
	
	
	// [Auth Logout Function]----------------------------------------
	
	$b.logout = function() {
		Auth.logout().then(function() {
			var val = Auth.data();
			Profile.unsetProfile();
			$b.LoginMSGERR = false;
			$b.form_login = true;
			$b.form_profile = false;
			$b.userlogin = "";
			$b.passlogin = "";

		});

	}
	
	
// [Auth Check Login Function]----------------------------------------
	
		$b.$watch('CheckLogin()', function() {
				Auth.AuthCheck().then(function() {
					var val = Auth.data();
					if (val.length != 0) {
						Profile.setProfile(val);
						$b.LoginMSGERR = false;
			            $b.form_login = false;
			            $b.form_profile = true;
							var Dataprofile =Profile.getProfile();
							//console.info(Dataprofile[0].ID); 
					$b.ProfileName = Dataprofile[0].data.email;
							//console.info(val);
					}
					
				
				});
			 
		});
	
 
	
	
	
	
	
	
	
	
	
	
	

}]);
