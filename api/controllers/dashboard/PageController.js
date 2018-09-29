
dashboardApp.controller('PageController', ['$scope','$rootScope','$routeParams','api','$location','Auth','Profile', function ($scope,$rootScope,$routeParams,api,$location,Auth,Profile) {
 
 
 
  Auth.AuthSession(); 
 
 
 
 

 
 
 
 
 //load Editor Options
$scope.tinymceOptions = {
	//selector:$scope.tinymceModel,
        theme: "modern",
        plugins: [
            "advlist autolink lists link image charmap print preview hr anchor pagebreak",
            "searchreplace wordcount visualblocks visualchars code fullscreen",
            "insertdatetime media nonbreaking save table contextmenu directionality",
            "emoticons template paste textcolor"
        ],
        toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
        toolbar2: "print preview media | forecolor backcolor emoticons",
        image_advtab: true,
        height: "200px",
        width: "650px",
       // toolbar: "ltr rtl",
        directionality:'rtl'
    };
 
  
$scope.urlparam = $routeParams.param;
 
 switch($scope.urlparam){
 	
 	case "add":
 	
 		$scope.BreadTitle ="  صفحة جديدة";
 	$scope.AddPage = function(){
 		$scope.TPLMessage_success =false;
 		$scope.TPLMessage_ERROR1 =false;
 		var Page_Url="../api/server/data/dashboard/page.php";
 		var titlePage = $scope.title;
 		var contentPage = $scope.tinymceModel;
 		var param = {title:titlePage,content:contentPage};
 		//console.info(param);
 			api.Submit(Page_Url, param, function(data) {
 				//console.info(data);
 				
 				if(data == "ADD_PAGE"){
 					$scope.TPLMessage_success =true;
 					$scope.TPLMessage_ERROR1 =false;
 					$scope.title = "";
 					$scope.tinymceModel ="";
 				}
 				
 				if(data == "ERROR_PAGE"){
 					$scope.TPLMessage_success =false;
 					$scope.TPLMessage_ERROR1 =true;
 					 
 				}
 				
 				
 				
 			});
 		//
 		
 	}
 	
 	
 	
 	break;
 	case "edit":
 	$scope.BreadTitle ="تعديل الصفحة";
 	
 		var Page_Url="../api/server/data/dashboard/page.php";
 		var Page_ID = $routeParams.id;
 	
 	
 	if(Page_ID == undefined){
 		$location.path('page/list');
 	}
 	////////////
 	
 	
 	$scope.EditPage = function(){
 		console.info('run...');
 			var titlePage = $scope.title;
 		var contentPage = $scope.tinymceModel;
 		var param = {edit:'edit',title_edit:titlePage,content_edit:contentPage,id:Page_ID};
 		 
 			api.Submit(Page_Url, param, function(data) {
 				console.info(data);
 				
 				if(data == "EDIT_PAGE"){
 					$scope.TPLMessage_success =true;
 					$scope.TPLMessage_ERROR1 =false;
 					 
 				}
 				
 				if(data == "ERROR_PAGE"){
 					$scope.TPLMessage_success =false;
 					$scope.TPLMessage_ERROR1 =true;
 					 
 				}
 				
 				
 			});
 	}
 	
 	///
 	
 	$scope.getPage = function(){
 		var param = {edit:'list',id:Page_ID};
 		  api.Query(Page_Url,param,function(response){
 		  //	console.info(response);
 		  		    $scope.title = response[0].title;
 					$scope.tinymceModel =response[0].content;
 		  });
 	}
 	
 	$scope.getPage();
 	
 	//
 	break;
 	default:
 	 
 	$scope.BreadTitle ="قائمة الصفحات";
 	//get Pagelist
 	
 	$scope.updateSelection = function(selectionValue) {
				for (var i = 0; i < 20; i++) {
					var el = document.getElementById('px_' + i);
					if (el != null) {
						el.checked = selectionValue;
					}

				}

			};
			
			
			
			
 	var Page_Url="../api/server/data/dashboard/page.php";
 	
 	$scope.TPLMessage_ERROR1 = false;
 	
  
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
 	        
 	       
 	//-------------

 	
 
 	
 	//
 	
 	
 	
 	
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
 	
 	
 	
 	
 	
 	$scope.refresh();
 	
 }
 
 
 

 //
}]);