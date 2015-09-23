angular.module('app.config.run', []).run(function($rootScope, ngDialog) {
  $rootScope.openPopup = function(name) {
    return ngDialog.open({
      template: "template/popup/" + name + ".html",
      controller: name + "Ctrl"
    });
  };
  return true;
});
