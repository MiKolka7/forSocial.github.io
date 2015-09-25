angular.module('app.directives', []).directive('isCheck', function() {
  return {
    restrict: 'A',
    link: function(scope, element) {
      return element.on('click', function() {
        console.log(_.filter(this.classList, 'is-active'));
        if (_.has(this.classList, 'is-active')) {
          return element.removeClass('is-active');
        } else {
          return element.addClass('is-active');
        }
      });
    }
  };
});
