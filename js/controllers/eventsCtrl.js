angular.module('app.controller.events', []).controller('eventsCtrl', function($scope, $http) {
  $http.get('http://api.prolaby.com/api/get/event/all').success(function(data) {
    return $scope.events = data;
  });
  console.log($scope.events);
  $scope.chooseFilter = {
    city: [],
    month: [],
    type: []
  };
  $scope.addFilter = function(key, val) {
    var i;
    i = _.indexOf($scope.chooseFilter[key], val) + 1;
    if (!i) {
      return $scope.chooseFilter[key].push(val);
    } else {
      return $scope.chooseFilter[key].splice(i - 1, 1);
    }
  };
  return $scope.nextPage = function() {
    return $scope.events.push([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
  };
});
