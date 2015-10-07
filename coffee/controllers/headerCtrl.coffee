angular.module 'app.controller.header', []
    .controller 'headerCtrl', ($scope, $rootScope, localStorageService, $location, $state) ->

        $scope.changeVisibleMenu = () ->
            $scope.visibleMenu = if $scope.visibleMenu then false else true

        $scope.logout = () ->
            localStorageService.cookie.remove('user')
            $location.url('/registration')

        $rootScope.$on('$locationChangeStart', (a, b) ->
            page($state.current.url)
        )


        $scope.user = localStorageService.cookie.get('user')

        page = (name) ->
#            $scope.page = name

#        page()