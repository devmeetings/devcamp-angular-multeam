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
    '$state'
    'documents'
    ($scope, $state, documents) ->
      console.log 'HomeCtrl',$state.current
#      $scope.documents = for num in [1..10]
#        name: "document no. #{num}"
#        editors: ["a", "b", "c", "d"].slice(num % 3)
#        author: "author #{num}"
#        id: "#{num}"

      $scope.documents = documents.get()
#
#      $scope.create = () ->
#        documents.create($scope.name)
#
#      $scope.remove = (doc) ->
#        documents.remove(doc)

])
.controller( 'HomeEditCtrl', [
  '$scope'
  '$stateParams'
  ($scope, $stateParams) ->
    $scope.docId = $stateParams.id
])