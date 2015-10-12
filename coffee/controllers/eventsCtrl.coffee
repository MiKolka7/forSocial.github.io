angular.module 'app.controller.events', []
    .controller 'eventsCtrl', ($scope, $http, $rootScope, $sce) ->

        page = 0
        $scope.events = []

        pageData = () ->
            $http.get('http://api.prolaby.com/api/get/event/all', {params: {page: page}})
                .success( (data) ->
                    console.log data
                    if !_.isEmpty data
                        $scope.events = [].concat $scope.events, data
                    $scope.loading = false
                )

        pageData()

        $scope.nextPage = () ->
            page++
            pageData()

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

            console.log $scope.chooseFilter