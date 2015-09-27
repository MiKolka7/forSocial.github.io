angular.module('app.controller.footer', []).controller('footerCtrl', function($scope, $rootScope, localStorageService, $state) {
  $scope.setLang = function(lang) {
    localStorageService.cookie.set('lang', lang);
    return $state.reload();
  };
  if ($rootScope.lang.language === 'ua') {
    return $scope.language = 'Українська';
  } else if ($rootScope.lang.language === 'ru') {
    return $scope.language = 'Русский';
  } else if ($rootScope.lang.language === 'en') {
    return $scope.language = 'English';
  }
});
