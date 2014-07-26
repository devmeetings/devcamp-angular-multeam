'use strict'

angular.module( '<%= projectModuleName %>.<%= name %>', [
  '<%= directivesModuleName %>'
  '<%= filtersModuleName %>'
  '<%= servicesModuleName %>'
  
  'ui.router'
])
.config([
  '$stateProvider'
  'urlProvider'
  ($stateProvider, urlProvider) ->
    $stateProvider
      .state('<%= name %>', {
        url: urlProvider.$get().getUrl('fe.<%= camelizedName %>')
        controller: '<%= capitalizedName %>Ctrl'
        templateUrl: '<%= name %>/<%= name %>.tpl.html'
      })
])
.controller( '<%= capitalizedName %>Ctrl', [
  '$scope'
  ($scope) ->
    
])
