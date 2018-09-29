dashboardApp.controller('LinksController', ['$scope', '$rootScope', '$routeParams', 'api', '$location', '$window','Auth',
function($scope, $rootScope, $routeParams, api, $location, $window,Auth) {
  Auth.AuthSession();
	$scope.urlparam = $routeParams.param;
	var Page_Url = "../api/server/data/dashboard/links.php";

	switch($scope.urlparam) {

		case "add":
			$scope.BreadTitle = "موقع جديد";

			$scope.AddSite = function() {
				$scope.TPLMessage_success = false;
				$scope.TPLMessage_ERROR1 = false;
				var Page_Url = "../api/server/data/dashboard/links.php";
				var website_name = $scope.website_name;
				var website_link = $scope.website_link;
				var param = {
					title : website_name,
					link : website_link
				};
				//console.info(param);
				api.Submit(Page_Url, param, function(data) {
					//console.info(data);

					if (data == "ADD_SITE") {
						$scope.TPLMessage_success = true;
						$scope.TPLMessage_ERROR1 = false;
						$scope.website_name = "";
						$scope.website_link = "";
					}

					if (data == "ERROR_SITE") {
						$scope.TPLMessage_success = false;
						$scope.TPLMessage_ERROR1 = true;

					}

				});
			}
			//

			break;

		default:
			$scope.table1 = true;
			$scope.BreadTitle = "  قائمة المواقع";

			$scope.updateSelection = function(selectionValue) {
				for (var i = 0; i < 20; i++) {
					var el = document.getElementById('px_' + i);
					if (el != null) {
						el.checked = selectionValue;
					}

				}

			};

			$scope.refresh = function() {

				var param = {
					list : 'list'
				};
				api.Query(Page_Url, param, function(response) {
					//console.info(response);
					if (response != 'NOPAGES') {
						$scope.table1 = true;
						$scope.datagride = response;

					} else {
						$scope.TPLMessage_ERROR1 = true;
						$scope.table1 = false;
					}

				});
			}
			//-------------------------------------------------

			$scope.deletePage = function() {
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
					//console.info(param);
					//post

					api.Submit(Page_Url, param, function(data) {
//console.info(data);
						$scope.refresh();

					});
					//

				}

			}
			//-----------------------------------
			$scope.refresh();

		//

	}

	//
}]); 