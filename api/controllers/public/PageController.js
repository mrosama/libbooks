
BookApp.controller('PageController', ['$scope','BookCache','api','$routeParams','Profile','Auth', function ($a,b,api,$p,Profile,Auth) {
 	//console.info(Profile.getProfile());	
 //get Page Data
 
 //check if login here
 //Auth.AuthSession(); 
 
 
 
 
 var url="api/server/data/public/page.php";
 var param={id:$p.id};
 api.Query(url,param,function(response){
 
 	 if(typeof response !== "object"){
 	   $a.TPLMessage = true;
 		$a.TPLPAGE = false;
 	 } else {
 	 	
 	  
 	  
 	 	$a.TPLMessage = false;
 		$a.TPLPAGE = true;
 		$a.Page= {Title:response[0].title,Body:response[0].content};
 	 }
 	 
 	 
  
 	 
 	
 	
 	
 });
//end--------------------------------------------- 
 
 
 
 
}]);