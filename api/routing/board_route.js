

dashboardApp.config(['$routeProvider', '$locationProvider', function ($routeProvider,$locationProvider) {
 
  

  $routeProvider
  .when('/', {
    templateUrl: '../template/dashboard/default.html',
    controller: 'MainController'
  })
  .when('/page/:param/:id?', {
    templateUrl: '../template/dashboard/page.html',
    controller: 'PageController'
  })
    .when('/option', {
    templateUrl: '../template/dashboard/option.html',
    controller: 'OptionController'
  })
  
    .when('/links/:param', {
    templateUrl: '../template/dashboard/links.html',
    controller: 'LinksController'
  })
  
    .when('/inbox/:param/:id?', {
    templateUrl: '../template/dashboard/inbox.html',
    controller: 'InboxController'
  })
  
     .when('/poll/:param/:id?', {
    templateUrl: '../template/dashboard/poll.html',
    controller: 'PollController'
  })
  
       .when('/adv/:param/:id?', {
    templateUrl: '../template/dashboard/adv.html',
    controller: 'AdvController'
  })
  
        .when('/book/:param/:id?', {
    templateUrl: '../template/dashboard/book.html',
    controller: 'BookController'
  })
  
  
 .when('/member/:param/:id?', {
    templateUrl: '../template/dashboard/member.html',
    controller: 'MembersController'
  })
 
  
  .otherwise({
    redirectTo: '/'
  });
  
$locationProvider.html5Mode(true).hashPrefix('!');

}]);
