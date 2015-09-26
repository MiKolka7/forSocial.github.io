angular.module('app.config.run', [])
    .run ($rootScope, ngDialog, $http, localStorageService) ->

        lang = localStorageService.cookie.get('lang')

        if (!lang)
            lang = 'ua'

        $rootScope.openPopup = (name) ->
            ngDialog.open({
                template: "template/popup/#{name}.html",
                controller: "#{name}Ctrl"
            })

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
                data.language = lang
                $rootScope.lang = data
        )



#        if (!$cookieStore.get('authorization'))
#            $location.url("/login");
#        else
#            if (!$rootScope.userName)
#                $rootScope.userName = $cookieStore.get('login');

        return true


#    .config(function(cfpLoadingBarProvider) {
#        cfpLoadingBarProvider.includeSpinner = true
#    })