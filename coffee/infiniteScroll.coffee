angular.module 'app.directive.infiniteScroll', []
.directive 'infiniteScroll', ($timeout, $window) ->
    restrict: 'A'
    link: (scope, element, attr) ->
        $timeout(() ->
            winH = $window.innerHeight
            docH = $('body').height()

            angular.element($window).on 'scroll', (e) ->
                if (e.target.scrollingElement.scrollTop + winH > docH - 10) and !scope.loading
                    scope.load()

            scope.load = () ->
                scope.loading = true
                scope.loading = false
        )

