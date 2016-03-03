angular.module 'app.controller.event', []
    .controller 'eventCtrl', ($scope, $http, $stateParams, localStorageService, $serializeDate) ->

        $scope.joinText = 'Приєднатись'

        $http.get('http://api.prolaby.com/api/get/event', {params: {id: $stateParams.id}})
            .success( (data) ->
                $scope.event = $serializeDate(data)[0]
                console.log $scope.event
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
            $http.get("http://api.prolaby.com/api/#{typeJoin}/user/join",
                {params:
                    idEvent: $stateParams.id
                    idUser: user.idUser
                })
                .success( (data) ->
                    if data
                        if typeJoin is 'post'
                            $scope.joinText = 'Відєднатись'
                            typeJoin = 'post'
                        else
                            $scope.joinText = 'Приєднатись'
                            typeJoin = 'delete'
            )

        user = localStorageService.cookie.get('user')
        typeJoin = 'post'

        $http.get('http://api.prolaby.com/api/get/user', {params: {idUser: user.idUser}})
            .success( (data) ->
                user = $serializeDate(data)
                console.log user

                _.forEach(user.events, (item) ->
                    if item.idEvent is String($stateParams.id)
                        typeJoin = 'delete'
                        $scope.joinText = 'Відєднатись'
                        return
                )
            )