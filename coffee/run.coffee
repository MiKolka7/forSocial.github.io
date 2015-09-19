angular.module('app.config.run', [])
    .run ($rootScope, ngDialog) ->

        $rootScope.openPopup = (name) ->
            ngDialog.open({
                template: "template/popup/#{name}.html",
                controller: "#{name}Ctrl"
            })

        return true