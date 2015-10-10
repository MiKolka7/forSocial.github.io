angular.module 'app.controller.organization', []
    .controller 'organizationCtrl', ($scope, $http, $serializeDate, $stateParams, localStorageService) ->

        user = localStorageService.cookie.get('user')

        $http.get('http://api.prolaby.com/api/get/company', {params: {id: $stateParams.id}})
            .success( (data) ->
                $scope.organization = $serializeDate(data.company)
        )

        $http.get('http://api.prolaby.com/api/get/company/comments', {params: {idCompany: $stateParams.id}})
            .success( (data) ->
                $scope.commments = $serializeDate(data)
                console.log $scope.commments
                usersInfo($scope.commments)
        )

        $http.get('http://api.prolaby.com/api/get/company/rating', {params: {id: $stateParams.id}})
            .success( (data) ->
                $scope.rating = data.ave || 0
        )

        usersInfo = (obj) ->
            _.forEach(obj, (item) ->
                $http.get('http://api.prolaby.com/api/get/user', {params: {idUser: item.idUser}})
                .success( (data) ->
                    item.user = $serializeDate(data)
                )
            )

        $scope.addComment = () ->
            $http.get('http://api.prolaby.com/api/post/company/comments',
                {params:
                    idCompany: $stateParams.id
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