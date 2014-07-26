'use strict'

devcampMulteamDirectives.directive('shareJs', [
  'config'
  (config) ->
    return {
      restrict: 'A'
      scope:
        docId: '='
      templateUrl: 'directives/shareJS/shareJS.tpl.html'
      link: (scope, element, attrs) ->
        editor = ace.edit("editor")
        editor.setTheme("ace/theme/twilight")
        editor.getSession().setMode("ace/mode/javascript")

        sharejs.open(
          scope.docId
          'text'
          config.get('shareJsUrl')
          (error, doc) ->
            doc.attach_ace(editor)
        )
    }
])