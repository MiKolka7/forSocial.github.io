angular.module('app.controller.user', [])
.controller('userCtrl', ($scope, $http, localStorageService, $stateParams) ->

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

    usersInfo($stateParams.id)

    $scope.user = localStorageService.cookie.get('user')

    _.forEach($scope.user.events, (item) ->
        item.date_start = new Date item.date_start || new Date()
        item.date_end = new Date item.date_end || new Date()
    )

    console.log $scope.user


    $scope.setRating = ($index) ->
        $http.get('http://api.prolaby.com/api/post/user/rating',
            {
                params:
                    id: user.idUser
                    idUser: 100
                    rate: ++$index
            })
        .success((data) ->
            console.log data
        )
)