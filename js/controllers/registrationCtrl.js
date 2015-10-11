angular.module('app.controller.registration', []).controller('registrationCtrl', function($scope, $http, ngDialog) {
  var openLoginPopup;
  $scope.registr = function() {
    var data;
    if ($scope.reg.$valid) {
      $scope.r.birthdate = $scope.r.date.getTime();
      data = $scope.r;
      delete data.date;
      console.log(data);
      return $http.get('http://api.prolaby.com/api/post/user', {
        params: data
      }).success(function(data) {
        if (data) {
          console.log(data);
          return openLoginPopup();
        }
      });
    }
  };
  $scope.login = function() {
    return openLoginPopup();
  };
  return openLoginPopup = function() {
    return ngDialog.open({
      template: "template/popup/login.html",
      controller: "loginCtrl",
      className: 'ngdialog-theme-default mini'
    });
  };
});
