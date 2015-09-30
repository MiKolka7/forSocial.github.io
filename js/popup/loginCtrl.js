angular.module('app.controller.login', []).controller('loginCtrl', function($scope, $http) {
  return $scope.auth = function() {
    if ($scope.login.$valid) {
      console.log($scope.user);
      return $http.get('http://api.prolaby.com/api/get/user/auth', {
        params: $scope.user
      }).success(function(data) {
        return console.log('user auth', data);
      });
    }
  };
});
