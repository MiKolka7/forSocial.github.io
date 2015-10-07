angular.module('app.config.run', []).run(function($rootScope, ngDialog, $http, localStorageService) {
  var lang;
  lang = localStorageService.cookie.get('lang');
  if (!lang) {
    lang = 'ua';
  }
  $rootScope.openPopup = function(name) {
    return ngDialog.open({
      template: "template/popup/" + name + ".html",
      controller: name + "Ctrl"
    });
  };
  $http.get('http://api.prolaby.com/api/get/city/all').success(function(data) {
    return $rootScope.city = data;
  });
  $http.get('http://api.prolaby.com/api/get/skills/all').success(function(data) {
    return $rootScope.skills = data;
  });
  $http.get('http://api.prolaby.com/api/get/categories/all').success(function(data) {
    return $rootScope.categories = data;
  });
  $http.get("json/" + lang + ".json").success(function(data) {
    data.name = lang;
    return $rootScope.lang = data;
  });
  return true;
}).config(function(cfpLoadingBarProvider) {
  return cfpLoadingBarProvider.includeSpinner = true;
});
