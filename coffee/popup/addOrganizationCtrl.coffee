angular.module 'app.controller.addOrganization', []
    .controller 'addOrganizationCtrl', ($scope) ->

        user = localStorageService.cookie.get('user')

        $scope.addOrg = () ->
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
