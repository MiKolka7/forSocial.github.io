angular.module('app.directive.map', []).directive('gmap', function($http) {
  return {
    restrict: 'A',
    link: function(scope, element) {
      var MapsGeolocate, map;
      map = new GMaps({
        el: '#map',
        lat: 50.449743916340445,
        lng: 30.454806312918663
      });
      MapsGeolocate = function() {
        GMaps.geolocate({
          success: function(position) {
            map.setCenter(position.coords.latitude, position.coords.longitude);
          }
        });
      };
      MapsGeolocate();
      scope.MapAddMarker = function(data) {
        var content;
        content = '' + '<h6 style="font-size: 16px; margin-bottom: 5px;">' + data.title + '</h6>' + '<p><img src="images/' + data.cover + '" width="300" alt=""></p>' + '<p>Дата: ' + data.date_start + '</p>' + '<p><a href="event/' + data.idEvent + '">Читати</a></p>';
        map.addMarker({
          lat: data.lat,
          lng: data.lon,
          title: data.title,
          infoWindow: {
            content: content
          }
        });
      };
      return true;
    }
  };
});
