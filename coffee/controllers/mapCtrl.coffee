angular.module 'app.controller.map', []
    .controller 'mapCtrl', ($scope) ->

        GmapStreet = (lat, lon) ->
            city = undefined
            street = undefined
            num = undefined

            $http.post('http://maps.google.com/maps/api/geocode/json?latlng=' + lat + ',' + lon).success( (data) ->
                address = data.results[0].address_components

                city = address[4].short_name
                street = address[2].long_name
                num = address[0].short_name
            )

            result = city + ', ' + street + ', ' + num


