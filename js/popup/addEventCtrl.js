angular.module('app.controller.addEvent', []).controller('addEventCtrl', function($scope, $http, localStorageService) {
  var user;
  $scope.event = {};
  $scope.visibleMap = false;
  user = localStorageService.cookie.get('user');
  $scope.addEvent = function() {
    var event;
    if ($scope.formAddEvent.$valid) {
      event = _.clone($scope.event);
      event.date_start = +event.date_start;
      event.date_end = +event.date_end;
      event.iduser = +user.idUser;
      return $http.get('http://api.prolaby.com/api/post/event', {
        params: event
      }).success(function(data) {
        console.log(data);
        return $scope.event = {};
      });
    }
  };
  $scope.openMap = function() {
    return $scope.visibleMap = !$scope.visibleMap;
  };
  return $scope.setLatLng = function(lat, lng) {
    $scope.event.lat = lat;
    $scope.event.long = lng;
    return $http.get('http://maps.google.com/maps/api/geocode/json', {
      params: {
        latlng: lat + ',' + lng
      }
    }).success(function(data) {
      return $scope.event.address = data.results[0].formatted_address;
    });
  };
});
