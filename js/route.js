angular.module('app.config.route', []).config(function($routeProvider) {
  return $routeProvider.when('/registration', {
    controller: 'registrationCtrl',
    templateUrl: 'template/registration.html'
  }).otherwise({
    redirectTo: '/main'
  });
});
