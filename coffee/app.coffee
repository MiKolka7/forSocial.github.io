
angular.module 'app', [
    'ui.router'
    'ngDialog'
    'textAngular'
    'LocalStorageModule'
#    'ngMap'
#    'slick'
    'chieffancypants.loadingBar'
#    'ngFileUpload'

    'app.config.run'
    'app.config.route'
    'app.filters'

    'app.directives'

    'app.controller.header'
    'app.controller.footer'
    'app.controller.event'
    'app.controller.events'
    'app.controller.friends'
    'app.controller.map'
    'app.controller.organizations'
    'app.controller.registration'
    'app.controller.user'

    'app.controller.login'
    'app.controller.addEvent'
    'app.controller.addOrganization'

    'app.directive.infiniteScroll'
    'app.directive.map'
]
