angular.module('app.controller.map', []).controller('mapCtrl', function($scope) {
  var GmapStreet;
  return GmapStreet = function(lat, lon) {
    var city, num, result, street;
    city = void 0;
    street = void 0;
    num = void 0;
    $http.post('http://maps.google.com/maps/api/geocode/json?latlng=' + lat + ',' + lon).success(function(data) {
      var address;
      address = data.results[0].address_components;
      city = address[4].short_name;
      street = address[2].long_name;
      return num = address[0].short_name;
    });
    return result = city + ', ' + street + ', ' + num;
  };
});
