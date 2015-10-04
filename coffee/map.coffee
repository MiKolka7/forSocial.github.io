angular.module 'app.directive.map', []
.directive 'gmap', ($http) ->
    restrict: 'A'
    link: (scope, element) ->
        map = new GMaps(
            el: '#map'
            lat: 50.449743916340445
            lng: 30.454806312918663
        )

        MapsGeolocate = ->
            GMaps.geolocate success: (position) ->
                map.setCenter position.coords.latitude, position.coords.longitude
                return
            return

        MapsGeolocate()

        scope.MapAddMarker = (data) ->
            content = '' +
                '<h6 style="font-size: 16px; margin-bottom: 5px;">' + data.title + '</h6>' +
                '<p><img src="images/' + data.cover + '" width="300" alt=""></p>' +
                '<p>Дата: ' + data.date_start + '</p>' +
                '<p><a href="event/' + data.idEvent + '">Читати</a></p>'

            map.addMarker
                lat: data.lat
                lng: data.lon
                title: data.title
                infoWindow:
                    content: content
            return

        return true