
angular.module 'app', [
    'ui.router'
    'ngDialog'
    'textAngular'
    'LocalStorageModule'
    'ngMap'

    'app.config.run'
    'app.config.route'
    'app.filters'

    'app.directives'

    'app.controller.footer'
    'app.controller.event'
    'app.controller.events'
    'app.controller.map'
    'app.controller.organizations'
    'app.controller.registration'

    'app.controller.login'
    'app.controller.addEvent'
    'app.controller.addOrganization'

    'app.directive.infiniteScroll'
    'app.directive.map'
]
