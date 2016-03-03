angular.module 'app.controller.addEvent', []
    .controller 'addEventCtrl', ($scope, $http, localStorageService) ->

        $scope.event = {}
        $scope.visibleMap = false
        user = localStorageService.cookie.get('user')

        $scope.addEvent = () ->
            if ($scope.formAddEvent.$valid)
                event = _.clone($scope.event)

                event.date_start = +event.date_start
                event.date_end = +event.date_end
                event.iduser = +user.idUser

                $http.get('http://api.prolaby.com/api/post/event', { params: event })
                    .success (data) ->
                        console.log data
                        $scope.event = {}
                    

        $scope.openMap = () ->
            $scope.visibleMap = !$scope.visibleMap


        $scope.setLatLng = (lat, lng) ->
            $scope.event.lat = lat
            $scope.event.long = lng

            $http.get('http://maps.google.com/maps/api/geocode/json', {params: latlng: lat + ',' + lng})
                .success (data) ->
                    $scope.event.address = data.results[0].formatted_address