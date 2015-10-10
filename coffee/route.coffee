angular.module('app.config.route', [])
    .config ($stateProvider, $urlRouterProvider, $locationProvider) ->
        $urlRouterProvider.otherwise '/'

        $stateProvider
            .state('main',
                url: "/"
                views:
                    '@':
                        controller: 'eventsCtrl'
                        templateUrl: 'template/pages/events.html'
                    'header':
                        controller: 'headerCtrl'
                        templateUrl: 'template/header.html'
                    'footer':
                        controller: 'footerCtrl'
                        templateUrl: 'template/footer.html'
            )
            .state('main.friends',
                url: 'friends'
                views:
                    '@':
                        controller: 'friendsCtrl'
                        templateUrl: 'template/pages/friends.html'
            )
            .state('main.organizations',
                url: 'organizations'
                views:
                    '@':
                        controller: 'organizationsCtrl'
                        templateUrl: 'template/pages/organizations.html'
            )
            .state('main.organization',
                url: 'organization/{id}'
                views:
                    '@':
                        controller: 'organizationCtrl'
                        templateUrl: 'template/pages/organization.html'
            )
            .state('main.messages',
                url: 'messages'
                views:
                    '@':
                        templateUrl: 'template/pages/messages.html'
            )
                .state('main.messages.send',
                    url: '/send/{id}'
                    views:
                        '@':
                            templateUrl: 'template/pages/messages-send.html'
                )
            .state('main.event',
                url: 'event/{id}'
                views:
                    '@':
                        controller: 'eventCtrl'
                        templateUrl: 'template/pages/event.html'
            )
            .state('main.map',
                url: 'map'
                views:
                    '@':
                        controller: 'mapCtrl'
                        templateUrl: 'template/pages/map.html'
            )
            .state('main.user',
                url: 'user/{id}'
                views:
                    '@':
                        controller: 'userCtrl'
                        templateUrl: 'template/pages/user.html'
            )

            .state('registration',
                url: '/registration'
                views:
                    '@':
                        controller: 'registrationCtrl'
                        templateUrl: 'template/pages/registration.html'
                    'footer':
                        controller: 'footerCtrl'
                        templateUrl: 'template/footer.html'
            )

        return true