angular.module 'app.controller.footer', []
    .controller 'footerCtrl', ($scope, $rootScope, localStorageService, $timeout) ->

        $scope.setLang = (lang) ->
            localStorageService.cookie.set('lang', lang)
            location.reload()

        $timeout ->
            if $rootScope.lang.name is 'ua'
                    $scope.language = 'Українська'
            else if $rootScope.lang.name is 'ru'
                $scope.language = 'Русский'
            else if $rootScope.lang.name is 'de'
                $scope.language = 'Deutsch'
            else if $rootScope.lang.name is 'en'
                $scope.language = 'English'

