angular.module('app.controller.organizations', []).controller('organizationsCtrl', function($scope, $http) {
  $scope.type = 1;
  $http.get('http://api.prolaby.com/api/get/company/all', {
    params: {
      type: 1
    }
  }).success(function(data) {
    return $scope.organizations = data;
  });
  $http.get('http://api.prolaby.com/api/get/company/all', {
    params: {
      type: 2
    }
  }).success(function(data) {
    return $scope.companies = data;
  });
  return $http.get('http://api.prolaby.com/api/get/scopes/all').success(function(data) {
    return $scope.scopes = data;
  });
});
