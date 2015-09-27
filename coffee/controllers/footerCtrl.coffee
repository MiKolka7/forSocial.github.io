angular.module 'app.controller.footer', []
    .controller 'footerCtrl', ($scope, $rootScope, localStorageService, $state) ->

        $scope.setLang = (lang) ->
            localStorageService.cookie.set('lang', lang)
            $state.reload()

        if $rootScope.lang.language is 'ua'
            $scope.language = 'Українська'
        else if $rootScope.lang.language is 'ru'
            $scope.language = 'Русский'
        else if $rootScope.lang.language is 'en'
            $scope.language = 'English'

