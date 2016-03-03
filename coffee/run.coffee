angular.module('app.config.run', [])
.run ($rootScope, ngDialog, $http, localStorageService, $location, $sce) ->

    user = localStorageService.cookie.get('user')
    if (!user)
        $location.path('/registration')

    lang = localStorageService.cookie.get('lang')

    if (!lang)
        lang = navigator.language || navigator.userLanguage

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

    $rootScope.getHTML = (text, limit) ->
        if text.length > limit
            t = text.substr(0, limit)
            $sce.trustAsHtml(t)
        else
            return text


    return true


#.config( (cfpLoadingBarProvider) ->
#    cfpLoadingBarProvider.includeSpinner = true
#)