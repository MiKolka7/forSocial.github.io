angular.module('app.controller.user', []).controller('userCtrl', function($scope, $http) {
  var user, usersInfo;
  $scope.slides = [
    {
      "name": "Slide 1",
      "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"
    }, {
      "name": "Slide 2",
      "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"
    }, {
      "name": "Slide 3",
      "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"
    }, {
      "name": "Slide 4",
      "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"
    }, {
      "name": "Slide 5",
      "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"
    }, {
      "name": "Slide 6",
      "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"
    }, {
      "name": "Slide 7",
      "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"
    }
  ];
  usersInfo = function(obj) {
    return $http.get('http://api.prolaby.com/api/get/user', {
      params: {
        idUser: obj.idUser
      }
    }).success(function(data) {
      return $scope.user = data;
    });
  };
  user = usersInfo({
    idUser: 50
  });
  return $scope.setRating = function($index) {
    return $http.get('http://api.prolaby.com/api/post/user/rating', {
      params: {
        id: user.idUser,
        idUser: 100,
        rate: $index++
      }
    }).success(function(data) {
      return console.log(data);
    });
  };
});
