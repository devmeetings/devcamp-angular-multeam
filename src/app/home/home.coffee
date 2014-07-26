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
    .state('home.edit', {
        url: urlProvider.$get().getUrl('fe.homeEdit')
        controller: 'HomeEditCtrl'
        templateUrl: 'home/home.edit.tpl.html'
      })
])
.controller( 'HomeCtrl', [
    '$scope'
    'documents'
    ($scope, documents) ->
      $scope.documents = documents.get()
])
.controller( 'HomeEditCtrl', [
  '$scope'
  '$state'
  '$stateParams'
  ($scope, $state, $stateParams) ->
    if not $stateParams.id
      $state.go('home')
    $scope.docId = $stateParams.id
])