angular.module('app.directives', [])
.directive('isCheck', ->
    restrict: 'A'
    link: (scope, element) ->

        element.on 'click', () ->
            active = null

            _.forEach(@.classList, (item) ->
                if item is 'is-active'
                    active = true
            )

            if active
                element.removeClass('is-active')
            else
                element.addClass('is-active')
)