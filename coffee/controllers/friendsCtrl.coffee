angular.module 'app.controller.friends', []
    .controller 'friendsCtrl', ($scope, $http, localStorageService) ->

        user = localStorageService.cookie.get('user')

        $http.get('http://api.prolaby.com/api/get/event/all?map')
            .success( (data) ->
                $scope.users = data
            )

        $scope.setMessage = () ->

        $http.get('http://api/get/user/friends', {
            params:
                id: user.idUser
            })
            .success( (data) ->
                $scope.friends = data
            )

        $scope.addFriend = (id) ->
            $http.get('http://api/post/user/addFriend', {
                params:
                    idUser: user.idUser
                    idFriend: id
                })
                .success( (data) ->
                    $scope.users = data
                )
