angular.module 'app.controller.login', []
    .controller 'loginCtrl', ($scope, $http, localStorageService, $location) ->


        $scope.auth = () ->
            if $scope.login.$valid
                $http.get('http://api.prolaby.com/api/get/user/auth', {params: $scope.user})
                    .success( (data) ->
                        console.log data
                        if data
                            $scope.closeThisDialog()
                            localStorageService.cookie.set('user', data[0])
                            $location.url('/events')
                    )