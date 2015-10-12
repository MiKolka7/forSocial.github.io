angular.module('app.controller.addEvent', []).controller('addEventCtrl', function($scope, $http, localStorageService) {
  var user;
  user = localStorageService.cookie.get('user');
  return $scope.addEvent = function() {
    var event;
    if ($scope.formAddEvent.$valid) {
      event = {};
      event = _.clone($scope.event);
      event.date_start = +event.date_start;
      event.date_end = +event.date_end;
      event.iduser = +user.idUser;
      event.cover = event.photo;
      return $http.get('http://api.prolaby.com/api/post/event', {
        params: event
      }).success(function(data) {
        return console.log(data);
      });
    }
  };
});
