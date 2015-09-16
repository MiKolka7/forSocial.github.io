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
                        templateUrl: 'template/header.html'
                    'footer':
                        templateUrl: 'template/footer.html'
            )
            .state('main.friends',
                url: 'friends'
                views:
                    '@':
                        templateUrl: 'template/pages/friends.html'
            )
            .state('main.organizations',
                url: 'organizations'
                views:
                    '@':
                        templateUrl: 'template/pages/organizations.html'
            )
            .state('main.messages',
                url: 'messages'
                views:
                    '@':
                        templateUrl: 'template/pages/messages.html'
            )
            .state('main.event',
                url: 'event'
                views:
                    '@':
                        templateUrl: 'template/pages/event.html'
            )
            .state('main.organization',
                url: 'organization'
                views:
                    '@':
                        templateUrl: 'template/pages/organization.html'
            )
            .state('main.user',
                url: 'user'
                views:
                    '@':
                        templateUrl: 'template/pages/user.html'
            )

            .state('registration',
                url: '/registration'
                views:
                    '@':
                        templateUrl: 'template/pages/registration.html'
                    'footer':
                        templateUrl: 'template/footer.html'
            )

        return true