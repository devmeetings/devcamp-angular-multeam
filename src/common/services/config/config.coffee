'use strict'

devcampMulteamServices.provider('config', [
  () ->
    appSettings =
      dummyCnf: ''
  
    get = (configName) ->
      if typeof appSettings[configName] is 'undefined'
          throw new Error('Config variable "' + configName + '" not found')
      return appSettings[configName]
      
    $get: () ->
      get: get
])