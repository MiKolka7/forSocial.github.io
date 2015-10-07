angular.module 'app.controller.map', []
    .controller 'mapCtrl', ($scope, $http) ->

        selectCity = []
        allCity = []

        $http.get('http://api.prolaby.com/api/get/event/all?map')
            .success( (data) ->
                allCity = data

                _.forEach(data, (item)->
                    $scope.MapAddMarker item
                )
            )

        $scope.selectCity = (val) ->
            filterCity = []
            i = _.indexOf(selectCity, val) + 1

            if !i
                selectCity.push val
            else
                selectCity.splice i - 1, 1

            _.forEach(selectCity, (selectCityItem, i)->
                filterCity[i] = _.filter(allCity, (item) ->
                    return selectCityItem is item.idcity
                )
            )

            result = [];
            _.forEach(filterCity, (arr)->
                _.forEach(arr, (item) ->
                    result.push item
                )
            )
            console.log result

            _.forEach(result, (item)->
                $scope.MapAddMarker item
            )