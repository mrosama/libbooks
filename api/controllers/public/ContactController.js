
BookApp.controller('ContactController', ['$scope','BookCache','api','$routeParams', function ($a,b,api,$p) {
  
   $a.captch = api.Captcha(7);
   $a.formcontact        = true;
   $a.TPLMessage_ERROR   = false;
   $a.TPLMessage_success = false;
   $a.TPLMessage_CAPATCH = false;
 $a.submitForm = function(){
 	var captchinput = $a.captchinput;
 	var user_name= $a.user_name;
 	var user_email = $a.user_email;
 	var user_title = $a.user_title;
 	var user_msg = $a.user_msg;
  
  	 var datasend={
 	 	user_name : user_name,
 	 	user_email : user_email,
 	 	user_title : user_title,
 	 	user_msg : user_msg
 	              };
  
  
  
   if( $a.captch == captchinput)
   {
   	
   	 var url="api/server/data/public/contact.php";
     var param=datasend;
   	 api.Submit(url,param,function(data){
   	 //	console.info(data);
  	 	 if(data == 'ADD'){
     	$a.TPLMessage_success = true;
     	$a.formcontact     = false;
  	    $a.TPLMessage_ERROR   = false;
  	    $a.TPLMessage_CAPATCH = false;
  }
   
  	  if(data == 'ERROR'){
  	    $a.TPLMessage_success = false;
    	$a.formcontact     = true;
  	    $a.TPLMessage_ERROR   = true;
  	    $a.TPLMessage_CAPATCH = false;
  }
   	 	
   	 });
   	
   	
   	
   } else {
   	
        	 $a.TPLMessage_CAPATCH = true;
 			$a.TPLMessage_ERROR   = false;
            $a.TPLMessage_success = false;
   }
  
  
  
  
  
  
 
 //end function
 };
 
 
 
 
 
}]);