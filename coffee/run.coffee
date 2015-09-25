angular.module('app.config.run', [])
    .run ($rootScope, ngDialog, $http) ->

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



#        if (!$cookieStore.get('authorization'))
#            $location.url("/login");
#        else
#            if (!$rootScope.userName)
#                $rootScope.userName = $cookieStore.get('login');

        return true


#    .config(function(cfpLoadingBarProvider) {
#        cfpLoadingBarProvider.includeSpinner = true
#    })