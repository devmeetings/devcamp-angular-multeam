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
  ($scope) ->
    myDataRef = new Firebase('https://ptow2e1wikl.firebaseio-demo.com/')
    
    $scope.msgs = []
    
    $scope.publish = () ->
      myDataRef.push({name: $scope.name, text: $scope.text})
      
    myDataRef.on('child_added', (snapshot) ->
      message = snapshot.val()
      $scope.msgs.push(message)
    )
])
