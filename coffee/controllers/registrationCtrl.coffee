angular.module 'app.controller.registration', []
    .controller 'registrationCtrl', ($scope, $http) ->

        $scope.getCategory = []
        $scope.getSkill = []

        $scope.registr = () ->

            $scope.r.birthdate = $scope.r.date.getTime()

            data = $scope.r
            data.skills = $scope.getSkill
            data.categories = $scope.getCategory
            console.log data

#            $http.post('http://api.prolaby.com/api/post/user', data)
#                .success((data) ->
#                    console.log 'user reg'
#                )
