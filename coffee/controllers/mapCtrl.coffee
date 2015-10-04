angular.module 'app.controller.map', []
    .controller 'mapCtrl', ($scope, $http) ->

        selectCity = []

        $http.get('http://api.prolaby.com/api/get/event/all?map')
            .success( (data) ->
                _.forEach(data, (item)->
                    $scope.MapAddMarker item
                )
            )

        $scope.selectCity = () ->
            i = _.indexOf(selectCity[key], val) + 1

            if !i
                selectCity[key].push val
            else
                selectCity[key].splice i - 1, 1

            $http.get('http://api.prolaby.com/api/get/event/all?map', {params: {city: selectCity}} )
                .success( (data) ->
                _.forEach(data, (item)->
                    $scope.MapAddMarker item
                )
            )