
dashboardApp.controller('InboxController', ['$scope','$rootScope','$routeParams','api','$location','ngDialog','$modal','Auth', function ($scope,$rootScope,$routeParams,api,$location,ngDialog,$modal,Auth) {
 
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
	var Page_Url = "../api/server/data/dashboard/inbox.php";
	
 switch($scope.urlparam) {
 case "add":
  $scope.BreadTitle = "  رسالة جديدة";
 
 	$scope.TPLMessage_success	=false;
 	$scope.SendMessage =function(){
 		var param = {composer:'email',email: $scope.to,subject:$scope.subject,message:$scope.tinymceModel};
 		//console.info(param);
 			 api.Submit(Page_Url, param, function(data) {
 				if(data=='send'){
 					$scope.to ="";
 					$scope.subject ="";
 					$scope.tinymceModel="";
 				$scope.TPLMessage_success	=true;
 					
 				}
 				
 			}); 
 		
 	}
 
 
 //
 break;
 
 case "preview":
 $scope.BreadTitle = "  الرسالة";
 
 	var Message_ID = $routeParams.id;
 	
 	
 	if(Message_ID == undefined){
 		$location.path('inbox/list');
 	}
 	
 	//
 	
 	
 	
 	
 	
 	$scope.getMessage = function(){
 		var param = {edit:'list',id:Message_ID};
 		  api.Query(Page_Url,param,function(response){
 		  	//console.info(response);
 		  	        $scope.to = response[0].email;
 		  		    $scope.messageinfo = response[0];
 		  		   
 		  });
 	}
 	
 	$scope.getMessage();
 	
 	
 	
 	$scope.TPLMessage_success	=false;
 	$scope.SendMessage =function(){
 		var param = {send:'email',email: $scope.to,subject:$scope.subject,message:$scope.tinymceModel};
 			api.Submit(Page_Url, param, function(data) {
 				if(data=='send'){
 					$scope.subject ="";
 					$scope.tinymceModel="";
 				$scope.TPLMessage_success	=true;
 					
 				}
 				
 			});
 		
 	}
 	
 	
 
 ///
 break;
 default:
 
 /*
  $scope.open = function () {
					ngDialog.open({
						template: 'templateID_30',
					   controller: 'InboxController',
						className: 'ngdialog-theme-default ngdialog-theme-custom'
					});
				};*/
 
 /* $scope.open = function (size) {
    var modalInstance = $modal.open({
      templateUrl: 'myModalContent.html',
      controller: ModalInstanceCtrl,
      size: size
    });

    modalInstance.result.then(function (take_me_outside) {
      $scope.message = take_me_outside;
    });
  };
};

// Please note that $modalInstance represents a modal window (instance) dependency.
// It is not the same as the $modal service used above.

var ModalInstanceCtrl = function ($scope, $modalInstance) {
  $scope.take_me_outside = "asdfasdf";
  
  $scope.ok = function (take_me_outside) {
    console.log($modalInstance);
    $modalInstance.close(take_me_outside);
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
    */
    
 
 
 
 
 
 
 $scope.table1 = true;
 $scope.BreadTitle = "    صندوق الرسائل";
 ////
 
 
 
   
 
 
 //////
 	$scope.updateSelection = function(selectionValue) {
				for (var i = 0; i < 20; i++) {
					var el = document.getElementById('px_' + i);
					if (el != null) {
						el.checked = selectionValue;
					}

				}

			};
			
	//--------------------------------------------------
	
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
 
						$scope.refresh();

					});
					//

				}

			}
 
	
			
			
 
 
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
 
 
 
 
 
 
 
 
 
 
 
 $scope.refresh();
 //---
 }
 //end switch
 
 
 
 
 
 
 
 
  
 //
}]);