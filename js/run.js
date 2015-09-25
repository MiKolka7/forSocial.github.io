angular.module('app.config.run', []).run(function($rootScope, ngDialog, $http) {
  $rootScope.openPopup = function(name) {
    return ngDialog.open({
      template: "template/popup/" + name + ".html",
      controller: name + "Ctrl"
    });
  };
  $http.get('http://api.prolaby.com/api/get/skills/all').success(function(data) {
    return $rootScope.skills = data;
  });
  $http.get('http://api.prolaby.com/api/get/categories/all').success(function(data) {
    return $rootScope.categories = data;
  });
  return true;
});
