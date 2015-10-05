angular.module('app.controller.events', []).controller('eventsCtrl', function($scope, $http, $rootScope) {
  var page, pageData;
  page = 0;
  pageData = function() {
    return $http.get('http://api.prolaby.com/api/get/event/all', {
      params: {
        page: page
      }
    }).success(function(data) {
      $scope.events = data;
      return $scope.loading = false;
    });
  };
  pageData();
  $scope.nextPage = function() {
    page++;
    return pageData();
  };
  $scope.chooseFilter = {
    city: [],
    month: [],
    type: []
  };
  return $scope.addFilter = function(key, val) {
    var i;
    i = _.indexOf($scope.chooseFilter[key], val) + 1;
    if (!i) {
      return $scope.chooseFilter[key].push(val);
    } else {
      return $scope.chooseFilter[key].splice(i - 1, 1);
    }
  };
});
