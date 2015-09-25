
angular.module 'app', [
    'ui.router'
    'ngDialog'
    'textAngular'

    'app.config.run'
    'app.config.route'
    'app.filters'

    'app.directives'

    'app.controller.events'
    'app.controller.map'
    'app.controller.registration'

    'app.controller.login'
    'app.controller.addEvent'
    'app.controller.addOrganization'

    'app.directive.infiniteScroll'
    'app.directive.map'
]
