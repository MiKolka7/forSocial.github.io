angular.module('app.controller.events', []).controller('eventsCtrl', function($scope) {
  $scope.events = [
    {
      name: 1,
      category: {
        city: 'Київ',
        month: 'Січень',
        type: 1
      }
    }, {
      name: 1,
      category: {
        city: 'Львів',
        month: 'Січень',
        type: 2
      }
    }, {
      name: 1,
      category: {
        city: 'Мюнхен',
        month: 'Лютий',
        type: 1
      }
    }, {
      name: 1,
      category: {
        city: 'Мюнхен',
        month: 'Січень',
        type: 3
      }
    }
  ];
  $scope.chooseFilter = {
    city: [],
    month: [],
    type: []
  };
  $scope.addFilter = function(key, val) {
    var i;
    i = _.indexOf($scope.chooseFilter[key], val) + 1;
    if (!i) {
      return $scope.chooseFilter[key].push(val);
    } else {
      return $scope.chooseFilter[key].splice(i - 1, 1);
    }
  };
  return $scope.events.nextPage = function() {
    console.log('sd');
    return $scope.events.push([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
  };
});
