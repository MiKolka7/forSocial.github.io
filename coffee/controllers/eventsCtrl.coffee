angular.module 'app.controller.events', []
    .controller 'eventsCtrl', ($scope) ->

        $scope.events = [
            {
                name: 1,
                category: {
                    city: 'Київ'
                    month: 'Січень'
                    type: 1
                }
            }
            {
                name: 1,
                category: {
                    city: 'Львів'
                    month: 'Січень'
                    type: 2
                }
            }
            {
                name: 1,
                category: {
                    city: 'Мюнхен'
                    month: 'Лютий'
                    type: 1
                }
            }
            {
                name: 1,
                category: {
                    city: 'Мюнхен'
                    month: 'Січень'
                    type: 3
                }
            }
        ]

        $scope.chooseFilter = {
            city: []
            month: []
            type: []
        }

        $scope.addFilter = (key, val) ->
            i = _.indexOf($scope.chooseFilter[key], val) + 1

            if !i
                $scope.chooseFilter[key].push val
            else
                $scope.chooseFilter[key].splice i - 1, 1


        $scope.events.nextPage = () ->
            console.log 'sd'
            $scope.events.push [0..9]


