dashboardApp.controller('OptionController', ['$scope', '$rootScope', '$routeParams', 'api', '$location','Auth',
function($scope, $rootScope, $routeParams, api, $location,Auth) {

  Auth.AuthSession(); 
	//load Editor Options
	$scope.tinymceOptions = {
		//selector:$scope.tinymceModel,
		theme : "modern",
		plugins : ["advlist autolink lists link image charmap print preview hr anchor pagebreak", "searchreplace wordcount visualblocks visualchars code fullscreen", "insertdatetime media nonbreaking save table contextmenu directionality", "emoticons template paste textcolor"],
		toolbar1 : "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
		toolbar2 : "print preview media | forecolor backcolor emoticons",
		image_advtab : true,
		height : "200px",
		width : "650px",
		// toolbar: "ltr rtl",
		directionality : 'rtl'
	};

	/////

	var Page_Url = "../api/server/data/dashboard/option.php";

	$scope.refresh = function() {
		var param = {
			list : 'list'
		};
		api.Query(Page_Url, param, function(response) {
			//console.info(response[0]);
			if(response != "NOoptions"){
			//get message welcome	
			$scope.msg_title = response[0].msg_title;
            $scope.tinymceModel = response[0].msg_content;
            
            //getmail/////////////////////////////
            
          $scope.mail_sendmail   = response[0].mail_sendmail;
		  $scope.mail_sender     = response[0].mail_sender;
	      $scope.mail_type       = response[0].mail_type;
		  $scope.mail_smtp       = response[0].mail_smtp;
		  $scope.email_received  = response[0].email_received;
		  $scope.mail_server     = response[0].mail_server;
		  $scope.mail_port       = response[0].mail_port; 
		  $scope.mail_user       = response[0].mail_user;
	      $scope.mail_pwd        = response[0].mail_pwd;
	      $scope.mail_encryption = response[0].mail_encryption;
            
			}
			
            
            
		});

	}
	//-----------------------

	//
	
	
	$scope.AddOption = function(){
		var param ={editmsg:'editmsg',msg_title:$scope.msg_title,msg_content:$scope.tinymceModel} 
		api.Submit(Page_Url, param, function(data) {
			 //console.info(data);
			if(data == "UpdateOptions"){
				$scope.TPLMessage_success = true;
			} else {
				$scope.TPLMessage_success = false;
			}
			
		});
		
	}
	
	
	
$scope.addOptionEmail = function(){
	var param = {
		opemail:'email',
		mail_sendmail : $scope.mail_sendmail,
		mail_sender : $scope.mail_sender,
		mail_type : $scope.mail_type,
		mail_smtp : $scope.mail_smtp,
		email_received : $scope.email_received,
		mail_server : $scope.mail_server,
		mail_port : $scope.mail_port,
		mail_user : $scope.mail_user,
		mail_pwd : $scope.mail_pwd,
		mail_encryption : $scope.mail_encryption
	 
		
	}
		api.Submit(Page_Url, param, function(data) {
		 //console.info(data);
			
		});
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	//----------------------
	$scope.refresh();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}]);

