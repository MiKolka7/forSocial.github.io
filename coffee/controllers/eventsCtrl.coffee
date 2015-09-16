angular.module 'app.controller.events', []
    .controller 'eventsCtrl', ($scope) ->

        $scope.events = [0..9]

        $scope.events.nextPage = () ->
            console.log 'sd'
            $scope.events.push [0..9]