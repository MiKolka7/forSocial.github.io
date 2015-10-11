angular.module 'app.controller.friends', []
    .controller 'friendsCtrl', ($scope, $http, localStorageService) ->

        page = 1
        usersData = []
        $scope.users = []

        user = localStorageService.cookie.get('user')
        console.log user

        $http.get('http://api.prolaby.com/api/get/user/all')
            .success( (data) ->
#                usersData = data
                $scope.users = data

#                _.forEach(data, (item, i) ->
#                    if i < page * 10 - 1
#                        $scope.users.push(item)
#                )
#                $scope.loading = false
            )

        $scope.setMessage = () ->


        $http.get('http://api.prolaby.com/api/get/user/friends', {
            params:
                id: user.idUser
            })
            .success( (data) ->
                $scope.friends = data
                console.log data
            )

        $scope.addFriend = (id) ->
            $http.get('http://api.prolaby.com/api/post/user/addFriend', {
                params:
                    idUser: id
                    idFriend: user.idUser
                })
                .success( (data) ->
                    console.log data
                )

        $scope.nexPage = () ->
            page++

            _.forEach(usersData, (item, i) ->
                if (page - 1) * 10 < page * 10 - 1
                    $scope.users.push(item)
            )
            $scope.loading = false