angular.module('app.controller.user', []).controller('userCtrl', function($scope, $http, localStorageService, $stateParams, Notification) {
  var idUser, usersInfo;
  idUser = localStorageService.cookie.get('user').idUser;
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
      _.forEach($scope.user.events, function(item) {
        item.date_start = new Date(item.date_start || new Date());
        return item.date_end = new Date(item.date_end || new Date());
      });
      $scope.edit = $scope.user.idUser === idUser;
      return $http.get('http://api.prolaby.com/api/get/city/all').success(function(data) {
        var b;
        $scope.cites = data;
        b = data.filter(function(item) {
          return item.idCity === $scope.user.idcity;
        });
        if (b.length) {
          return $scope.user.city = b[0];
        }
      });
    });
  };
  usersInfo($stateParams.id);
  $http.get('http://api.prolaby.com/Api/get/user/rating?id=' + $stateParams.id).success(function(data) {
    return $scope.rating = parseFloat(data.ave) || 0;
  });
  $scope.setRating = function($index) {
    return $http.get('http://api.prolaby.com/api/post/user/rating', {
      params: {
        id: $stateParams.id,
        idUser: $scope.user.idUser,
        rating: ++$index
      }
    }).success(function(data) {});
  };
  return $scope.updateInfo = function() {
    return $http.get('http://api.prolaby.com/Api/put/user/info', {
      params: {
        id: $stateParams.id,
        fb: $scope.user.fb,
        phone1: $scope.user.phone1,
        phone2: $scope.user.phone2,
        birthdate: $scope.user.birthdate
      }
    }).success(function(data) {
      console.log(data);
      localStorageService.cookie.set('user', $scope.user);
      return Notification.success('Дані збережено!');
    });
  };
});
