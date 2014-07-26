'use strict'

devcampMulteamServices.factory('documents', [
  '$rootScope'
  'config'
  'uuid4'
  'saveApply'
  ($rootScope, config, uuid4, saveApply) ->
    documents = []
    firebase = new Firebase(config.get('firebaseDocumentsUrl'))
    
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
      doc = getNewDocument(name)
      getFirebaseDocument(doc.id).set(doc)
      
    remove = (doc) ->
      getFirebaseDocument(doc.id).remove()
    
    get = () ->
      documents
    
    firebase.on('child_added', (doc) ->
      saveApply.saveApply(() ->
        documents.push(doc.val())
      )
    )
    
    firebase.on('child_removed', (doc) ->
      saveApply.saveApply(() ->
        documents.splice(documents.indexOf(doc), 1)
      )
    )
    
    return {
      get: get
      create: create
      remove: remove
    }
])