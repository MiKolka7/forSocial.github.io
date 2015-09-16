angular.module('app.controller.events', []).controller('eventsCtrl', function($scope) {
  $scope.events = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  return $scope.events.nextPage = function() {
    console.log('sd');
    return $scope.events.push([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
  };
});
