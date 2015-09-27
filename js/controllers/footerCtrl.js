angular.module('app.controller.footer', []).controller('footerCtrl', function($scope, $rootScope, localStorageService) {
  $scope.setLang = function(lang) {
    return localStorageService.cookie.set('lang', lang);
  };
  if ($rootScope.lang.language === 'ua') {
    return $scope.language = 'Українська';
  } else if ($rootScope.lang.language === 'ru') {
    return $scope.language = 'Русский';
  } else if ($rootScope.lang.language === 'en') {
    return $scope.language = 'English';
  }
});
