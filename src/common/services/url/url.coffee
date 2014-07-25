'use strict'

devcampMulteamServices.provider('url', [
  'urlPatterns'
  'configProvider'
  (urlPatterns, configProvider) ->
    config = configProvider.$get()
    
    getUrlBase = (baseUrl, urlPattern) ->
      url = urlPatterns
      for item in urlPattern.split('.')
        url = url[item]
        if typeof url is 'undefined'
          throw new Error('urlPattern ' + urlPattern + ' not found')
      return baseUrl + url
    
    insertParams = (url, args) ->
      args = (Array.prototype.slice.call(args)).slice(1)
      for arg in args
        url = url.replace('%s', arg)
      return url
    
    getUrl = (urlPattern) ->
      insertParams(getUrlBase('/', urlPattern), arguments)
      
    getApiUrl = (urlPattern) ->
      insertParams(getUrlBase(config.get('apiUrl'), urlPattern), arguments)
    
    $get: () ->
      return {
        getUrl: getUrl
        getApiUrl: getApiUrl
      }
])