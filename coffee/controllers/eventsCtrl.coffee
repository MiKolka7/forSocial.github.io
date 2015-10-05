angular.module 'app.controller.events', []
    .controller 'eventsCtrl', ($scope, $http, $rootScope) ->

        page = 0

        pageData = () ->
            $http.get('http://api.prolaby.com/api/get/event/all', {params: {page: page}})
                .success( (data) ->
                    $scope.events = data
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