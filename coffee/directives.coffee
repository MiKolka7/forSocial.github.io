angular.module('app.directives', [])
.directive('isCheck', ->
    restrict: 'A'
    link: (scope, element) ->

        element.on 'click', () ->
            console.log _.filter(@.classList, 'is-active')
            if _.has(@.classList, 'is-active')
                element.removeClass('is-active')
            else
                element.addClass('is-active')
)
