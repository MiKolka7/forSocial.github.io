angular.module 'app.controller.addOrganization', []
    .controller 'addOrganizationCtrl', ($scope) ->

        user = localStorageService.cookie.get('user')

        $scope.addCompany = () ->
            if ($scope.formAddCompany.$valid)

                event = {}
                event = _.clone($scope.event)

                event.date_start = +event.date_start
                event.date_end = +event.date_end
                event.cover = event.photo
                event.iduser = +user.idUser
                event.cover = event.photo
                console.log event

                $http.get('http://api.prolaby.com/api/post/event', {params: ''})
                .success( (data) ->
                    console.log data
                )
