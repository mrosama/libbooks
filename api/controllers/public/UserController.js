BookApp.controller('UserController', ['$scope', 'BookCache', 'api', '$routeParams', 'Auth', 'Profile',
function($a, b, api, $p, Auth, Profile) {

	//instal value

	$a.urlparam = $p.slug;
$a.captch = api.Captcha(7);
	switch ($a.urlparam) {

		case "profile":
			Auth.AuthSession();
			
		 
			var url = "api/server/data/public/country.php";
			var param = false;
			api.Query(url, param, function(response) {
				$a.Listcountry = response;
				// default selected

			});
			
			$a.TPLMessage_CAPATCH = false;
			$a.TPLMessage_ERROR = false;
			$a.TPLMessage_success = false;
			$a.formUser = true;
			
			var DataVal = Profile.getProfile();

			 
			
			
			$a.ProfileID = DataVal[0].data.ID;
			$a.emailprofile = DataVal[0].data.email;
			$a.passprofile = DataVal[0].data.password;
			$a.cpass = DataVal[0].data.password;
			$a.country = DataVal[0].data.country;
			$a.gender = DataVal[0].data.gender;

			$a.FavIT = DataVal[0].data.FavIT;
			$a.FavAd = DataVal[0].data.FavAd;
			$a.FavHis = DataVal[0].data.FavHis;
			$a.FavPo = DataVal[0].data.FavPo;
			$a.FavSc = DataVal[0].data.FavSc;
			//check val
			$a.checkCountry = $a.country;
			//$a.country = 'ae';
			
			
			$a.submitForm = function() {
				var captchinput = $a.captchinput;
				 var datasend = {
				ID : $a.ProfileID,
				email : $a.emailprofile,
				password : $a.passprofile,
				oldpassword : DataVal[0].data.password,
				country : $a.country,
				gender : $a.gender,
				FavSc : $a.FavSc,
				FavIT : $a.FavIT,
				FavAd : $a.FavAd,
				FavPo : $a.FavPo,
				FavHis : $a.FavHis

			};
			
				if ($a.captch == captchinput) {
								$a.TPLMessage_CAPATCH = false;
					$a.TPLMessage_ERROR = false;
					$a.TPLMessage_success = false;
					$a.formUser = true;

					var url = "api/server/data/public/profile.php";
					var param = datasend;
					
					api.Submit(url, param, function(data) {
						
						if (data == 'UpdateUSER') {
							$a.TPLMessage_success = true;
							$a.formUser = false;
							$a.TPLMessage_ERROR = false;
							$a.TPLMessage_CAPATCH = false;
						}

						if (data == 'ERRORUPDATE') {
							$a.TPLMessage_success = false;
							$a.formUser = true;
							$a.TPLMessage_ERROR = true;
							$a.TPLMessage_CAPATCH = false;
						}
						if (data == 'EMAILERROR') {
							$a.TPLMessage_success = false;
							$a.formUser = true;
							$a.TPLMessage_ERROR = true;
							$a.TPLMessage_CAPATCH = false;
						}

						if (data == 'ERROR') {
							$a.TPLMessage_success = false;
							$a.formUser = true;
							$a.TPLMessage_ERROR = true;
							$a.TPLMessage_CAPATCH = false;
						}

						
						
					});
					
				} else {
					
					  $a.TPLMessage_CAPATCH = true;
					$a.TPLMessage_ERROR = false;
					$a.TPLMessage_success = false;	
					
				}
			 
			}
			
			
			
			
			
			
			
			
			
			//=====///////////////////////////////////////////////////////
			break;

		case "user":
		default:

		//	$a.captch = api.Captcha(7);

			//get Country Data
			var url = "api/server/data/public/country.php";
			var param = false;
			api.Query(url, param, function(response) {
				$a.Listcountry = response;
				// default selected

			});
			//end---------------------------------------------

			//default Values
			$a.TPLMessage_CAPATCH = false;
			$a.TPLMessage_ERROR = false;
			$a.TPLMessage_success = false;
			$a.formUser = true;
			$a.gender = 'male';
			$a.checkCountry = 'ae';
			$a.country = 'ae';
			
			
			$a.submitForm = function() {
				//accept data from form

				var captchinput = $a.captchinput;
				var email = $a.email;
				var password = $a.pass;
				var country = $a.country;
				var gender = $a.gender;
				var FavSc = $a.FavSc;
				var FavIT = $a.FavIT;
				var FavAd = $a.FavAd;
				var FavPo = $a.FavPo;
				var FavHis = $a.FavHis;

				var datasend = {
					email : email,
					password : password,
					country : country,
					gender : gender,
					FavSc : FavSc,
					FavIT : FavIT,
					FavAd : FavAd,
					FavPo : FavPo,
					FavHis : FavHis

				};


				if ($a.captch == captchinput) {
					//send data
					$a.TPLMessage_CAPATCH = false;
					$a.TPLMessage_ERROR = false;
					$a.TPLMessage_success = false;
					$a.formUser = true;

					var url = "api/server/data/public/register.php";
					var param = datasend;
					api.Submit(url, param, function(data) {
						// console.info(datasend);
						//console.info(data);
						if (data == 'ADDUSER') {
							$a.TPLMessage_success = true;
							$a.formUser = false;
							$a.TPLMessage_ERROR = false;
							$a.TPLMessage_CAPATCH = false;
						}

						if (data == 'ERRORINSERT') {
							$a.TPLMessage_success = false;
							$a.formUser = true;
							$a.TPLMessage_ERROR = true;
							$a.TPLMessage_CAPATCH = false;
						}
						if (data == 'EMAILERROR') {
							$a.TPLMessage_success = false;
							$a.formUser = true;
							$a.TPLMessage_ERROR = true;
							$a.TPLMessage_CAPATCH = false;
						}

						if (data == 'ERROR') {
							$a.TPLMessage_success = false;
							$a.formUser = true;
							$a.TPLMessage_ERROR = true;
							$a.TPLMessage_CAPATCH = false;
						}

					});

				} else {
					$a.TPLMessage_CAPATCH = true;
					$a.TPLMessage_ERROR = false;
					$a.TPLMessage_success = false;
					//console.info('Error');
				}
			}

			break;

	}

}]); 