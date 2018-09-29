

BookApp.config(['$routeProvider', '$locationProvider', function ($routeProvider,$locationProvider) {
 
  

  $routeProvider
  .when('/', {
    templateUrl: 'template/public/default.html',
    controller: 'MainController'
  })
  .when('/page/:id', {
    templateUrl: 'template/public/page.html',
    controller: 'PageController'
  })
  .when('/register/:slug', {
    templateUrl: 'template/public/register.html',
    controller: 'UserController'
  })
   .when('/contact', {
    templateUrl: 'template/public/contact.html',
    controller: 'ContactController'
  })
  
    .when('/addbook', {
    templateUrl: 'template/public/addbook.html',
    controller: 'MainController'
  })
  
    .when('/library/:cat?', {
    templateUrl: 'template/public/book.html',
    controller: 'LibraryController'
  })
  
   .when('/view/:cat/:id', {
    templateUrl: 'template/public/viewbook.html',
    controller: 'ListController'
  })
  
  .when('/search/:param', {
    templateUrl: 'template/public/search.html',
    controller: 'SearchController'
  })
  
   .when('/404', {
    templateUrl: 'template/public/404.html'
     
  })
  
    .when('/links', {
    templateUrl: 'template/public/links.html',
    controller: 'LinksController'
  })
  .otherwise({
    redirectTo: '/'
  });
  
$locationProvider.html5Mode(true).hashPrefix('!');

}]);
