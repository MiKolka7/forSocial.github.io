angular.module('app.controller.registration', []).controller('registrationCtrl', function($scope, $http, ngDialog) {
  $scope.getCategory = [];
  $scope.getSkill = [];
  $scope.registr = function() {
    var data;
    $scope.r.birthdate = $scope.r.date.getTime();
    data = $scope.r;
    data.skills = $scope.getSkill;
    data.categories = $scope.getCategory;
    return console.log(data);
  };
  return $scope.login = function() {
    return ngDialog.open({
      template: "template/popup/login.html",
      controller: "loginCtrl",
      className: 'ngdialog-theme-default mini'
    });
  };
});
