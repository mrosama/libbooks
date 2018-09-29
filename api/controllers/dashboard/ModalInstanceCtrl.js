dashboardApp.controller('ModalInstanceCtrl', ['$scope','$modalInstance','$location','getadv', function ($scope,$modalInstance,$location,getadv) {
 
$scope.advert= getadv;



$scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
 //
}]);