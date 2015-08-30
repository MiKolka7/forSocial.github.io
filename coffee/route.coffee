angular.module('app.config.route', [])
    .config ($stateProvider, $urlRouterProvider, $locationProvider) ->
        $urlRouterProvider.otherwise '/'

        $stateProvider
            .state('main',
                url: "/"
                views:
                    '@':
                        templateUrl: 'template/pages/events.html'
                    'header':
                        #controller: 'mainBodyHeader'
                        templateUrl: 'template/header.html'

                    'footer':
                        #controller: 'mainBodyFooter'
                        templateUrl: 'template/footer.html'
            )
            .state('main.friends',
                url: 'friends'
                views:
                    '@':
                        templateUrl: 'template/pages/friends.html'
            )
            .state('main.events',
                url: 'events'
                views:
                    '@':
                        templateUrl: 'template/pages/events.html'
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
            .state('registration',
                url: '/registration'
                templateUrl: 'template/pages/registration.html'
            )

        return true