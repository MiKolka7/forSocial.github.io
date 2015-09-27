angular.module('app.directive.map', []).directive('map', function() {
  return {
    restrict: 'A',
    link: function(scope, element) {
      var map;
      map = new GMaps({
        div: '#map',
        lat: -12.043333,
        lng: -77.028333
      });
      map.geolocate({
        success: function(position) {
          return map.setCenter(position.coords.latitude, position.coords.longitude);
        }
      });
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
