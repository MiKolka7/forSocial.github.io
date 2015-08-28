angular.module('tadApp.config.route', [])
    .config ($routeProvider) ->

        $routeProvider
            .when('/registration',
                controller: 'registrationCtrl'
                templateUrl: 'template/registration.html'
            )

            .otherwise redirectTo: '/login'


#angular.module('tadApp.config.route', [])
#    .config ($stateProvider, $urlRouterProvider) ->
#        $urlRouterProvider.otherwise '/'
#
#        $stateProvider
#            .state('/',
#                url: '/'
#                templateUrl: 'template/slide-1.html'
#            )
#
#            .state ('slide5',
#                url: '/slide-5'
#                controller: 'slideCtrl'
#                templateUrl: 'template/slide-5.html'
#            )

