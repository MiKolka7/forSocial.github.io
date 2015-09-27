angular.module 'app.controller.event', []
    .controller 'eventCtrl', ($scope, $http, $stateParams) ->

        $http.get('http://api.prolaby.com/api/get/event/comments/', {params: {idEvent: $stateParams.id}})
            .success( (data) ->
                $scope.commments = data
                console.log data
            )

        $scope.addComment = () ->
            $http.post('http://api.prolaby.com/api/post/comments', {params: {idEvent: $stateParams}})
                .success( (data) ->
                    $scope.commments = data
            )
#http://forsocial.net/api/get/event/comments?idEvent=1 - повертає всі коментарі до одного івенту
#http://forsocial.net/api/post/event/comment?idEvent=2&idUser=17&text=test - додає коментар до івенту
#http://forsocial.net/api/post/user/join?idEvent=2&idUser=1 - юзер приєднується до івента