angular.module 'app.controller.login', []
    .controller 'loginCtrl', ($scope, $http) ->

        $scope.auth = () ->
            if $scope.login.$valid
                console.log $scope.user
                $http.get('http://api.prolaby.com/api/get/user/auth', {params: $scope.user})
                    .success( (data) ->
                        console.log 'user auth', data
                    )