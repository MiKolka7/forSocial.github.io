angular.module 'app.controller.organizations', []
    .controller 'organizationsCtrl', ($scope, $http) ->

        $scope.type = 1;

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