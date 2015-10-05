angular.module('app.directives', []).directive('isCheck', function() {
  return {
    restrict: 'A',
    link: function(scope, element) {
      return element.on('click', function() {
        var active;
        active = null;
        _.forEach(this.classList, function(item) {
          if (item === 'is-active') {
            return active = true;
          }
        });
        if (active) {
          return element.removeClass('is-active');
        } else {
          return element.addClass('is-active');
        }
      });
    }
  };
});
