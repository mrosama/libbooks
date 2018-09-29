

dashboardApp.factory('AdminCache', function($cacheFactory) {
	return $cacheFactory('myCache');
});




dashboardApp.factory('api', function($http, AdminCache) {

	var factory = {};

	factory.Query = function(url, postData, CallbackMethod) {

		$http({
			url : url,
			method : "GET",
			//cache : AdminCache,
			//  data: postData, //id=1&m=2
			params : postData, // {id:'one}
			// headers: {'Content-Type': 'application/x-www-form-urlencoded'}
		}).success(function(data, status, headers, config) {
			// console.info("Load success");
			CallbackMethod(data);
		}).error(function(data, status, headers, config) {
			// $scope.status = status;
			// console.warn(status);
			CallbackMethod(status);
		});

	};

	//---------------------------------------------------

	factory.Submit = function(url, postData, CallbackMethod) {

		$http({
			url : url,
			method : "POST",
			// cache:BookCache,
			//  data: postData, //id=1&m=2
			data : postData, // {id:'one}
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded'
			}
		}).success(function(data, status, headers, config) {
			// console.info("Load success");
			CallbackMethod(data);
		}).error(function(data, status, headers, config) {
			// $scope.status = status;
			// console.warn(status);
			CallbackMethod(status);
		});

	};

	factory.Captcha = function(len) {
		var Pattern = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
		var randomString = '';

		for (var i = 0; i < len; i++) {
			var randomPoz = Math.floor(Math.random() * Pattern.length);
			randomString += Pattern.substring(randomPoz, randomPoz + 1);
		}
		return randomString.toLowerCase();

	};

	//end
	return factory;
});












//Upload Services -----------------------------------------------------


dashboardApp.factory('Upload', function(api, $q, $location, $rootScope) {
	var services = {};

	var data = [];

	$rootScope.files = [];
	$rootScope.files[0] = undefined;
	$rootScope.files[1] = undefined;

	services.data = function() {
		return data;
	};



	services.Find = function(Myval) {
		var Files = this.getFile();
		for (var i = 0; i < Files.length; i++) {
			if (Files[i].name == Myval) {
				return false;

			} else {
				return true;
			}

		}

	}
	/////////////////
	
	
	services.setFile = function(element, index) {

		$rootScope.$apply(function($rootScope) {

			// $rootScope.files.push(element.files[0]);

			$rootScope.files.splice(index, 1, element.files[0]);
		});
	}

	services.clearFile = function(model, index) {
		$rootScope.files.splice(index, 1, undefined);
		document.getElementById(model).value = "";
		//$rootScope.files.splice(index); delete all
		//	delete $rootScope.files[index];

	}

	services.getFile = function() {
		return $rootScope.files;
	}

	services.Submit = function(url, data) {
		 document.getElementById('spinner_loading').style.display = 'block';
		var deferred = $q.defer();
		var formData = new FormData();
		var Files = this.getFile();

		for (var i = 0; i < Files.length; i++) {
			if ( typeof (Files[i]) == 'object') {
				formData.append("UploadedFile" + i, Files[i]);
				// console.info($rootScope.files[i] + i);
			}
		}

      
        if(angular.isObject(data)){
        	var len =data.length ;
        	//console.info(len );
        	angular.forEach(data, function(value, key) {
        		formData.append(key,value);
        	});
	  
   }

		var xhr = new XMLHttpRequest();

		xhr.open("POST", url);

		xhr.onreadystatechange = function(e) {
			if (xhr.readyState == 4) {
				document.getElementById('spinner_loading').style.display = 'none';
				$rootScope.$apply(function() {
					// Construct a response object similar to a regular $http call
					//
					// data – {string|Object} – The response body transformed with the transform functions.
					// status – {number} – HTTP status code of the response.
					// headers – {function([headerName])} – Header getter function.
					// config – {Object} – The configuration object that was used to generate the request.
					var r = {
						data : xhr.response,
						status : xhr.status,
						headers : xhr.getResponseHeader,
						config : {}
					};
					if (r.status == 200) {
						deferred.resolve(r);
					} else {
						deferred.reject(r);
					}
				});
			}
		};

		xhr.send(formData);

		return deferred.promise;

	};

	//

	return services;
});




//



//share Data-------------------------------------------------------

dashboardApp.factory('Profile', function() {
	var data = [];
	var UserInfo = {};

	UserInfo.getProfile = function() {
		return data;

	}

	UserInfo.setProfile = function(param) {
		 if (data.length == 0) {
			data.push(param);
		 }
	}

	UserInfo.unsetProfile = function() {
		data.splice(0, 1);
	}

	return UserInfo;

});





//Auth Services -----------------------------------------------------

dashboardApp.factory('Auth', function(api, $q, $location, Profile) {
	var services = {};

	var data = [];

	services.login = function(username, password) {
		var deffered = $q.defer();

		var url = "../api/server/data/dashboard/auth.php";
		var param = {
			user : username,
			pass : password
		};

		api.Submit(url, param, function(response) {
			data = response;
			deffered.resolve();

		});

		return deffered.promise;

	}
	//**/

	services.data = function() {
		return data;
	};

	services.logout = function() {
		var deffered = $q.defer();

		var url = "../api/server/data/dashboard/auth.php";
		var param = {
			logout : 'singout'
		};

		api.Query(url, param, function(response) {
			data = response;
			deffered.resolve();

		});
		return deffered.promise;

	}

	services.AuthCheck = function() {
		var url = "../api/server/data/dashboard/auth.php";
		var param = {
			connection : 'alive'
		};

		var deffered = $q.defer();
		api.Query(url, param, function(response) {
			data = response;
			deffered.resolve();

		});
		return deffered.promise;

	}
	//////////////////////////////////////////

	services.AuthSession = function() {
		var sessVal = Profile.getProfile();
		 
		if (sessVal.length == 0) {

			$location.path('/');
		}

	}

	return services;
});













