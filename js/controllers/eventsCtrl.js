angular.module('app.controller.events', []).controller('eventsCtrl', function($scope, $http) {
  var page, pageData;
  page = 0;
  $scope.events = [];
  pageData = function() {
    return $http.get('http://api.prolaby.com/api/get/event/all', {
      params: {
        page: page
      }
    }).success(function(data) {
      console.log(data);
      if (!_.isEmpty(data)) {
        $scope.events = [].concat($scope.events, data);
      }
      _.forEach($scope.events, function(item) {
        return item.date_end = new Date(item.date_end);
      });
      return $scope.loading = false;
    });
  };
  pageData();
  $scope.nextPage = function() {
    page++;
    return pageData();
  };
  $scope.chooseFilter = {
    city: [],
    month: [],
    type: []
  };
  return $scope.addFilter = function(key, val) {
    var i;
    i = _.indexOf($scope.chooseFilter[key], val) + 1;
    if (!i) {
      $scope.chooseFilter[key].push(val);
    } else {
      $scope.chooseFilter[key].splice(i - 1, 1);
    }
    return console.log($scope.chooseFilter);
  };
});
