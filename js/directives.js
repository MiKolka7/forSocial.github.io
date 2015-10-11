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
}).directive('userRatestyle', function() {
  return {
    restrict: 'A',
    link: function(scope, element, attr) {
      element.on('mouseleave', function() {
        var elements, i, results;
        elements = angular.element(document.getElementsByClassName("user__rate__item"));
        i = 0;
        results = [];
        while (i <= elements.length) {
          elements.eq(i).removeClass('is-hovered').removeClass('unclicked');
          results.push(i++);
        }
        return results;
      });
      element.on('mouseover', function() {
        var elements, i, mr, results, results1;
        elements = angular.element(document.getElementsByClassName("user__rate__item"));
        mr = scope.$eval(attr.userRatestyle);
        if (element.hasClass('is-clicked')) {
          i = mr++;
          results = [];
          while (i <= elements.length) {
            elements.eq(i + 1).addClass('unclicked');
            results.push(i++);
          }
          return results;
        } else {
          i = 0;
          results1 = [];
          while (i <= mr) {
            elements.eq(i).addClass('is-hovered');
            results1.push(i++);
          }
          return results1;
        }
      });
      return element.on('click', function() {
        var elements, i, results, results1;
        elements = angular.element(document.getElementsByClassName("user__rate__item"));
        i = scope.$eval(attr.userRatestyle);
        if (element.hasClass('is-clicked')) {
          i++;
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
