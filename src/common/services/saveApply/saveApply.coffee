'use strict'

devcampMulteamServices.factory('saveApply', [
  '$rootScope'
  ($rootScope) ->
    saveApply = (fn) ->
      phase = $rootScope.$root.$$phase
      if phase == '$apply' or phase == '$digest'
        if fn and typeof(fn) == 'function'
          fn()
      else
        $rootScope.$apply(fn)
    return {
      saveApply: saveApply
    }
])