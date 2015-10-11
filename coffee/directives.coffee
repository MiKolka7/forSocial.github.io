angular.module('app.directives', [])
.directive('isCheck', ->
    restrict: 'A'
    link: (scope, element) ->

        element.on 'click', () ->
            active = null

            _.forEach(@.classList, (item) ->
                if item is 'is-active'
                    active = true
            )

            if active
                element.removeClass('is-active')
            else
                element.addClass('is-active')
)


.directive('mySlider', ($timeout) ->
    restrict: 'A'
    link: (scope, element) ->
        $timeout ->
            $(element).slick
                infinite: true
                speed: 300
                slidesToShow: 5
                slidesToScroll: 1
                arrows: true
)


.directive('isClicked', ->
    restrict: 'A'
    link: (scope, element, attr) ->

        element.on 'click', ->

          elements = angular.element(document.getElementsByClassName("user__rate__item"))
          i = scope.$eval(attr.isClicked)

          if element.hasClass('is-clicked')
            ++i
            while i <= elements.length-1
              elements.eq(i).removeClass 'is-clicked'
              i++
          else
            while i >= 0
              elements.eq(i).addClass 'is-clicked'
              i--
)

.directive 'uploadFile', ->
    restrict: 'A'
    templateUrl: 'template/uploadFile.html'
    controller: 'uploadFileCtrl'
