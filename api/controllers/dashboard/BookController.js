dashboardApp.controller('BookController', ['$scope', '$rootScope', '$routeParams', 'api', '$location', 'Upload', '$modal','Auth',
function($scope, $rootScope, $routeParams, api, $location, Upload, $modal,Auth) {
  Auth.AuthSession();
	$scope.urlparam = $routeParams.param;
	var Page_Url = "../api/server/data/dashboard/book.php";

	switch($scope.urlparam) {
       case "editcat":
       
          var cat_ID = $routeParams.id;

			if (cat_ID == undefined) {
				$location.path('book/list');
			}
		
		if(cat_ID==0 || cat_ID=="" || cat_ID == undefined){
			$location.path('book/cat');
		}
		
		
		$scope.getcat = function(){
			 var param = {
       	id:cat_ID,
       	editcats:'e'
       };
       api.Query(Page_Url, param, function(response) {
       	
       	$scope.namecat = response[0].name;
       	
       });
		}	
      
      
      $scope.getcat();
       ///
       
       
       
       $scope.UpdateCat = function(){
       	$scope.TPLMessage_success = false;
	   	 $scope.TPLMessage_ERROR = false;
	
	  var data = {
	   		id:cat_ID,
	   		cattitle:$scope.namecat,
	   		editmycat:'newcat'
	   	};
	   	param = data;
	   		api.Submit(Page_Url, param, function(data) {
	   			if(data =="ADD"){
	   	 $scope.TPLMessage_success = true;
	   	 $scope.TPLMessage_ERROR = false;
	   			}
	   			
	   			if(data=="Error"){
	    $scope.TPLMessage_success = false;
	   	 $scope.TPLMessage_ERROR = true;
	   			}
	   			
	   			
	   		});
	   			    	
       }
       
       
       
       
       
       
       break;
       
       
       
		case "cat":
			$scope.BreadTitle = "    اقسام الكتب";
			
			$scope.refreshCat= function(){
				var param = {
				adminCategory : 'view'
			};
			api.Query(Page_Url, param, function(response) {
				$scope.category = response;
			});
			};
			
			////////////////////
			
			
		
	$scope.AddCAT = function(){
		            	$scope.TPLMessage_success = false;
	   			    	$scope.TPLMessage_ERROR = false;
		
	   	var data = {
	   		cat:$scope.cat,
	   		cattitle:$scope.namecat,
	   		newcat:'newcat'
	   	};
	   	param = data;
	   		api.Submit(Page_Url, param, function(data) {
	   			  
	   			    switch(data){
	   			    	case "ADD_CAT":
	   			    	$scope.TPLMessage_success = true;
	   			    	$scope.TPLMessage_ERROR = false;
	   			    		$scope.refreshCat();
	   			    	break;
	   			    	case "ERROR_CAT":
	   			    	$scope.TPLMessage_success = false;
	   			    	$scope.TPLMessage_ERROR = true;
	   			    	break;
	   			    	
	   			    }
	   			   
	   			
	   		});
	   	
	   	
	   	
	   	
	 
		
	}		
			
			
			
			///
	$scope.deleteCat = function(){
		$scope.TPLMessage_ERROR2 =false;
	var cat = $scope.cat;
	if(confirm('هل ترغب في حذف القسم المختار')){
		if(cat!=0 || cat=="" || cat == undefined){
			
			// console.info(cat);	
			 var param = {
			 	delcats:'y',
			 	id:cat
			 }
			 
			 	api.Submit(Page_Url, param, function(data) {
			 		if(data=='delete'){
			 			$scope.TPLMessage_ERROR2 =true;
			 				$scope.refreshCat();
			 		}
			 		
			 	});
			 
			 
			 
			 
			 
		}
		
	}
	
		
	}		
			
		/////	
			
			$scope.editCat =function(){
				var cat = $scope.cat;
				if(cat!=0 || cat=="" || cat == undefined){
					
					$location.path('book/editcat/'+cat);
				}
				
				
			}
			
			
			
			
			
			$scope.refreshCat();
			

			//
			break;

		case "add":
			$scope.BreadTitle = "    كتاب جديد";

			var param = {
				getCategory : 'view'
			};
			api.Query(Page_Url, param, function(response) {
				$scope.category = response;
			});

			//
			$scope.cat = 1;
			$scope.formbookadd = true;

			$scope.TPLMessage_ERROR1 = false;
			$scope.TPLMessage_ERROR2 = false;
			$scope.TPLMessage_ERROR3 = false;
			$scope.TPLMessage_ERROR4 = false;
			$scope.TPLMessage_success = false;

			$scope.clearFiles = function(model, index) {
				Upload.clearFile(model, index);
			};

			$scope.setFile = function(element, index) {

				Upload.setFile(element, index);
			};

			$scope.submitBOOK = function() {
				var data = {
					bookname : $scope.bookname,
					bookdesc : $scope.bookdesc,
					author : $scope.author,
					authoremail : $scope.authoremail,
					cat : $scope.cat,
					type : 'post'
				};

				Upload.Submit(Page_Url, data).then(function(response) {

					switch(response.data) {
						case "ADD_BOOK":

							$scope.formbookadd = false;
							$scope.TPLMessage_CAPATCH = false;
							$scope.TPLMessage_ERROR1 = false;
							$scope.TPLMessage_ERROR2 = false;
							$scope.TPLMessage_ERROR3 = false;
							$scope.TPLMessage_ERROR4 = false;
							$scope.TPLMessage_success = true;

							break;

						case "MISSING_INPUT":

							$scope.formbookadd = true;

							$scope.TPLMessage_ERROR1 = true;
							$scope.TPLMessage_ERROR2 = false;
							$scope.TPLMessage_ERROR3 = false;
							$scope.TPLMessage_ERROR4 = false;
							$scope.TPLMessage_success = false;

							break;

						case "MISSING_FILE":

							$scope.formbookadd = false;

							$scope.TPLMessage_ERROR1 = false;
							$scope.TPLMessage_ERROR2 = false;
							$scope.TPLMessage_ERROR3 = true;
							$scope.TPLMessage_ERROR4 = false;
							$scope.TPLMessage_success = false;

							break;

						case "MISSING_FILE_Extension":

							$scope.formbookadd = false;

							$scope.TPLMessage_ERROR1 = false;
							$scope.TPLMessage_ERROR2 = true;
							$scope.TPLMessage_ERROR3 = false;
							$scope.TPLMessage_ERROR4 = false;
							$scope.TPLMessage_success = false;

							break;

						case "ERROR_BOOK":

							$scope.formbookadd = false;

							$scope.TPLMessage_ERROR1 = true;
							$scope.TPLMessage_ERROR2 = false;
							$scope.TPLMessage_ERROR3 = false;
							$scope.TPLMessage_ERROR4 = false;
							$scope.TPLMessage_success = false;

							break;

					}

				});

			};

			//
			break;

		case "edit":
			$scope.BreadTitle = "    تعديل كتاب  ";
			var Book_ID = $routeParams.id;

			if (Book_ID == undefined) {
				$location.path('book/list');
			}
			//////////

			var param = {
				getCategory : 'view'
			};
			api.Query(Page_Url, param, function(response) {
				$scope.category = response;
			});

			/////////////////////
			$scope.clearFiles = function(model, index) {
				Upload.clearFile(model, index);
			};

			$scope.setFile = function(element, index) {

				Upload.setFile(element, index);
			};

			////////////////////////////////////////////

			$scope.EditBOOK = function() {
                
				var data = {
					id : Book_ID,
					bookname : $scope.bookname,
					bookdesc : $scope.bookdesc,
					author : $scope.author,
					authoremail : $scope.authoremail,
					cat : $scope.cat,
					file_old : $scope.filename,
					img_old : $scope.img,
					file_size:$scope.size,
					upedit : 'post'
				};

				Upload.Submit(Page_Url, data).then(function(response) {
					switch(response.data) {

						case "ADD_BOOK":
							$scope.TPLMessage_ERROR1 = false;
							$scope.TPLMessage_ERROR2 = false;
							$scope.TPLMessage_ERROR3 = false;
							$scope.TPLMessage_ERROR4 = false;
							$scope.TPLMessage_success = true;
							break;

						case "MISSING_INPUT":
							$scope.TPLMessage_ERROR1 = true;
							$scope.TPLMessage_ERROR2 = false;
							$scope.TPLMessage_ERROR3 = false;
							$scope.TPLMessage_ERROR4 = false;
							$scope.TPLMessage_success = false;

							break;

						case "MISSING_FILE_Extension":
							$scope.TPLMessage_ERROR1 = false;
							$scope.TPLMessage_ERROR2 = true;
							$scope.TPLMessage_ERROR3 = false;
							$scope.TPLMessage_ERROR4 = false;
							$scope.TPLMessage_success = false;

							break;

						case "ERROR_BOOK":
							$scope.TPLMessage_ERROR1 = true;
							$scope.TPLMessage_ERROR2 = false;
							$scope.TPLMessage_ERROR3 = false;
							$scope.TPLMessage_ERROR4 = false;
							$scope.TPLMessage_success = false;
							break;

					}

				});

				//
			}
			//////////////////////

			$scope.getBook = function() {
				var param = {
					getbook : 'list',
					id : Book_ID
				};
				api.Query(Page_Url, param, function(response) {
					$scope.bookname = response[0].bookname;
					$scope.bookdesc = response[0].bookdesc;
					$scope.author = response[0].author;
					$scope.authoremail = response[0].authoremail;
					$scope.cat = response[0].cat;
					$scope.filename = response[0].filename;
					$scope.img = response[0].cover;
				});

			};
			
			$scope.getBook();

			///
			break;
		default:
			$scope.BreadTitle = "      الكتب المسجلة  ";

			$scope.updateSelection = function(selectionValue) {
				for (var i = 0; i < 20; i++) {
					var el = document.getElementById('px_' + i);
					if (el != null) {
						el.checked = selectionValue;
					}

				}

			};

			/////////////////////////////

			/// delete

			$scope.deleteBook = function(MyVal) {
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
						delbook : 'del',
						IDremove : IDSelected
					};

					api.Submit(Page_Url, param, function(data) {

						$scope.refresh();

					});
					//

				}

			}
			//////////////////////end delete

			$scope.activeBook = function(MyVal) {
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
						activebook : 'active',
						IDremove : IDSelected
					};

					api.Submit(Page_Url, param, function(data) {

						$scope.refresh();

					});
					//

				}

			}
			//////////////////////end delete

			$scope.DeactiveBook = function(MyVal) {
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
						deactivebook : 'deactive',
						IDremove : IDSelected
					};

					api.Submit(Page_Url, param, function(data) {

						$scope.refresh();

					});
					//

				}

			}
			//////////////////////end delete

			$scope.refresh = function() {

				var param = {
					list : 'list'
				};
				api.Query(Page_Url, param, function(response) {
					//console.info(response);
					if (response != 'NODATA') {
						$scope.table1 = true;
						$scope.datagride = response;

					} else {
						$scope.TPLMessage_ERROR1 = true;
						$scope.table1 = false;
					}

				});
			}

			$scope.refresh();

	}

	//
}]);

