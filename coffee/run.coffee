angular.module('app.config.run', [])
.run ($rootScope, ngDialog, $http, localStorageService, $location) ->
    user = localStorageService.cookie.get('user')
    if (!user)
        $location.path('/registration')

    lang = localStorageService.cookie.get('lang')

    if (!lang)
        lang = 'ua'

    $rootScope.openPopup = (name) ->
        ngDialog.open({
            template: "template/popup/#{name}.html",
            controller: "#{name}Ctrl"
        })

    $http.get('http://api.prolaby.com/api/get/city/all')
    .success((data) ->
        $rootScope.city = data
    )

    $http.get('http://api.prolaby.com/api/get/skills/all')
    .success((data) ->
        $rootScope.skills = data
    )

    $http.get('http://api.prolaby.com/api/get/categories/all')
    .success((data) ->
        $rootScope.categories = data
    )

    $http.get("json/#{lang}.json")
    .success((data) ->
        data.name = lang
        $rootScope.lang = data
    )


    return true


#.config( (cfpLoadingBarProvider) ->
#    cfpLoadingBarProvider.includeSpinner = true
#)