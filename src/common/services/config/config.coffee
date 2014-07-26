'use strict'

devcampMulteamServices.provider('config', [
  () ->
    appSettings =
      firebaseUrl: 'https://sizzling-fire-8674.firebaseio.com/'
      firebaseDocumentsUrl: 'https://sizzling-fire-8674.firebaseio.com/documents/'
      shareJsUrl: 'http://multeam-server.herokuapp.com/channel'
  
    get = (configName) ->
      if typeof appSettings[configName] is 'undefined'
          throw new Error('Config variable "' + configName + '" not found')
      return appSettings[configName]
      
    $get: () ->
      get: get
])