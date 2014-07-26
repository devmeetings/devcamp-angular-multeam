'use strict'

devcampMulteamDirectives.directive('documentItem', [
  '$location'
  'documents'
  'url'
  ($location, documents, url) ->
      restrict: 'E'
      replace: true
      scope:
        item: '='
        key: '='
        classAttr: '@class'
      templateUrl: 'directives/documentItem/documentItem.tpl.html'
      link: (scope, element, attrs) ->
        scope.edit = (id) ->
          $location.path(url.getUrl('fe.home') + '/' + id)

        scope.delete = ($event, key) ->
          $event.stopPropagation()
          documents.remove(key) if confirm 'Are you sure you want to delete this item?'

        scope.item.editors = _.pluck(scope.item.editors, 'name')
])