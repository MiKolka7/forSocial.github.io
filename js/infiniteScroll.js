angular.module('app.directive.infiniteScroll', []).directive('infiniteScroll', function($timeout, $window, $rootScope) {
  return {
    restrict: 'A',
    link: function(scope) {
      return $timeout(function() {
        var docH, winH;
        winH = $window.innerHeight;
        docH = $('body').height();
        scope.$watch('events', function() {
          return docH = $('body').height();
        });
        angular.element($window).on('scroll', function(e) {
          if ((e.target.scrollingElement.scrollTop + winH > docH - 10) && !scope.loading) {
            return scope.load();
          }
        });
        return scope.load = function() {
          scope.loading = true;
          scope.nextPage();
          return docH = $('body').height();
        };
      });
    }
  };
});
