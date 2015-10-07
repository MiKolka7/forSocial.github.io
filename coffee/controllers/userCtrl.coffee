angular.module('app.controller.user', [])
.controller('userCtrl', ($scope, $http, localStorageService, $stateParams) ->

    $scope.slides = [
        {"name": "Slide 1", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
        {"name": "Slide 2", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
        {"name": "Slide 3", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
        {"name": "Slide 4", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
        {"name": "Slide 5", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
        {"name": "Slide 6", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
        {"name": "Slide 7", "url": "http://cdn.intertech.com/Blog/wp-content/uploads/2014/12/angular-js-icon.jpg"}
    ]

    usersInfo = (id) ->
        $http.get('http://api.prolaby.com/api/get/user', {params: {idUser: id}})
        .success((data) ->

            _.forEach(data.events, (item) ->
                item.date_start = new Date item.date_start || new Date()
                item.date_end = new Date item.date_end || new Date()
            )

            $scope.user = data

            console.log $scope.user
        )

    console.log $stateParams.id
    usersInfo($stateParams.id)

    $scope.setRating = ($index) ->
        $http.get('http://api.prolaby.com/api/post/user/rating',
            {
                params:
                    id: user.idUser
                    idUser: 100
                    rate: $index++
            })
        .success((data) ->
            console.log data
        )
)