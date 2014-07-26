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
    .state('home.create', {
        url: urlProvider.$get().getUrl('fe.create')
        controller: 'CreateCtrl'
      })
    .state('home.edit', {
        url: urlProvider.$get().getUrl('fe.edit')
        controller: 'EditCtrl'
      })
    .state('home.delete', {
        url: urlProvider.$get().getUrl('fe.delete')
        controller: 'DeleteCtrl'
      })
])
.controller( 'HomeCtrl', [
    '$scope'
    ($scope) ->
      $scope.documents = for num in [1..10]
        name: "document no. #{num}"
        editors: ["a", "b", "c", "d"].slice(num % 3)
        author: "author #{num}"
        id: "#{num}"

])
.controller( 'CreateCtrl', [
    '$scope'
    ($scope) ->

])
.controller( 'EditCtrl', [
    '$scope'
    ($scope) ->

])
.controller( 'DeleteCtrl', [
    '$scope'
    ($scope) ->

])
