angular.module('app.controller.user', [])
.controller('userCtrl', ($scope, $http) ->
  $scope.slides = [
    {"name": "Slide 1", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
    {"name": "Slide 2", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
    {"name": "Slide 3", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
    {"name": "Slide 4", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
    {"name": "Slide 5", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
    {"name": "Slide 6", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
    {"name": "Slide 7", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
  ]

#  user = localStorageService.cookie.get('user')

  usersInfo = (obj) ->
    $http.get('http://api.prolaby.com/api/get/user', {params: {idUser: obj.idUser}})
    .success( (data) ->
      $scope.user = data
    )
  user = usersInfo(idUser: 50)

  $scope.setRating = ($index) ->
    $http.get('http://api.prolaby.com/api/post/user/rating',
      {params:
        id: user.idUser
        idUser: 100
        rate: $index++
      })
    .success( (data) ->
      console.log data
    )


)