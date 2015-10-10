angular.module('app.controller.organizations', []).controller('organizationsCtrl', function($scope, $http, $serializeDate) {
  $http.get('http://api.prolaby.com/api/get/company/all', {
    params: {
      type: 1
    }
  }).success(function(data) {
    return $scope.organizations = $serializeDate(data);
  });
  $http.get('http://api.prolaby.com/api/get/company/all', {
    params: {
      type: 2
    }
  }).success(function(data) {
    return $scope.companies = $serializeDate(data);
  });
  $http.get('http://api.prolaby.com/api/get/scopes/all').success(function(data) {
    return $scope.scopes = data;
  });
  $scope.type = 1;
  $scope.chooseFilter = [];
  return $scope.addFilter = function(val) {
    var i;
    i = _.indexOf($scope.chooseFilter, val) + 1;
    if (!i) {
      return $scope.chooseFilter.push(val);
    } else {
      return $scope.chooseFilter.splice(i - 1, 1);
    }
  };
});
