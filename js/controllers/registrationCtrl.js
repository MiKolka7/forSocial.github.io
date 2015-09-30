angular.module('app.controller.registration', []).controller('registrationCtrl', function($scope, $http, ngDialog) {
  var openLoginPopup;
  $scope.getCategory = [];
  $scope.getSkill = [];
  $scope.registr = function() {
    var data;
    if ($scope.reg.$valid) {
      $scope.r.birthdate = $scope.r.date.getTime();
      data = $scope.r;
      data.skills = $scope.getSkill;
      data.categories = $scope.getCategory;
      return $http.get('http://api.prolaby.com/api/post/user', data).success(function(data) {
        if (data) {
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
