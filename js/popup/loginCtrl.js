angular.module('app.controller.login', []).controller('loginCtrl', function($scope, $http, localStorageService, $location) {
  return $scope.auth = function() {
    if ($scope.login.$valid) {
      return $http.get('http://api.prolaby.com/api/get/user/auth', {
        params: $scope.user
      }).success(function(data) {
        console.log(data);
        if (data) {
          $scope.closeThisDialog();
          localStorageService.cookie.set('user', data[0]);
          return $location.url('/events');
        }
      });
    }
  };
});
