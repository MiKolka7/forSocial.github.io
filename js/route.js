angular.module('app.config.route', []).config(function($stateProvider, $urlRouterProvider, $locationProvider) {
  $urlRouterProvider.otherwise('/');
  $stateProvider.state('main', {
    url: "/",
    views: {
      '@': {
        templateUrl: 'template/pages/events.html'
      },
      'header': {
        templateUrl: 'template/header.html'
      },
      'footer': {
        templateUrl: 'template/footer.html'
      }
    }
  }).state('main.friends', {
    url: 'friends',
    views: {
      '@': {
        templateUrl: 'template/pages/friends.html'
      }
    }
  }).state('main.organizations', {
    url: 'organizations',
    views: {
      '@': {
        templateUrl: 'template/pages/organizations.html'
      }
    }
  }).state('main.messages', {
    url: 'messages',
    views: {
      '@': {
        templateUrl: 'template/pages/messages.html'
      }
    }
  }).state('registration', {
    url: '/registration',
    templateUrl: 'template/pages/registration.html'
  });
  return true;
});
