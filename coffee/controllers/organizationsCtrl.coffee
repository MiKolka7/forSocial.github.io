angular.module 'app.controller.organizations', []
    .controller 'organizationsCtrl', ($scope, $http) ->

        $http.get('http://api.prolaby.com/api/get/company/all', {params: {type: 1}})
            .success( (data) ->
                $scope.organizations = data
        )

        $http.get('http://api.prolaby.com/api/get/company/all', {params: {type: 2}})
            .success( (data) ->
                $scope.companies = data
        )

        $http.get('http://api.prolaby.com/api/get/scopes/all')
            .success( (data) ->
                $scope.scopes = data
        )

        $scope.type = 1
        $scope.chooseFilter = []

        $scope.addFilter = (val) ->
            i = _.indexOf($scope.chooseFilter, val) + 1

            if !i
                $scope.chooseFilter.push val
            else
                $scope.chooseFilter.splice i - 1, 1