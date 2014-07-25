'use strict'

angular.module( 'devcamp-angular-multeam.404', [
  'devcamp-multeam-directives'
  'devcamp-multeam-filters'
  'devcamp-multeam-services'
  
  'ui.router'
])
.config([
  '$stateProvider'
  'urlProvider'
  ($stateProvider, urlProvider) ->
    $stateProvider
      .state('404', {
        url: urlProvider.$get().getUrl('fe._404')
        controller: '404Ctrl'
        templateUrl: '404/404.tpl.html'
      })
])
.controller( '404Ctrl', [
  '$scope'
  ($scope) ->
    
])
