angular.module 'app.controller.registration', []
    .controller 'registrationCtrl', ($scope, $http, ngDialog) ->

        $scope.getCategory = []
        $scope.getSkill = []

        $scope.registr = () ->

            if $scope.reg.$valid
                $scope.r.birthdate = $scope.r.date.getTime()

                data = $scope.r
                data.skills = $scope.getSkill
                data.categories = $scope.getCategory
                delete data.date

                console.log data
                $http.get('http://api.prolaby.com/api/post/user', {params: data} )
                    .success( (data) ->
                        if data
                            console.log data
                            openLoginPopup()
                    )

        $scope.login = () ->
            openLoginPopup()

        openLoginPopup = () ->
            ngDialog.open({
                template: "template/popup/login.html"
                controller: "loginCtrl"
                className: 'ngdialog-theme-default mini'
            })