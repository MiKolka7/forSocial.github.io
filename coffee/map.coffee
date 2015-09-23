angular.module 'app.directive.map', []
.directive 'map', () ->
    restrict: 'A'
    link: (scope, element, attr) ->
        map = null

        gMap = (lat, lan) ->
            settings =
                center: new google.maps.LatLng(lat, lan)
                zoom: 15
                mapTypeId: google.maps.MapTypeId.ROADMAP

            map = new google.maps.Map(element[0], settings)


        scope.addMapPoint = () ->
            map = new google.maps.Marker(
                position: new google.maps.LatLng(lat, lan)
                map: map
            )

        return true
