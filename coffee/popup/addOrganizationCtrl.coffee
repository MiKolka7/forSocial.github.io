angular.module 'app.controller.addOrganization', []
    .controller 'addOrganizationCtrl', ($scope, localStorageService, $http) ->

        user = localStorageService.cookie.get('user')
        console.log 'asd'

        $scope.addCompany = () ->
            if ($scope.formAddCompany.$valid)

                company = {}
                company = _.clone($scope.company)

                company.cover = company.photo
                company.id_creator = +user.idUser
                company.cover = company.photo
                console.log company

                $http.get('http://api.prolaby.com/api/post/company', {params: company})
                    .success( (data) ->
                        console.log data
                    )
