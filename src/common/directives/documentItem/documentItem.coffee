'use strict'

devcampMulteamDirectives.directive('documentItem', [
  () ->
      restrict: 'E'
      replace: true
      scope:
        item: '='
        classAttr: '@class'
      templateUrl: 'directives/documentItem/documentItem.tpl.html'
])