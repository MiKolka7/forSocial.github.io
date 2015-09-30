angular.module 'app.directive.map', []
.directive 'map', () ->
    restrict: 'A'
    link: (scope, element) ->
#        map = new GMaps({
#            div: '#map',
#            lat: -12.043333,
#            lng: -77.028333
#        });

#        gMap = (lat, lon) ->
#            settings =
#                center: new google.maps.LatLng(lat, lon)
#                zoom: 15
#                mapTypeId: google.maps.MapTypeId.ROADMAP
#
#            map = new google.maps.Map(element[0], settings)

#        gMap()

#        map.geolocate(
#            success: (position) ->
#                map.setCenter(position.coords.latitude, position.coords.longitude)
#        )

        scope.addMapPoint = () ->
            map = new google.maps.Marker(
                position: new google.maps.LatLng(lat, lan)
                map: map
            )

        return true
