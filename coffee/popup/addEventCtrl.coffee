angular.module 'app.controller.addEvent', []
    .controller 'addEventCtrl', ($scope, $http, localStorageService) ->

        user = localStorageService.cookie.get('user')

        $scope.addEvent = () ->
            if ($scope.formAddEvent.$valid)

                event = {}
                event = _.clone($scope.event)

                event.date_start = +event.date_start
                event.date_end = +event.date_end
                event.iduser = +user.idUser
                event.cover = event.photo

                $http.get('http://api.prolaby.com/api/post/event', { params: event })
                    .success( (data) ->
                        console.log data
                    )