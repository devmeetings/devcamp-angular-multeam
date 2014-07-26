'use strict'

devcampMulteamServices.factory('documents', [
  '$rootScope'
  'config'
  'uuid4'
  'saveApply'
  ($rootScope, config, uuid4, saveApply) ->
    documents = []
    firebase = new Firebase(config.get('firebaseUrl'))
    
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
      return new Firebase(config.get('firebaseUrl') + id)
    
    create = (name) ->
      document = getNewDocument(name)
      getFirebaseDocument(document.id).set(document)
      
    remove = (document) ->
      getFirebaseDocument(document.id).remove(() ->
        saveApply.saveApply(() ->
          documents.splice(documents.indexOf(document), 1)
        )
      )
    
    get = () ->
      documents
    
    firebase.on('child_added', (document) ->
      saveApply.saveApply(() ->
        documents.push(document.val())
      )
    )
    
    return {
      get: get
      create: create
      remove: remove
    }
])