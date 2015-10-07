angular.module('app.controller.user', []).controller('userCtrl', function($scope, $http, localStorageService, $stateParams) {
  $scope.user = localStorageService.cookie.get('user');
  _.forEach($scope.user.events, function(item) {
    item.date_start = new Date(item.date_start || new Date());
    return item.date_end = new Date(item.date_end || new Date());
  });
  console.log($scope.user);
  return $scope.setRating = function($index) {
    return $http.get('http://api.prolaby.com/api/post/user/rating', {
      params: {
        id: user.idUser,
        idUser: 100,
        rate: ++$index
      }
    }).success(function(data) {
      return console.log(data);
    });
  };
});
