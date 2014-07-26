'use strict'

<%= directivesVarName %>.directive('<%= camelizedName %>', [
  () ->
    return {
      restrict: 'A'
      templateUrl: 'directives/<%= name %>/<%= name %>.tpl.html'
      link: (scope, element, attrs) ->
        
    }
])