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
}).directive('mySlider', function($timeout) {
  return {
    restrict: 'A',
    link: function(scope, element) {
      return $timeout(function() {
        return $(element).slick({
          infinite: true,
          speed: 300,
          slidesToShow: 5,
          slidesToScroll: 1,
          arrows: true
        });
      });
    }
  };
}).directive('isClicked', function() {
  return {
    restrict: 'A',
    link: function(scope, element, attr) {
      return element.on('click', function() {
        var elements, i, results, results1;
        elements = angular.element(document.getElementsByClassName("user__rate__item"));
        i = scope.$eval(attr.isClicked);
        if (element.hasClass('is-clicked')) {
          ++i;
          results = [];
          while (i <= elements.length - 1) {
            elements.eq(i).removeClass('is-clicked');
            results.push(i++);
          }
          return results;
        } else {
          results1 = [];
          while (i >= 0) {
            elements.eq(i).addClass('is-clicked');
            results1.push(i--);
          }
          return results1;
        }
      });
    }
  };
}).directive('uploadFile', function() {
  return {
    restrict: 'A',
    templateUrl: 'template/uploadFile.html',
    controller: 'uploadFileCtrl'
  };
});
