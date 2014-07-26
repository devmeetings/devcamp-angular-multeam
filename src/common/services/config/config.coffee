'use strict'

devcampMulteamServices.provider('config', [
  () ->
    appSettings =
      firebaseUrl: 'https://ptow2e1wikl.firebaseio-demo.com/documents_test/'
  
    get = (configName) ->
      if typeof appSettings[configName] is 'undefined'
          throw new Error('Config variable "' + configName + '" not found')
      return appSettings[configName]
      
    $get: () ->
      get: get
])