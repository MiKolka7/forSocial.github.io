
angular.module 'app', [
    'ui.router'
    'ngDialog'
    'ngSanitize'
    'textAngular'
    'LocalStorageModule'
    'chieffancypants.loadingBar'
    'ngFileUpload'
    'checklist-model'
    'ui-notification'

    'app.config.run'
    'app.config.route'
    'app.filters'
    'app.factory.serializeDate'

    'app.directives'


    'app.controller.header'
    'app.controller.footer'
    'app.controller.event'
    'app.controller.events'
    'app.controller.friends'
    'app.controller.map'
    'app.controller.organization'
    'app.controller.organizations'
    'app.controller.registration'
    'app.controller.user'

    'app.controller.login'
    'app.controller.addEvent'
    'app.controller.addOrganization'

    'app.directive.infiniteScroll'
    'app.directive.map'
    'app.directive.upload'
]
