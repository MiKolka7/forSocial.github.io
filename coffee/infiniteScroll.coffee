angular.module 'app.directive.infiniteScroll', []
.directive 'infiniteScroll', ($timeout, $window, $rootScope) ->
    restrict: 'A'
    link: (scope) ->
        $timeout(() ->
            winH = $window.innerHeight
            docH = $('body').height()

            angular.element($window).on 'scroll', (e) ->
                if (e.target.scrollingElement.scrollTop + winH > docH - 10) and !scope.loading
                    scope.load()

            scope.load = () ->
                scope.loading = true
                scope.nextPage()
                docH = $('body').height()
        )