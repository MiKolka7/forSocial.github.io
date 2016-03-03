angular.module('app.controller.footer', []).controller('footerCtrl', function($scope, $rootScope, localStorageService, $timeout) {
  $scope.setLang = function(lang) {
    localStorageService.cookie.set('lang', lang);
    return location.reload();
  };
  return $timeout(function() {
    if ($rootScope.lang.name === 'ua') {
      return $scope.language = 'Українська';
    } else if ($rootScope.lang.name === 'ru') {
      return $scope.language = 'Русский';
    } else if ($rootScope.lang.name === 'de') {
      return $scope.language = 'Deutsch';
    } else if ($rootScope.lang.name === 'en') {
      return $scope.language = 'English';
    }
  });
});
