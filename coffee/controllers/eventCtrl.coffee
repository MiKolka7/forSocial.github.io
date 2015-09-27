angular.module 'app.controller.event', []
    .controller 'eventCtrl', ($scope, $http, $stateParams) ->

        $http.get('http://api.prolaby.com/api/get/event/', {params: {id: $stateParams.id}})
            .success( (data) ->
                $scope.event = data[0]
                console.log(data[0])
            )

        $http.get('http://api.prolaby.com/api/get/event/comments', {params: {idEvent: $stateParams.id}})
            .success( (data) ->
                _.forEach(data, (item) ->
                    item.createDate = new Date(item.createDate)
                )

                $scope.commments = data
                usersInfo($scope.commments)
            )

        usersInfo = (obj) ->
            _.forEach(obj, (item) ->
                $http.get('http://api.prolaby.com/api/get/user', {params: {idUser: item.idUser}})
                .success( (data) ->
                    item.user = data
                )
            )

        $scope.addComment = () ->
            $http.get('http://api.prolaby.com/api/post/event/comment',
                {params:
                    idEvent: $stateParams.id
                    idUser: 17
                    text: $scope.comment
                })
                .success( (data) ->
                    if data
                        $scope.comment = ''

                        newComment =
                            idUser: 17
                            text: $scope.comment
                            createDate: new Date()

                        $scope.commments.push(newComment)
                        usersInfo(newComment)
            )

        $scope.join = () ->
            $http.get('http://api.prolaby.com/api/post/user/join',
                {params:
                    idEvent: $stateParams.id
                    idUser: 14
                })
                .success( (data) ->
                    console.log data
                )