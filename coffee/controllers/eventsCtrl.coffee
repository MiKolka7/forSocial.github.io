angular.module 'app.controller.events', []
    .controller 'eventsCtrl', ($scope, $http) ->

        $http.get('http://api.prolaby.com/api/get/event/all')
            .success( (data) ->
                $scope.events = data
            )

        console.log $scope.events


        $scope.chooseFilter =
            city: []
            month: []
            type: []


        $scope.addFilter = (key, val) ->
            i = _.indexOf($scope.chooseFilter[key], val) + 1

            if !i
                $scope.chooseFilter[key].push val
            else
                $scope.chooseFilter[key].splice i - 1, 1


        $scope.nextPage = () ->
            $scope.events.push [0..9]