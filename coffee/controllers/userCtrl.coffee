angular.module('app.controller.user', [])
.controller 'userCtrl', ($scope, $http, localStorageService, $stateParams, Notification) ->

    idUser = localStorageService.cookie.get('user').idUser

    usersInfo = (id) ->
        $http.get('http://api.prolaby.com/api/get/user', {params: {idUser: id}})
        .success((data) ->

            _.forEach(data.events, (item) ->
                item.date_start = new Date item.date_start || new Date()
                item.date_end = new Date item.date_end || new Date()
            )

            $scope.user = data

            _.forEach($scope.user.events, (item) ->
                item.date_start = new Date item.date_start || new Date()
                item.date_end = new Date item.date_end || new Date()
            )

            $scope.edit = ($scope.user.idUser is idUser)

            $http.get('http://api.prolaby.com/api/get/city/all').success (data) ->
                $scope.cites = data
                b = data.filter (item) ->
                    return item.idCity is $scope.user.idcity
#                console.log data
                if b.length
                    $scope.user.city = b[0]
        )

    usersInfo($stateParams.id)

    $http.get('http://api.prolaby.com/Api/get/user/rating?id=' + $stateParams.id)
        .success( (data) ->
            $scope.rating = parseFloat(data.ave) || 0
#            console.log data
        )

    $scope.setRating = ($index) ->
        $http.get('http://api.prolaby.com/api/post/user/rating',
            {params:
                id: $stateParams.id
                idUser: $scope.user.idUser
                rating: ++$index
            }
        ).success((data) ->
#            console.log data
        )

    $scope.updateInfo = () ->
        $http.get('http://api.prolaby.com/Api/put/user/info',
            {params:
                id: $stateParams.id
                fb: $scope.user.fb
                phone1: $scope.user.phone1
                phone2: $scope.user.phone2
                birthdate: $scope.user.birthdate
            }
        ).success((data) ->
            console.log data
            localStorageService.cookie.set('user', $scope.user)
            Notification.success('Дані збережено!');
        )
