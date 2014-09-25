angular.module("wogger").factory 'httpInterceptor',
httpInterceptor = ($q, $window, $location) ->
  (promise) ->
    success = (response) ->
      response

    error = (response) ->
      if response.status is 401
        $location.url '/login'
      $q.reject(response)

    promise.then(success, error)
