angular.module('app.directive.map', []).directive('map', function() {
  return {
    restrict: 'A',
    link: function(scope, element) {
      scope.addMapPoint = function() {
        var map;
        return map = new google.maps.Marker({
          position: new google.maps.LatLng(lat, lan),
          map: map
        });
      };
      return true;
    }
  };
});
