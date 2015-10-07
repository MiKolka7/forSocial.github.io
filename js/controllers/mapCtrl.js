angular.module('app.controller.map', []).controller('mapCtrl', function($scope, $http) {
  var allCity, selectCity;
  selectCity = [];
  allCity = [];
  $http.get('http://api.prolaby.com/api/get/event/all?map').success(function(data) {
    allCity = data;
    return _.forEach(data, function(item) {
      return $scope.MapAddMarker(item);
    });
  });
  return $scope.selectCity = function(val) {
    var filterCity, i, result;
    filterCity = [];
    i = _.indexOf(selectCity, val) + 1;
    if (!i) {
      selectCity.push(val);
    } else {
      selectCity.splice(i - 1, 1);
    }
    _.forEach(selectCity, function(selectCityItem, i) {
      return filterCity[i] = _.filter(allCity, function(item) {
        return selectCityItem === item.idcity;
      });
    });
    result = [];
    _.forEach(filterCity, function(arr) {
      return _.forEach(arr, function(item) {
        return result.push(item);
      });
    });
    console.log(result);
    return _.forEach(result, function(item) {
      return $scope.MapAddMarker(item);
    });
  };
});
