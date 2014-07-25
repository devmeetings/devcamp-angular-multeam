'use strict'

angular.module( 'devcamp-angular-multeam.home', [
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
      .state('home', {
        url: urlProvider.$get().getUrl('fe.home')
        controller: 'HomeCtrl'
        templateUrl: 'home/home.tpl.html'
      })
])
.controller( 'HomeCtrl', [
  '$scope'
  ($scope) ->
    
])