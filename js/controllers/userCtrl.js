angular.module('app.controller.user', []).controller('userCtrl', function($scope, $http, localStorageService, $stateParams) {
  var usersInfo;
  usersInfo = function(id) {
    return $http.get('http://api.prolaby.com/api/get/user', {
      params: {
        idUser: id
      }
    }).success(function(data) {
      _.forEach(data.events, function(item) {
        item.date_start = new Date(item.date_start || new Date());
        return item.date_end = new Date(item.date_end || new Date());
      });
      $scope.user = data;
      return console.log($scope.user);
    });
  };
  usersInfo($stateParams.id);
  $scope.user = localStorageService.cookie.get('user');
  _.forEach($scope.user.events, function(item) {
    item.date_start = new Date(item.date_start || new Date());
    return item.date_end = new Date(item.date_end || new Date());
  });
  console.log($scope.user);
  $http.get('http://api.prolaby.com/Api/get/user/rating?id=' + $stateParams.id).success(function(data) {
    $scope.rating = data.ave || 0;
    return console.log(data);
  });
  return $scope.setRating = function($index) {
    return $http.get('http://api.prolaby.com/api/post/user/rating', {
      params: {
        id: $stateParams.id,
        idUser: $scope.user.idUser,
        rate: ++$index
      }
    }).success(function(data) {
      return console.log(data);
    });
  };
});
