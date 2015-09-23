angular.module('app.directive.map', []).directive('map', function() {
  return {
    restrict: 'A',
    link: function(scope, element, attr) {
      var gMap, map;
      map = null;
      gMap = function(lat, lan) {
        var settings;
        settings = {
          center: new google.maps.LatLng(lat, lan),
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        return map = new google.maps.Map(element[0], settings);
      };
      scope.addMapPoint = function() {
        return map = new google.maps.Marker({
          position: new google.maps.LatLng(lat, lan),
          map: map
        });
      };
      return true;
    }
  };
});
