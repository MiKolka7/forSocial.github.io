angular.module('app.controller.map', []).controller('mapCtrl', function($scope, $http) {
  var selectCity;
  selectCity = [];
  $http.get('http://api.prolaby.com/api/get/event/all?map').success(function(data) {
    return _.forEach(data, function(item) {
      return $scope.MapAddMarker(item);
    });
  });
  return $scope.selectCity = function() {
    var i;
    i = _.indexOf(selectCity[key], val) + 1;
    if (!i) {
      selectCity[key].push(val);
    } else {
      selectCity[key].splice(i - 1, 1);
    }
    return $http.get('http://api.prolaby.com/api/get/event/all?map', {
      params: {
        city: selectCity
      }
    }).success(function(data) {}, _.forEach(data, function(item) {
      return $scope.MapAddMarker(item);
    }));
  };
});
