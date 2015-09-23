angular.module('app.directive.infiniteScroll', []).directive('infiniteScroll', function($timeout, $window) {
  return {
    restrict: 'A',
    link: function(scope, element, attr) {
      return $timeout(function() {
        var docH, winH;
        winH = $window.innerHeight;
        docH = $('body').height();
        angular.element($window).on('scroll', function(e) {
          if ((e.target.scrollingElement.scrollTop + winH > docH - 10) && !scope.loading) {
            return scope.load();
          }
        });
        return scope.load = function() {
          scope.loading = true;
          return scope.loading = false;
        };
      });
    }
  };
});
