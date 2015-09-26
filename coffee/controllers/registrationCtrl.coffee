angular.module 'app.controller.registration', []
    .controller 'registrationCtrl', ($scope, $http, ngDialog) ->

        $scope.getCategory = []
        $scope.getSkill = []

        $scope.registr = () ->
            $scope.r.birthdate = $scope.r.date.getTime()

            data = $scope.r
            data.skills = $scope.getSkill
            data.categories = $scope.getCategory
            console.log data

        $scope.login = () ->
            ngDialog.open({
                template: "template/popup/login.html"
                controller: "loginCtrl"
                className: 'ngdialog-theme-default mini'
            })

#            $http.post('http://api.prolaby.com/api/post/user', data)
#                .success((data) ->
#                    console.log 'user reg'
#                )
