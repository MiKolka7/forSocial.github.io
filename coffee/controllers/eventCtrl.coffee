angular.module 'app.controller.event', []
    .controller 'eventCtrl', ($scope, $http, $stateParams, localStorageService, $serializeDate) ->

        user = localStorageService.cookie.get('user')

        $scope.joinText = 'Приєднатись'

        $http.get('http://api.prolaby.com/api/get/event', {params: {id: $stateParams.id}})
            .success( (data) ->
                $scope.event = $serializeDate(data[0])
            )

        $http.get('http://api.prolaby.com/api/get/event/comments', {params: {idEvent: $stateParams.id}})
            .success( (data) ->
#                _.forEach(data, (item) ->
#                    item.createDate = new Date(item.createDate)
#                )

                $scope.commments = $serializeDate(data)
                usersInfo($scope.commments)
            )

        usersInfo = (obj) ->
            _.forEach(obj, (item) ->
                $http.get('http://api.prolaby.com/api/get/user', {params: {idUser: item.idUser}})
                .success( (data) ->
                    item.user = $serializeDate(data)
                )
            )

        $scope.addComment = () ->
            $http.get('http://api.prolaby.com/api/post/event/comment',
                {params:
                    idEvent: $stateParams.id
                    idUser: user.idUser
                    text: $scope.comment
                })
                .success( (data) ->
                    if data
                        newComment =
                            user: {
                                idUser: user.idUser
                                name: user.name
                            }
                            text: $scope.comment
                            createDate: new Date()

                        $scope.comment = ''

                        $scope.commments.push(newComment)
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