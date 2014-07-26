'use strict'

devcampMulteamDirectives = angular.module('devcamp-multeam-directives', [])
devcampMulteamFilters = angular.module('devcamp-multeam-filters', [])
devcampMulteamServices = angular.module('devcamp-multeam-services', [])

devcampMulteam = angular.module( 'devcamp-angular-multeam', [
  # Basic modules
  'devcamp-multeam-directives'
  'devcamp-multeam-filters'
  'devcamp-multeam-services'
  
  # App modules
  'devcamp-angular-multeam.firebase'
  'devcamp-angular-multeam.home'
  'devcamp-angular-multeam.404'
  
  # Vendor modules
  'templates-app'
  'templates-common'
  'ui.router'
  'uuid'
  'firebase'
])
.config([
  '$locationProvider'
  '$urlRouterProvider'
  'urlProvider'
  ($locationProvider, $urlRouterProvider, urlProvider) ->
    $urlRouterProvider.when('', '/')
    $urlRouterProvider.otherwise(urlProvider.$get().getUrl('fe._404'))

    #$locationProvider.html5Mode(true)
])
.run([
  () ->
    
])
.controller('AppCtrl', [
  () ->

])
