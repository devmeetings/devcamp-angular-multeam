'use strict'

devcampMulteamServices.factory('documents', [
  '$rootScope'
  '$firebase'
  'config'
  'uuid4'
  'saveApply'
  ($rootScope, $firebase, config, uuid4, saveApply) ->
    documents = $firebase(new Firebase(config.get('firebaseDocumentsUrl')))
    
    getNewDocument = (name) ->
      if not name
        name = uuid4.generate()
      
      {
        id: uuid4.generate()
        name: name
        editors: []
        author: ''
      }
    
    getFirebaseDocument = (id) ->
      return new Firebase(config.get('firebaseDocumentsUrl') + id)
    
    create = (name) ->
      documents.$add(getNewDocument(name))
      
    remove = (key) ->
      documents.$remove(key)
    
    get = () ->
      documents
    
    return {
      get: get
      create: create
      remove: remove
    }
])