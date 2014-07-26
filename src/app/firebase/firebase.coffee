'use strict'

angular.module( 'devcamp-angular-multeam.firebase', [
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
      .state('firebase', {
        url: urlProvider.$get().getUrl('fe.firebase')
        controller: 'FirebaseCtrl'
        templateUrl: 'firebase/firebase.tpl.html'
      })
])
.controller( 'FirebaseCtrl', [
  '$scope'
  'documents'
  ($scope, documents) ->
    $scope.documents = documents.get()
    
    $scope.create = () ->
      documents.create($scope.name)
    
    $scope.remove = (doc) ->
      documents.remove(doc)
])
