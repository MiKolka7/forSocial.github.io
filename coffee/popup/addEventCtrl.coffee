angular.module 'app.controller.addEvent', []
    .controller 'addEventCtrl', ($scope, $http, localStorageService) ->

        user = localStorageService.cookie.get('user')

        $scope.addEvent = () ->
            if ($scope.formAddEvent.$valid)

                event = {}
                event = _.clone($scope.event)

                event.date_start = +event.date_start
                event.date_end = +event.date_end
                event.cover = event.photo
                console.log event

                $http.get('http://api.prolaby.com/api/post/event', {params: ''})
                    .success( (data) ->
                        console.log data
                    )
