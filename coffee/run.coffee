angular.module('app.config.run', [])
    .run ($rootScope, ngDialog) ->

        $rootScope.openPopup = (name) ->
            ngDialog.open({
                template: "template/popup/#{name}.html",
                controller: "#{name}Ctrl"
            })


#        if (!$cookieStore.get('authorization'))
#            $location.url("/login");
#        else
#            if (!$rootScope.userName)
#                $rootScope.userName = $cookieStore.get('login');

        return true


#    .config(function(cfpLoadingBarProvider) {
#        cfpLoadingBarProvider.includeSpinner = true
#    })